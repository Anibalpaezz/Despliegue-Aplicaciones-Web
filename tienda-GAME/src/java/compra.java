import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/compra")
public class compra extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String[] seleccion = request.getParameterValues("seleccion[]");
        String paginaOrigen = request.getParameter("paginaOrigen");

        if (seleccion != null && paginaOrigen != null && paginaOrigen.equals("juegos") || paginaOrigen.equals("consolas")) {
            Connection conn = null;
            PreparedStatement pstmt = null;

            try {
                Class.forName("com.mysql.jdbc.Driver");
                String url = "jdbc:mysql://localhost:3306/tienda_juegos";
                String user = "anibal";
                String password = "nico";
                conn = DriverManager.getConnection(url, user, password);

                // Actualizar la base de datos para los juegos seleccionados
                String updateQuery = "UPDATE" + paginaOrigen + "SET unidades_disponibles = unidades_disponibles - 1 WHERE nombre_juego = ?";
                pstmt = conn.prepareStatement(updateQuery);

                for (String juego : seleccion) {
                    pstmt.setString(1, juego);
                    pstmt.executeUpdate();
                }

                response.getWriter().println("Compra realizada con éxito");
                response.getWriter().println(paginaOrigen);

            } catch (ClassNotFoundException | SQLException e) {
                e.printStackTrace();
                response.getWriter().println("Error: " + e.getMessage());
            } finally {
                try {
                    if (pstmt != null) {
                        pstmt.close();
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
            response.getWriter().println("Error: Parámetros incorrectos");
        }
    }
}
