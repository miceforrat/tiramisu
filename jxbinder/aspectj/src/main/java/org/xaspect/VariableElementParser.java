package org.xaspect;

import javax.lang.model.element.Element;
import javax.lang.model.element.VariableElement;

public class VariableElementParser implements ElementParser<VariableElement> {
    @Override
    public AnalyzeInfos analyzeElement(VariableElement element) {
        AnalyzeInfos infos = new AnalyzeInfos();
        infos.elementType = element.asType();
        infos.annotations = element.getAnnotationMirrors();
        infos.fieldName = element.getSimpleName().toString();
        return infos;
    }
}
