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

            int[] maxIdxs = (int[]) TypeParserHelper.getInstance().getAnnotationValue(listAnn, "maxIdx");

            // 检查是否还有更多的 List 维度
            if (maxIdxs != null && io.listIdx < maxIdxs.length) {
                int[] starts = (int[]) TypeParserHelper.getInstance().getAnnotationValue(listAnn, "start");

                String[] prefixes = (String[]) TypeParserHelper.getInstance().getAnnotationValue(listAnn, "prefix");
                boolean[] unsigneds = (boolean[]) TypeParserHelper.getInstance().getAnnotationValue(listAnn, "unsigned");
                boolean[] coverings = (boolean[]) TypeParserHelper.getInstance().getAnnotationValue(listAnn, "coveringUnsigned");

                int start = (starts != null && io.listIdx < starts.length) ? starts[io.listIdx] : 0;
                int max = maxIdxs[io.listIdx];
                if (start > max) {
                    throw new IllegalArgumentException("start > maxIdx at list dimension: " + io.listIdx);
                }

                // 累加 prefix
                if (prefixes != null && io.listIdx < prefixes.length) {
                    io.prefixPattern += prefixes[io.listIdx];
                }

                // 累加覆盖标志（如果没有设置则不变）
                if (!io.coveringUnsigned) {
                    if (coverings != null && io.listIdx < coverings.length){
                        io.coveringUnsigned = coverings[io.listIdx];
                        if (unsigneds != null && io.listIdx < unsigneds.length) io.unsigned = unsigneds[io.listIdx];
                    }
                }
                io.listIdx++;

                return new ListedXComponentConnector(io, start, max, annotations);
            }

            // 如果 listIdx 超出，则表示 list 结构已经结束，fall through 到 pin/bundle
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

            io.listIdx = -1;
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
