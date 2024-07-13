import com.intuit.karate.junit5.Karate;



public class RunnerTest {

    @Karate.Test
    Karate testSystemProperty() {
        return Karate.run("classpath:Features/petStore.feature")
                .tags("@PetStore")
                .karateEnv("cert");

    }
}
