package org.xaspect;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;


/**
 * The class of the field decorated with @AutoDUTDao
 * should provide default non param constructor
 */
@Retention(RetentionPolicy.RUNTIME)
@Target({ElementType.FIELD, ElementType.METHOD })
public @interface AutoDUTDao {

    String value() default "";
}
