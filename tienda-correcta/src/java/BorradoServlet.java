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

@WebServlet("/BorradoServlet")
public class BorradoServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String[] seleccionJuegos = request.getParameterValues("seleccionJuegos");
        String[] seleccionConsolas = request.getParameterValues("seleccionConsolas");

        Connection conn = null;
        PreparedStatement pstmtJuegos = null;
        PreparedStatement pstmtConsolas = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/tienda_juegos";
            String user = "anibal";
            String password = "nico";
            conn = DriverManager.getConnection(url, user, password);

            if (seleccionJuegos != null) {
                String deleteQueryJuegos = "DELETE FROM juegos WHERE nombre = ?";
                pstmtJuegos = conn.prepareStatement(deleteQueryJuegos);

                for (String juegoNombre : seleccionJuegos) {
                    pstmtJuegos.setString(1, juegoNombre);
                    pstmtJuegos.executeUpdate();
                }
            }

            if (seleccionConsolas != null) {
                String deleteQueryConsolas = "DELETE FROM consolas WHERE nombre = ?";
                pstmtConsolas = conn.prepareStatement(deleteQueryConsolas);

                for (String consolaNombre : seleccionConsolas) {
                    pstmtConsolas.setString(1, consolaNombre);
                    pstmtConsolas.executeUpdate();
                }
            }

            response.getWriter().println("Registros eliminados con éxito");
            response.getWriter().println("<a href='borrado.jsp'>Volver</a>");

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        } finally {
            try {
                if (pstmtJuegos != null) {
                    pstmtJuegos.close();
                }
                if (pstmtConsolas != null) {
                    pstmtConsolas.close();
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
