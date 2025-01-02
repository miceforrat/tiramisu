package org.xaspect;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.PARAMETER)
public @interface InBundle {
    String value() default ""; // prefix
    boolean coveringUnsigned() default false;
    boolean unsigned() default true;
}
