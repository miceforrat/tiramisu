package org.xaspect;

import org.xaspect.datas.Bundle;
import org.xaspect.datas.ListedXComponent;
import org.xaspect.datas.Pin;

import javax.lang.model.element.AnnotationMirror;
import java.util.List;
import java.util.Optional;

public class ConnectorFactory {
    public static XComponentConnector buildConnector(IOParameters ios, List<? extends AnnotationMirror> annotations) {
        TypeParserHelper helper = TypeParserHelper.getInstance();

        Optional<AnnotationMirror> listAnnOpt = helper.getAnnotation(annotations, ListedXComponent.class);
        if (listAnnOpt.isPresent()) {
            AnnotationMirror listAnn = listAnnOpt.get();
            IOParameters io = ios.copy();

            List<Integer> maxIdxs = helper.getAnnotationIntList(listAnn, "maxIdx");

            // 检查是否还有更多的 List 维度
            if (io.listIdx < maxIdxs.size()) {
                List<Integer> starts = helper.getAnnotationIntList(listAnn, "start");
                List<String> prefixes = helper.getAnnotationStringList(listAnn, "prefix");
                List<Boolean> unsigneds = helper.getAnnotationBooleanList(listAnn, "unsigned");
                List<Boolean> coverings = helper.getAnnotationBooleanList(listAnn, "coveringUnsigned");

                int start = (io.listIdx < starts.size()) ? starts.get(io.listIdx) : 0;
                int max = maxIdxs.get(io.listIdx);

                if (start > max) {
                    throw new IllegalArgumentException("start > maxIdx at list dimension: " + io.listIdx);
                }

                if (io.listIdx < prefixes.size()) {
                    io.prefixPattern += prefixes.get(io.listIdx);
                }

                if (!io.coveringUnsigned && io.listIdx < coverings.size() && coverings.get(io.listIdx)) {
                    io.coveringUnsigned = true;
                    if (io.listIdx < unsigneds.size()) {
                        io.unsigned = unsigneds.get(io.listIdx);
                    }
                }

                io.listIdx++;

                return new ListedXComponentConnector(io, start, max, annotations);
            }

            // listIdx 已超出，fall through 到 pin/bundle 分析
        }


        // ✅ 优先判断注解是否是 @Pin
        Optional<AnnotationMirror> pinAnn = helper.getAnnotation(annotations, Pin.class);

        //create pinConnector
        if (pinAnn.isPresent()) {
            IOParameters io = ios.copy();

            AnnotationMirror pinAnnMirror = pinAnn.get();
            String value = (String) TypeParserHelper.getInstance().getAnnotationValue(pinAnnMirror, "value");
            Boolean unsigned = (Boolean) TypeParserHelper.getInstance().getAnnotationValue(pinAnnMirror, "unsigned");
            if (value == null || value.isEmpty()) {
                io.prefixPattern += io.defaultPinNameFromFieldName;
            } else {
                io.prefixPattern += value;
            }
            if (!io.coveringUnsigned && unsigned != null) {
                io.unsigned = unsigned;
            }

            io.isPin = true;

            return new PinConnector(io);
        }

        List<Optional<AnnotationMirror>> bundleAnnotations = List.of(
                helper.getAnnotation(annotations, Bundle.class),
                Optional.ofNullable(helper.getTypeElementFromTypeMirror(ios.varType))
                        .flatMap(el -> helper.getAnnotation(el.getAnnotationMirrors(), Bundle.class))
        );

        boolean isBundle = bundleAnnotations.stream().anyMatch(Optional::isPresent);

        if (isBundle) {
            IOParameters io = ios.copy();
            io.listIdx = 0;
            for (Optional<AnnotationMirror> annOpt : bundleAnnotations) {
                if (annOpt.isEmpty()) continue;

                AnnotationMirror ann = annOpt.get();
                String value = (String) helper.getAnnotationValue(ann, "value");

                if (value != null) {
                    io.prefixPattern += value;
                }

                if (!io.coveringUnsigned) {
                    Boolean unsigned = (Boolean) helper.getAnnotationValue(ann, "unsigned");
                    Boolean coveringUnsigned = (Boolean) helper.getAnnotationValue(ann, "coveringUnsigned");

                    if (unsigned != null) io.unsigned = unsigned;
                    if (coveringUnsigned != null) io.coveringUnsigned = coveringUnsigned;
                }
            }

            return new BundleConnector(io);
        }

        return null;


    }
}
