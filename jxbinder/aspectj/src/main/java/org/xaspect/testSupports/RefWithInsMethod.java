package org.xaspect.testSupports;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.METHOD)
public @interface RefWithInsMethod {
    Class<?> refClass() default Object.class;
    String methodId() default "";
}
