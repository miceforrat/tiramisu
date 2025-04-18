package org.xaspect.datas;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.FIELD)
public @interface ListedXComponent {
    String[] prefix() default {""};
    int[] start() default {0};
    int[] maxIdx();
    boolean[] unsigned() default {};
    boolean[] coveringUnsigned() default {};
}
