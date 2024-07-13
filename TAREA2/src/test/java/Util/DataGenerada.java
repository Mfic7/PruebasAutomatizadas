package Util;

import com.github.javafaker.Faker;

public class    DataGenerada {

    public static String getNombre(){
        Faker faker = new Faker();
        String nombre = faker.name().firstName();
        return nombre;
    }

    public static String getTrabajo(){
        Faker faker = new Faker();
        String trabajo = faker.job().title();
        return trabajo;
    }
}
