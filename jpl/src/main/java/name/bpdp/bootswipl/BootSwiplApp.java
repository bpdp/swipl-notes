package name.bpdp.bootswipl;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import org.springframework.boot.SpringApplication;
import org.springframework.context.annotation.Import;
 
@Import(BootSwiplConfig.class)
@SpringBootApplication
public class BootSwiplApp {

    public static void main(String[] args) {

        SpringApplication.run(BootSwiplApp.class, args);

    }

}
