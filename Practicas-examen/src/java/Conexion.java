import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
@WebServlet("/ConexionServlet")
public class Conexion extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static Connection conexion;

    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        // Configurar la conexión aquí
        String url = "jdbc:mysql://localhost:3306/tu_base_de_datos";
        String usuario = "tu_usuario";
        String contraseña = "tu_contraseña";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conexion = DriverManager.getConnection(url, usuario, contraseña);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            // Manejar la excepción de alguna manera apropiada
        }
    }

    public static Connection getConexion() {
        return conexion;
    }

    public void destroy() {
        try {
            if (conexion != null && !conexion.isClosed()) {
                conexion.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Manejar la excepción de alguna manera apropiada
        }
    }
}
