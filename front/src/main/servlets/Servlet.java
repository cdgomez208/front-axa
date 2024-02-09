package servlets;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

import org.springframework.web.client.RestClientException;

@WebServlet("/viewStrings")
public class Servlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    private static final String API_URL = "http://localhost:8080";
    private final RestTemplate restTemplate = new RestTemplate();
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String[] stringArray = restTemplate.getForObject(API_URL + "/customers", String[].class);
            request.setAttribute("stringList", stringArray);
            request.getRequestDispatcher("/WEB-INF/ConsultaCliente.jsp").forward(request, response);
        } catch (RestClientException e) {
   
            e.printStackTrace(); 
            request.getRequestDispatcher("/WEB-INF/error.jsp").forward(request, response);
        }
    }
}

