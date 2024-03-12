/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package despliegue.servlet;
import java.sql.*;
/**
 *
 * @author Anibal
 */
public class conexion {
    public conexion laConex;
    
    public conexion() throws Exception {
        Class.forName("com.mysql.jdbc.Driver");
        this.laConex = (conexion) DriverManager.getConnection("jdbc:mysql://localhost:3306/accesodatos", "anibal", "1234");
    }
    
    public boolean comprobarUsuario(String username, String pass) throws Exception {
        String consulta = "SELECT * FROM usuarios WHERE usuario=? AND pass=?";
        PreparedStatement elStatementpreparado = this.laConex.prepareStatement(consulta, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
        
        
        elStatementpreparado.setString(1, username);
        elStatementpreparado.setString(2, pass);
        
        ResultSet elresul = elStatementpreparado.executeQuery();
        if(elresul.absolute(1)){
            elStatementpreparado.close();
            elresul.close();
            laConex.close();
            
            return true;
        } else {
            return false
        }
        
    }
}
