package helpers;

import com.github.javafaker.Faker;

public class DataGenerator {
    public static String getRandomEmail(){
        Faker faker = new Faker();
        return faker.name().firstName().toLowerCase()+faker.random().nextInt(0,999)+"@gmail.com";
    }
    public  static String getRandomUsername(){
        Faker faker = new Faker();
        return faker.name().username();
    }
    public String notStaticMethod(){
        return "Not a static method";
    }
}
