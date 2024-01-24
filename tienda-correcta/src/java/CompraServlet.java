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
            PreparedStatement stmt_select = null;
            PreparedStatement stmt_update = null;

            try {
                Class.forName("com.mysql.jdbc.Driver");
                String url = "jdbc:mysql://localhost:3306/tienda_juegos";
                String user = "anibal";
                String password = "nico";
                conn = DriverManager.getConnection(url, user, password);

                String consulta_select = "SELECT unidades_disponibles FROM " + paginaOrigen + " WHERE nombre = ?";
                stmt_select = conn.prepareStatement(consulta_select);

                String consulta_update = "UPDATE " + paginaOrigen + " SET unidades_disponibles = unidades_disponibles - 1 WHERE nombre = ?";
                stmt_update = conn.prepareStatement(consulta_update);

                int comprasExitosas = 0;
                boolean fallida = false;
                String comprado = "";
                String no_comprado = "";

                for (String elemento : seleccion) {
                    stmt_select.setString(1, elemento);
                    ResultSet resultSet = stmt_select.executeQuery();

                    if (resultSet.next()) {
                        int unidades_disponibles = resultSet.getInt("unidades_disponibles");

                        if (unidades_disponibles > 0) {
                            stmt_update.setString(1, elemento);
                            stmt_update.executeUpdate();

                            comprasExitosas++;

                            comprado += elemento + ", ";
                        } else {
                            fallida = true;
                            no_comprado += elemento + ", ";
                        }
                    }
                }
                if (comprasExitosas > 0) {
                    response.getWriter().println("<h1>Compra realizada</h1>");
                    response.getWriter().println("<p>Elementos comprados: " + comprado + "</p>");
                    response.getWriter().println("<button onclick='history.go(-1);'>Volver atras</button>");
                }
                if (fallida) {
                    response.getWriter().println("<h1>Falta de stock</h1>");
                    response.getWriter().println("<p>Elementos no comprados: " + no_comprado + "</p>");
                    response.getWriter().println("<button onclick='history.go(-1);'>Volver atras</button>");
                }
            } catch (ClassNotFoundException | SQLException e) {
                e.printStackTrace();
                response.getWriter().println("Error: " + e.getMessage());
            } finally {
                try {
                    if (stmt_select != null) {
                        stmt_select.close();
                    }
                    if (stmt_update != null) {
                        stmt_update.close();
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
