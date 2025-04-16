package org.xaspect;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.METHOD)
public @interface GetMethod {
    String prefix() default "";
    boolean isPin();
    boolean coveringUnsigned() default false;
    boolean unsigned() default true;
}
