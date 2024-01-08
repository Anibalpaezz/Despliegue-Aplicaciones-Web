import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/compra")
public class compra extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Lógica para procesar la compra
        String[] consolaId = request.getParameterValues("seleccion[]");

        // Puedes realizar aquí las acciones necesarias, como registrar la compra en la base de datos, etc.

        // Muestra un mensaje simple en la respuesta
        response.getWriter().println("Compra realizada con exito");
        for(String id : consolaId){
            response.getWriter().println(id);
        }
        
    }
}
