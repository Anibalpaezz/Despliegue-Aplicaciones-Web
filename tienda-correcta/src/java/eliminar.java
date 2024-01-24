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

@WebServlet("/eliminacion")
public class eliminar extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String[] seleccion = request.getParameterValues("seleccion[]");
        String paginaOrigen = request.getParameter("paginaOrigen");
        if ("elim_consolas".equals(paginaOrigen)) {
            paginaOrigen = "consolas";
        }

        if (seleccion != null && paginaOrigen != null && ("juegos".equals(paginaOrigen) || "consolas".equals(paginaOrigen))) {
            Connection conn = null;
            PreparedStatement stmt_eliminar = null;

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                String url = "jdbc:mysql://localhost:3306/tienda_juegos";
                String user = "anibal";
                String password = "nico";
                conn = DriverManager.getConnection(url, user, password);

                String eliminar = "DELETE FROM " + paginaOrigen + " WHERE nombre = ?";
                stmt_eliminar = conn.prepareStatement(eliminar);

                int correctas = 0;
                boolean fallida = false;
                String eliminados = "";
                String no_eliminados = "";

                for (String elemento : seleccion) {
                    stmt_eliminar.setString(1, elemento);
                    int filas = stmt_eliminar.executeUpdate();

                    if (filas > 0) {
                        correctas++;
                        eliminados += elemento + ", ";
                    } else {
                        fallida = true;
                        no_eliminados += elemento + ", ";
                    }
                }
                if (correctas > 0) {
                    response.getWriter().println("<h1>Eliminado correctamente</h1>");
                    response.getWriter().println("<p>Elementos eliminados: " + eliminados + "</p>");
                    response.getWriter().println("<button onclick='history.go(-1);'>Volver</button>");
                }
                if (fallida) {
                    response.getWriter().println("<h1>Error en el borrado</h1>");
                    response.getWriter().println("<p>Elementos no eliminados: " + no_eliminados + "</p>");
                    response.getWriter().println("<button onclick='history.go(-1);'>Volver</button>");
                }
            } catch (ClassNotFoundException | SQLException e) {
                e.printStackTrace();
                response.getWriter().println("Error: " + e.getMessage());
            } finally {
                try {
                    if (stmt_eliminar != null) {
                        stmt_eliminar.close();
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                try {
                    if (conn != null) {
                        conn.close();
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        } else {
            response.getWriter().println("Error");
        }
    }
}
