package org.xaspect;

import javax.lang.model.element.Element;

public interface ElementParser<T extends Element> {
    AnalyzeInfos analyzeElement(T element);
}
