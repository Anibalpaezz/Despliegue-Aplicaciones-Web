package ejercicio2;
import java.util.Scanner;

public class Ejercicio2 {
    public static void main(String[] args) {
       Scanner miScanner = new Scanner(System.in);
       String ruta, bd, usuario, contraseña;
       System.out.println("Nombre de la BD");
       bd = miScanner.nextLine();
       System.out.println("Nombre de usuario");
       usuario = miScanner.nextLine();
       System.out.println("Contraseña del usuario");
       contraseña = miScanner.nextLine();
       ruta = "jdbc://mysql:/localhost:3306/" + bd;
       System.out.println(ruta);
    }
    
}
