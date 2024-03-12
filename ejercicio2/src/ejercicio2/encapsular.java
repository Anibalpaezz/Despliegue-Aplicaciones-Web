package ejercicio2;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Anibal
 */
public class encapsular {
    private Connection conexion;
    private String host;
    private String usuario;
    private String contraseña;
    private String baseDeDatos;

    public encapsular(String host, String usuario, String contraseña, String baseDeDatos) {
        this.host = host;
        this.usuario = usuario;
        this.contraseña = contraseña;
        this.baseDeDatos = baseDeDatos;
    }

    public void conectar() {
        try {
            String url = "jdbc:mysql://" + host + "/" + baseDeDatos;
            conexion = DriverManager.getConnection(url, usuario, contraseña);
            System.out.println("Conexión establecida con la base de datos");
        } catch (SQLException e) {
            System.err.println("Error al conectar a la base de datos: " + e.getMessage());
        }
    }

    public ResultSet consultar(String consulta) {
        ResultSet resultado = null;
        try {
            PreparedStatement statement = conexion.prepareStatement(consulta);
            resultado = statement.executeQuery();
        } catch (SQLException e) {
            System.err.println("Error al ejecutar la consulta: " + e.getMessage());
        }
        return resultado;
    }

    public void insertar(String consulta, Object... valores) {
        try {
            PreparedStatement statement = conexion.prepareStatement(consulta);
            for (int i = 0; i < valores.length; i++) {
                statement.setObject(i + 1, valores[i]);
            }
            statement.executeUpdate();
            System.out.println("Inserción exitosa");
        } catch (SQLException e) {
            System.err.println("Error al realizar la inserción: " + e.getMessage());
        }
    }

    public void actualizar(String consulta, Object... valores) {
        try {
            PreparedStatement statement = conexion.prepareStatement(consulta);
            for (int i = 0; i < valores.length; i++) {
                statement.setObject(i + 1, valores[i]);
            }
            statement.executeUpdate();
            System.out.println("Actualización exitosa");
        } catch (SQLException e) {
            System.err.println("Error al realizar la actualización: " + e.getMessage());
        }
    }

    public void cerrar() {
        try {
            if (conexion != null) {
                conexion.close();
                System.out.println("Conexión cerrada");
            }
        } catch (SQLException e) {
            System.err.println("Error al cerrar la conexión: " + e.getMessage());
        }
    }

    public static void main(String[] args) {
        String host = "tu_host";
        String usuario = "tu_usuario";
        String contraseña = "tu_contraseña";
        String baseDeDatos = "tu_base_de_datos";

        encapsular conexion = new encapsular(host, usuario, contraseña, baseDeDatos);
        conexion.conectar();

        //SELECT
        ResultSet resultados = conexion.consultar("SELECT * FROM mi_tabla");

        //INSERT
        String insertQuery = "INSERT INTO mi_tabla (campo1, campo2) VALUES (?, ?)";
        conexion.insertar(insertQuery, "valor1", "valor2");

        //UPDATE
        String updateQuery = "UPDATE mi_tabla SET campo1 = ? WHERE campo2 = ?";
        conexion.actualizar(updateQuery, "nuevo_valor", "valor2");

        conexion.cerrar();
    }
}
