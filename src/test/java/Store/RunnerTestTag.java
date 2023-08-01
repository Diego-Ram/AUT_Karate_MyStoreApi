package Store;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;

class RunnerTestTag {

    @Test
    void testParallel() {
        Results results = Runner.path().relativeTo(getClass())
                .tags("@Smoke")
                //.tags("@Smoke" , "@Regression")
                //.outputCucumberJson(true)
                .parallel(5);
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }

}
