package org.xaspect;

import javax.lang.model.element.AnnotationMirror;
import javax.lang.model.type.TypeMirror;
import java.util.List;

public class AnalyzeInfos {
    TypeMirror elementType;
    List<? extends AnnotationMirror> annotations;
    String fieldName;
}
