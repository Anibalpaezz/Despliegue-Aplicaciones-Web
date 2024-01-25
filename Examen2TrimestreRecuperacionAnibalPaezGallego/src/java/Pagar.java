import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import static java.lang.System.out;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/compra")
public class Pagar extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection laconex = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.jdbc.Driver");
            String db = "serviciosDGT";
            String dbuser = "anibal";
            String dbpass = "nico";
            String url = "jdbc:mysql://localhost:3306/" + db;
            laconex = DriverManager.getConnection(url, dbuser, dbpass);

            /* ESTO SERIA ALGO ASI SUPONGO PERO NO ME FUNCIONA PERO MAS O MENOS CREO QUE SE POR DONDE IBA
            String historico = "SELECT * FROM multas WHERE idUsuario = 1";
            stmt = laconex.prepareStatement(historico);
            rs = stmt.executeQuery();

            String rutaArchivo = "web/WEB-INF/historico.txt";
            String contenido = rs.getInt("IdMulta") + rs.getString("tipoInfraccion") + rs.getDouble("cantidad"); + rs.getInt("idUsuario");

            try (BufferedWriter writer = new BufferedWriter(new FileWriter(rutaArchivo, true))) {
                writer.write(contenido);
                writer.newLine();
            } catch (IOException e) {
                out.println("Error al escribir en el archivo: " + e.getMessage());
            }*/

            String consulta = "DELETE FROM multas WHERE idUsuario = 1";
            stmt = laconex.prepareStatement(consulta);
            //rs = stmt.executeQuery();
            stmt.executeUpdate();
            
            response.sendRedirect("Administradores.jsp");
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        } finally {
            try {
                if (stmt != null) {
                    stmt.close();
                }
                if (laconex != null) {
                    laconex.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
