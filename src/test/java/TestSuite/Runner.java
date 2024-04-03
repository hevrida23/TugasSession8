package TestSuite;
import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class Runner {
    @Test
    public Karate runGet(){
        return Karate.run("pet").relativeTo((getClass()));
    }
}