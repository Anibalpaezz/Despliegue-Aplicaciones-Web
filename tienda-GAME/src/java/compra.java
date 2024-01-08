import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
