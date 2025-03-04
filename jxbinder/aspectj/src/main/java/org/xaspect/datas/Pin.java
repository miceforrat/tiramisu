package org.xaspect.datas;

import org.xaspect.WatchCondition;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;
import java.util.HashMap;
import java.util.Map;

@Retention(RetentionPolicy.RUNTIME)
@Target({ElementType.TYPE_USE, ElementType.FIELD})
public @interface Pin {
    String value() default "";
    boolean unsigned() default true;
}
