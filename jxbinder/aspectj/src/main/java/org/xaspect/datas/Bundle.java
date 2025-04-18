package org.xaspect.datas;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Retention(RetentionPolicy.RUNTIME)
@Target({ElementType.TYPE, ElementType.METHOD, ElementType.FIELD, ElementType.PARAMETER})
public @interface Bundle {
    String value() default ""; // prefix to bind the bundle
    boolean coveringUnsigned() default false;
    boolean unsigned() default true;
}
