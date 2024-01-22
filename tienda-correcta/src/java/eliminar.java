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
            PreparedStatement pstmtDelete = null;

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                String url = "jdbc:mysql://localhost:3306/tienda_juegos";
                String user = "anibal";
                String password = "nico";
                conn = DriverManager.getConnection(url, user, password);

                String deleteQuery = "DELETE FROM " + paginaOrigen + " WHERE nombre = ?";
                pstmtDelete = conn.prepareStatement(deleteQuery);

                int eliminacionesExitosas = 0;
                boolean alMenosUnaEliminacionFallida = false;
                String elementosEliminados = "";
                String elementosNoEliminados = "";

                for (String elemento : seleccion) {
                    pstmtDelete.setString(1, elemento);
                    int rowsAffected = pstmtDelete.executeUpdate();

                    if (rowsAffected > 0) {
                        eliminacionesExitosas++;
                        elementosEliminados += elemento + ", ";
                    } else {
                        alMenosUnaEliminacionFallida = true;
                        elementosNoEliminados += elemento + ", ";
                    }
                }
                if (eliminacionesExitosas > 0) {
                    response.getWriter().println("<h1>Eliminado correctamente</h1>");
                    response.getWriter().println("<p>Elementos eliminados: " + elementosEliminados + "</p>");
                    response.getWriter().println("<button onclick='history.go(-1);'>Volver</button>");
                }
                if (alMenosUnaEliminacionFallida) {
                    response.getWriter().println("<h1>Error en el borrado</h1>");
                    response.getWriter().println("<p>Elementos no eliminados: " + elementosNoEliminados + "</p>");
                    response.getWriter().println("<button onclick='history.go(-1);'>Volver</button>");
                }
            } catch (ClassNotFoundException | SQLException e) {
                e.printStackTrace();
                response.getWriter().println("Error: " + e.getMessage());
            } finally {
                try {
                    if (pstmtDelete != null) {
                        pstmtDelete.close();
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
