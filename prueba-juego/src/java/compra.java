import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/compra")
public class compra extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Lógica para procesar la compra
        String[] itemsId = request.getParameterValues("seleccion[]");

        // Puedes realizar aquí las acciones necesarias, como registrar la compra en la base de datos, etc.

        // Actualizar la base de datos restando 1 en los campos correspondientes
        actualizarBaseDeDatos(itemsId);

        // Muestra un mensaje simple en la respuesta
        response.setContentType("text/html;charset=UTF-8");
        response.getWriter().println("<html><head><title>Compra Realizada</title></head><body>");
        response.getWriter().println("<h2>Compra realizada con éxito</h2>");
        response.getWriter().println("<button onclick=\"cerrarSesion()\">Cerrar Sesión</button>");
        response.getWriter().println("<script>");
        response.getWriter().println("function cerrarSesion() { window.location.href = '/ruta/cerrarSesion.jsp'; }");
        response.getWriter().println("</script>");
        response.getWriter().println("</body></html>");
    }

    private void actualizarBaseDeDatos(String[] itemsId) {
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/tienda_juegos";
            String user = "anibal";
            String password = "nico";
            conn = DriverManager.getConnection(url, user, password);

            // Actualizar la base de datos restando 1 en los campos correspondientes
            for (String itemId : itemsId) {
                String updateQuery = "UPDATE productos SET cantidad_disponible = cantidad_disponible - 1 WHERE nombre_producto = ?";
                stmt = conn.prepareStatement(updateQuery);
                stmt.setString(1, itemId);
                stmt.executeUpdate();
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (stmt != null) {
                    stmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
