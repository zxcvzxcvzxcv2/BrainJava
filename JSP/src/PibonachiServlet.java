import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PibonachiServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//super.doGet(req, resp);
		PrintWriter out = response.getWriter();
		out.println("<HTML><HEAD></HEAD>");
		out.println("<BODY>");
		
		int a = 1, b = 1, c = 0;
		
        while(true) {
			
			c = a + b;
			a = b;
			b = c;
			
			if(c < 100)
				
           System.out.print(c + " ");
			
			else
				break;
		}
        out.println("</BODY>");
        out.println("</HTML>");
		
	}
	
	

}
