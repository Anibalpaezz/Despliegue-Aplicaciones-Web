/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package despliegue.examen;

import java.sql.*;

/**
 *
 * @author Anibal
 */
public class Conexion {
    public Connection laconex;
    public ResultSet elresul;
    
    public Conexion() throws Exception {
        Class.forName("com.mysql.jdbc.Driver");
        this.laconex = DriverManager();
    }
}
