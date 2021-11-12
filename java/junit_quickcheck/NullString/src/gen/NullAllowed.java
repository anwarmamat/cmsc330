package gen;

import java.lang.annotation.Target;

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
public @interface NullAllowed {
    /**
     * @return probability of generating {@code null}, in the range [0,1]
     */
    double probability() default 0.2;
}