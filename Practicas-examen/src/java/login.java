/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import com.sun.jdi.connect.spi.Connection;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 *
 * @author apg
 */
public class login extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet login</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet login at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
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

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String referencia = request.getHeader("Referer");
        String correcta = "http://localhost:8080/Practicas-examen/formulario2.jsp";

        if (referencia == null || !referencia.equals(correcta)) {
            response.sendRedirect("index.html");
            return;
        } else {
            response.getWriter().println("Bienvenido");

            String jdbcUrl = "jdbc:mysql://localhost:3306/examen";
            String usuario = "anibal";
            String clave = "nico";

            int nombre = Integer.parseInt(request.getParameter("nombre"));
            int pass = Integer.parseInt(request.getParameter("pass"));

            try {
    // Cargar el controlador de la base de datos
    Class.forName("com.mysql.cj.jdbc.Driver");

    // Establecer la conexión
    try (Connection connection = DriverManager.getConnection(jdbcUrl, usuario, clave)) {
        // Consulta preparada
        String sql = "SELECT nombre, pass FROM usuarios WHERE nombre = ? AND pass = ?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setString(1, nombre);  // Deberías usar setString para el nombre
            preparedStatement.setString(2, password); // Asegúrate de tener una variable 'password' con la contraseña proporcionada

            // Ejecutar la consulta
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    response.getWriter().println("Correcto");
                } else {
                    response.getWriter().println("Usuario o contraseña incorrectos");
                }
            }
        }
    }
} catch (ClassNotFoundException | SQLException e) {
    e.printStackTrace();
}

        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
