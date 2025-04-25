package org.xaspect;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.TYPE)
public @interface AutoDUT {
//    String value() default ""; // dut i
//    String id() default ""; // support for multiple examples
    String clockName() default "";
    String resetName() default "";
    long resetValue() default 1;
    long banResetValue() default 0;
    String waveFileName() default "";

    String covFileName() default "";
}
