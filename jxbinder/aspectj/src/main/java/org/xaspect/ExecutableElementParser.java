package org.xaspect;

import javax.lang.model.element.ExecutableElement;

public class ExecutableElementParser implements ElementParser<ExecutableElement> {

    private final String fieldName;

    ExecutableElementParser(String fieldName) {
        this.fieldName = fieldName;
    }

    @Override
    public AnalyzeInfos analyzeElement(ExecutableElement element) {
        AnalyzeInfos infos = new AnalyzeInfos();
        infos.fieldName = fieldName;
        infos.annotations = element.getAnnotationMirrors();
        infos.elementType = element.getReturnType();
        return infos;
    }
}
