package org.xaspect;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.FIELD)
public @interface AutoDUT {
    String value() default ""; // prefix for the whole dut, default is none
    String id() default ""; // support for multiple examples
    String clockName() default "";
}
