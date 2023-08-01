package Utils;
import net.datafaker.Faker;

public class DataGenerate {


    public static String user() {
        Faker faker = new Faker();
        return faker.name().username();
    }

    public static String pass(){
        Faker faker = new Faker();
        return faker.funnyName().name();
    }

    public static String nameProduct() {
        Faker faker = new Faker();
        return faker.food().allergen();
    }

    public static int price() {
        Faker faker = new Faker();
        return faker.number().numberBetween(100,500);
    }

    public static String manufacturer() {
        Faker faker = new Faker();
        return faker.name().title();
    }

    public static String category() {
        Faker faker = new Faker();
        return faker.food().dish();
    }

    public static String description() {
        Faker faker = new Faker();
        return faker.funnyName().name();
    }

    public static String tags() {
        Faker faker = new Faker();
        return faker.color().name();
    }

    public static String address() {
        Faker faker = new Faker();
        return faker.address().fullAddress();
    }

    public static String customer() {
        Faker faker = new Faker();
        return faker.eldenRing().npc();
    }

    public static int amount() {
        Faker faker = new Faker();
        return faker.number().numberBetween(1,100);
    }

}
