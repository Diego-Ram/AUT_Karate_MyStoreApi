package Store;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;

import static org.junit.jupiter.api.Assertions.*;

import net.masterthought.cucumber.*;
import net.masterthought.cucumber.Configuration;
import org.apache.commons.io.FileUtils;
import org.junit.jupiter.api.Test;

import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

class RunnerTest {

    @Test
    void testParallel() {
        Results results = Runner.path().relativeTo(getClass())
                //.outputCucumberJson(true)
                .parallel(5);
           assertEquals(0, results.getFailCount(), results.getErrorMessages());



    }

    /* ========================================================================================
            FALTA EJECUTAR PROYECTO DESDE LINEA DE COMANDOS ERROR POR VERSION DE JAVA (JRE)
       ========================================================================================
     */



}
