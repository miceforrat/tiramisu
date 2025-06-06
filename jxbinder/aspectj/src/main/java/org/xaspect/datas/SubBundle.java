package org.xaspect.datas;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Retention(RetentionPolicy.RUNTIME)
//@Target(ElementType.FIELD)
public @interface SubBundle {
    String value() default "";
    boolean coveringUnsigned() default false;
    boolean unsigned() default true;
}
