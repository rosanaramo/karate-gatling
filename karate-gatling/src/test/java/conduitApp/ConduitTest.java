package conduitApp;

import com.intuit.karate.KarateOptions;
import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import static org.junit.jupiter.api.Assertions.*;

import com.intuit.karate.junit5.Karate;
import org.junit.jupiter.api.Test;

class ConduitTest {

    @Test
    void testParallel() {
        Results results = Runner.path("classpath:conduitApp")
                //.outputCucumberJson(true)
                .parallel(5);
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }
//    @Karate.Test
//    Karate testTags() {
//        return Karate.run().tags("@debug").relativeTo(getClass());
//    }
    //To run by tags method use the following command
    // mvn test -Dtest=ConduitTest#testTags

    // Running with karate options : mvn test -Dkarate.options="--tags @debug"
    // use karate tag @ignore to ignore features or scenarios

    //Use the tag @skipme on feature or scenario to run all scenarios except the on with the tag skipme
    // mvn test -Dkarate.options="--tags ˜@skipme"
}
