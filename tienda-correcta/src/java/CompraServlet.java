import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/compra")
public class CompraServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String[] seleccion = request.getParameterValues("seleccion[]");
        String paginaOrigen = request.getParameter("paginaOrigen");

        if (seleccion != null && paginaOrigen != null && (paginaOrigen.equals("juegos") || paginaOrigen.equals("consolas"))) {
            Connection conn = null;
            PreparedStatement pstmtSelect = null;
            PreparedStatement pstmtUpdate = null;

            try {
                Class.forName("com.mysql.jdbc.Driver");
                String url = "jdbc:mysql://localhost:3306/tienda_juegos";
                String user = "anibal";
                String password = "nico";
                conn = DriverManager.getConnection(url, user, password);

                String selectQuery = "SELECT unidades_disponibles FROM " + paginaOrigen + " WHERE nombre = ?";
                pstmtSelect = conn.prepareStatement(selectQuery);

                String updateQuery = "UPDATE " + paginaOrigen + " SET unidades_disponibles = unidades_disponibles - 1 WHERE nombre = ?";
                pstmtUpdate = conn.prepareStatement(updateQuery);

                int comprasExitosas = 0;
                boolean alMenosUnaCompraFallida = false;
                String elementosComprados = "";
                String elementosNoComprados = "";

                for (String elemento : seleccion) {
                    pstmtSelect.setString(1, elemento);
                    ResultSet resultSet = pstmtSelect.executeQuery();

                    if (resultSet.next()) {
                        int unidadesDisponibles = resultSet.getInt("unidades_disponibles");

                        if (unidadesDisponibles > 0) {
                            pstmtUpdate.setString(1, elemento);
                            pstmtUpdate.executeUpdate();

                            comprasExitosas++;

                            elementosComprados += elemento + ", ";
                        } else {
                            alMenosUnaCompraFallida = true;
                            elementosNoComprados += elemento + ", ";
                        }
                    }
                }
                if (comprasExitosas > 0) {
                    response.getWriter().println("<h1>Compra realizada</h1>");
                    response.getWriter().println("<p>Elementos comprados: " + elementosComprados + "</p>");
                    response.getWriter().println("<button onclick='history.go(-1);'>Volver atras</button>");
                }
                if (alMenosUnaCompraFallida) {
                    response.getWriter().println("<h1>Falta de stock</h1>");
                    response.getWriter().println("<p>Elementos no comprados: " + elementosNoComprados + "</p>");
                    response.getWriter().println("<button onclick='history.go(-1);'>Volver atras</button>");
                }
            } catch (ClassNotFoundException | SQLException e) {
                e.printStackTrace();
                response.getWriter().println("Error: " + e.getMessage());
            } finally {
                try {
                    if (pstmtSelect != null) {
                        pstmtSelect.close();
                    }
                    if (pstmtUpdate != null) {
                        pstmtUpdate.close();
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
