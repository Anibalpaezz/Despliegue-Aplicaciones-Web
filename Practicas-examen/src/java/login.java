/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

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
                    out.println("<p>Error: Usuario o contraseña correctos.</p>");
                    response.getWriter().println("Bienvenido");
                } else {
                    out.println("<p>Error: Usuario o contraseña incorrectos.</p>");
                    response.getWriter().println("NOOOOOO");
                    out.println(nombre);
                    out.println(pass);
                }
            } catch (ClassNotFoundException | SQLException e) {
                e.printStackTrace();
                out.println("Error: " + e.getMessage());
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
