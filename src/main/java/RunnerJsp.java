import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
//@WebServlet(urlPatterns="/books", name="FindBooks" )
public class RunnerJsp extends HttpServlet {
    @Override
    public void doGet(HttpServletRequest request,
                      HttpServletResponse response) throws ServletException, IOException {
        // The code processing request goes here
        // The resulting Web page will be sent back via the
        // I/O stream that response variable contains

        request.getRequestDispatcher("studentTest.jsp").forward(request, response);

//        PrintWriter out = response.getWriter();
//        out.println("Hello from FindBooks");
    }
}