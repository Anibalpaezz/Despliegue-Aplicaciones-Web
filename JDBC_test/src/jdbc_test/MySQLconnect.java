
package jdbc_test;
import java.sql.*;


public class MySQLconnect {
    public static void main(String[] args) {
        try {
            //Class.forName("com.mysql.jdbc.Driver");
            //PASO 1: Conexion con la base de datos
            Connection miconex = DriverManager.getConnection("jdbc:mysql://localhost:3306/accesodatos","anibal","1234");
            //PASO 2: Objeto de tipo conexion que sirve para hacer consultas
            Statement miStatement = miconex.createStatement();
            //PASO 3: Resultset guarda el resultado de la consulta
            ResultSet miResultSet = miStatement.executeQuery("Select * from productos");
            //PASO 4: Recorrer lo que nos devuelve la tabla para ver los datos
            while (miResultSet.next()) {
                System.out.println("Codigo articulo: " + miResultSet.getString("CÓDIGOARTÍCULO"));
                System.out.println("Nombre articulo: " + miResultSet.getString("NOMBREARTÍCULO"));
                System.out.println("Precio: " + miResultSet.getString("PRECIO"));
                System.out.println("Origen: " + miResultSet.getString("PAISDEORIGEN"));
                System.out.println("-----------------");
            }
            miResultSet.close();
            miStatement.close();
            miconex.close();

        } catch (Exception e) {
            System.out.println("Fatal error" +  e.getMessage());
        }
    }
}
