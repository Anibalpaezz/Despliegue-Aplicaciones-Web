
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class login extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            response.getWriter().println("<!DOCTYPE html>");
            response.getWriter().println("<html>");
            response.getWriter().println("<head>");
            response.getWriter().println("<title>Servlet login</title>");
            response.getWriter().println("</head>");
            response.getWriter().println("<body>");
            response.getWriter().println("<h1>Servlet login at " + request.getContextPath() + "</h1>");
            response.getWriter().println("</body>");
            response.getWriter().println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String referencia = request.getHeader("Referer");
        String correcta = "http://localhost:8080/Practicas-examen/formulario2.jsp";

        if (referencia == null || !referencia.equals(correcta)) {
            response.sendRedirect("index.html");
            return;
        } else {
            response.getWriter().println("Bienvenido");
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String referencia = request.getHeader("Referer");
        String correcta = "http://localhost:8080/Practicas-examen/formulario2.jsp";

        if (referencia == null || !referencia.equals(correcta)) {
            response.sendRedirect("index.html");
            return;
        } else {

            String nombre = request.getParameter("nombre");
            String pass = request.getParameter("pass");

            Connection conn = null;
            PreparedStatement stmt = null;
            ResultSet rs = null;

            try {
                Class.forName("com.mysql.jdbc.Driver");

                String url = "jdbc:mysql://localhost:3306/examen";
                String dbUsername = "anibal";
                String dbPassword = "nico";
                conn = DriverManager.getConnection(url, dbUsername, dbPassword);

                String consulta = "SELECT * FROM usuarios WHERE nombre =? AND pass =?";
                stmt = conn.prepareStatement(consulta);
                stmt.setString(1, nombre);
                stmt.setString(2, pass);
                rs = stmt.executeQuery();

                if (rs.next()) {
                    response.getWriter().println("<p>Usuario o pass correctos.</p>");
                    response.getWriter().println("Bienveeeenido");
                } else {
                    response.getWriter().println("<p>Error: Usuario o pass incorrectos.</p>");
                    response.getWriter().println("NOOOOOO");
                    response.getWriter().println(nombre);
                    response.getWriter().println(pass);
                }
            } catch (ClassNotFoundException | SQLException e) {
                e.printStackTrace();
                response.getWriter().println("Error: " + e.getMessage());
            }

        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
