import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/login")
public class login extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        try {
            Class.forName("com.mysql.jdbc.Driver");

            String url = "jdbc:mysql://localhost:3306/tienda_juegos";
            String dbUsername = "anibal";
            String dbPassword = "nico";
            conn = DriverManager.getConnection(url, dbUsername, dbPassword);

            String consulta = "SELECT * FROM usuarios WHERE nombre_usuario=? AND contrasena=?";
            stmt = conn.prepareStatement(consulta);
            stmt.setString(1, username);
            stmt.setString(2, password);
            rs = stmt.executeQuery();

            if (rs.next()) {
                boolean isAdmin = rs.getBoolean("es_administrador");

                if (isAdmin) {
                    String user = username.substring(0, 1).toUpperCase() + username.substring(1).toLowerCase();
                    HttpSession session = request.getSession(true);
                    session.setAttribute("admin", username);
                    session.setAttribute("user", username);
                    response.sendRedirect("admin.jsp");
                } else {
                    String user = username.substring(0, 1).toUpperCase() + username.substring(1).toLowerCase();
                    HttpSession session = request.getSession(true);
                    session.setAttribute("user", username);
                    response.sendRedirect("user.jsp");
                }
            } else {
                out.println("<p>Error: Usuario o contraseña incorrectos.</p>");
                out.println(username);
                out.println(password);
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            out.println("Error: " + e.getMessage());
        } finally {
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
