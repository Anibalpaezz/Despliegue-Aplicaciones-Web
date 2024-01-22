/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package gamepackage;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author pablo
 */
public class InfoConsolas {

    public Connection laConexion;

    public InfoConsolas(Connection conexion) {
        this.laConexion = conexion;
    }

    public void mostrarInfoConsolas() {
        try {
            String consulta = "SELECT * FROM consolas";
            PreparedStatement elStatementPreparado = laConexion.prepareStatement(consulta);
            ResultSet elResultado = elStatementPreparado.executeQuery();


            System.out.printf("%-20s%-20s%-20s%-20s%-20s%-20s\n", "Nombre consola", "CPU", "GPU", "Compañía", "Precio", "Stock");
            System.out.println("------------------------------------------------------------------------------------------------------------------");


            while (elResultado.next()) {
                String nombreConsola = elResultado.getString("nombre");
                String cpu = elResultado.getString("cpu");
                String gpu = elResultado.getString("gpu");
                String compania = elResultado.getString("compania");
                double precio = elResultado.getDouble("precio");
                int stock = elResultado.getInt("stock");


                System.out.printf("%-20s%-20s%-20s%-20s%-20s%-20s\n", nombreConsola, cpu, gpu, compania, precio, stock);
            }

            elStatementPreparado.close();
            elResultado.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        try {
            Conexion conexion = new Conexion();
            InfoConsolas infoConsolas = new InfoConsolas(conexion.laConexion);
            infoConsolas.mostrarInfoConsolas();

            // Cierra la conexión 
            conexion.laConexion.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}