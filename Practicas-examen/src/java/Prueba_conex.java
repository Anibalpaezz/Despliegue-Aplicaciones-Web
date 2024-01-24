import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet("/OtroServlet")
public class Prueba_conex extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        Connection conexion = Conexion.getConexion();

        // Query para obtener datos de la tabla usuarios
        String query = "SELECT id, nombre, correo FROM usuarios";

        try {
            // Preparar la declaración
            PreparedStatement preparedStatement = conexion.prepareStatement(query);

            // Ejecutar la consulta
            ResultSet resultSet = preparedStatement.executeQuery();

            // Procesar y mostrar los resultados en la respuesta HTTP
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String nombre = resultSet.getString("nombre");
                String correo = resultSet.getString("correo");

                out.println("ID: " + id + ", Nombre: " + nombre + ", Correo: " + correo + "<br>");
            }

        } catch (Exception e) {
            e.printStackTrace();
            // Manejar la excepción de alguna manera apropiada
        }
    }
}
