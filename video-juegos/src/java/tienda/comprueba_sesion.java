package tienda;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/LoginServlet")
public class comprueba_sesion extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Lógica de autenticación (puedes reemplazar esto con tu propia lógica)
        boolean isAdmin = authenticate(username, password);

        if (isAdmin) {
            // Si el usuario es administrador, redirige a un JSP específico para administradores
            response.sendRedirect("admin.jsp");
        } else {
            // Si el usuario no es administrador, redirige a un JSP para usuarios normales
            response.sendRedirect("user.jsp");
        }
    }

    // Método de autenticación simple (reemplázalo con tu propia lógica de autenticación)
    private boolean authenticate(String username, String password) {
        // Aquí deberías realizar la autenticación real con una base de datos u otro mecanismo
        // Devuelve true si el usuario es administrador, false si no lo es
        return username.equals("admin") && password.equals("admin123");
    }
}
