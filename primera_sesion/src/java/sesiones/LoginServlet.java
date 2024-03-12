import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Perform authentication logic (you might want to check credentials against a database)

        // For simplicity, let's assume any non-empty username and password combination is valid
        if (username != null && !username.isEmpty() && password != null && !password.isEmpty()) {
            // Create or retrieve a session
            HttpSession session = request.getSession(true);

            // Store some information in the session (e.g., user ID or username)
            session.setAttribute("username", username);

            // Redirect to a success page
            response.sendRedirect("correcto.jsp");
        } else {
            // Redirect to a failure page if authentication fails
            response.sendRedirect("error.jsp");
        }
    }
}
