package TestSuite;
import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class Runner {
    @Test
    public Karate runRecipes(){
        return Karate.run("Recipes/recipes").relativeTo((getClass()));
    }
}