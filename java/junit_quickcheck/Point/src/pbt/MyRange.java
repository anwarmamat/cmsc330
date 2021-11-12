package pbt;

import static java.lang.annotation.ElementType.ANNOTATION_TYPE;
import static java.lang.annotation.ElementType.FIELD;
import static java.lang.annotation.ElementType.PARAMETER;
import static java.lang.annotation.ElementType.TYPE_USE;
import static java.lang.annotation.RetentionPolicy.RUNTIME;
import java.lang.annotation.Retention;
import java.lang.annotation.Target;
import com.pholser.junit.quickcheck.generator.GeneratorConfiguration;

@Target({ PARAMETER, FIELD, ANNOTATION_TYPE, TYPE_USE })
@Retention(RUNTIME)
@GeneratorConfiguration
public @interface MyRange {
    int max();
    int min();
}