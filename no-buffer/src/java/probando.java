/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author Anibal
 */

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

public class probando {
    public static void leer(String fichero) {
        try {
            FileReader entrada = new FileReader(fichero);
            int letraunicode = 0;
            char letratexto;
            try {
                do {
                    letraunicode = entrada.read();
                    letratexto = (char)letraunicode;
                    System.out.println(letratexto);
                } while (letraunicode != -1);
                entrada.close();
            } catch (IOException e) {
                System.out.println("No se pudo leer la letra");
            }
        } catch (FileNotFoundException e) {
            System.out.println("Fichero o encontrado");
        }
    }
}
