/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package gamepackage;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */


import java.sql.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Conexion{
    public Connection laConexion;
            
            public Conexion() throws Exception{
                
                Class.forName("com.mysql.jdbc.Driver");//driver
                this.laConexion=DriverManager.getConnection("jdbc:mysql://localhost:3306/game","daw2","1234");//bbdd
            }
            
            public boolean comprobarUsuario(String user, String pass) throws Exception{
                String consulta = "SELECT * FROM usuarios WHERE nombre=? AND password=?";
                PreparedStatement elStatementPreparado=this.laConexion.prepareStatement(consulta,
              ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
                elStatementPreparado.setString(1, user);
                elStatementPreparado.setString(2, pass);
                
                ResultSet elResultado=elStatementPreparado.executeQuery();
                
                if(elResultado.absolute(1)){
                    elStatementPreparado.close();
                    elResultado.close();
                    laConexion.close();
                    return true;
                }else{
                    elStatementPreparado.close();
                    elResultado.close();
                    this.laConexion.close();
                    return false;
                }
            }
               
}


