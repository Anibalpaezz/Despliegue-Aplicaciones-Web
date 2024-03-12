package despliegue.servlet;
import java.sql.*;
public class Conexion {
    public Connection laConexion;
    
    public Conexion() throws Exception{
        Class.forName("com.mysql.jdbc.Driver");
        this.laConexion=DriverManager.getConnection("jdbc:mysql://localhost:3306/accesodatos","daw2","1234");
    }
    
    public boolean comprobarUsuario(String username, String pass) throws Exception{
        String consulta="SELECT * FROM usuarios WHERE usuario=? AND pass=?";
        PreparedStatement elStatementPreparado=this.laConexion.prepareStatement(consulta,
                ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
        elStatementPreparado.setString(1, username);
        elStatementPreparado.setString(2, pass);
        ResultSet elResultado=elStatementPreparado.executeQuery();
        if(elResultado.absolute(1)){
            elStatementPreparado.close();
            elResultado.close();
            this.laConexion.close();
            return true; 
        }else{
            elStatementPreparado.close();
            elResultado.close();
            this.laConexion.close();
            return false;
        }
    }
    
    public boolean insertarUsuario(String usuario, String pass) throws Exception{
        String consulta="INSERT INTO usuarios (usuario, pass) VALUES (?,?)";
        PreparedStatement elStatementPreparado=this.laConexion.prepareStatement(consulta);
        elStatementPreparado.setString(1, usuario);
        elStatementPreparado.setString(2, pass);
        elStatementPreparado.executeUpdate();
        this.laConexion.close();
        elStatementPreparado.close();
        return true;
    }
}
