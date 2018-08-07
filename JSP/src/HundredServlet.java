import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HundredServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// super.doGet(request, response);

		int total = 0;

		for (int cnt = 1; cnt <= 100; cnt++)
			total += cnt;
		
		request.setAttribute("result", total);  //int result = total;
		
		String str = "Jsp Programming";
		request.setAttribute("WebProgramming", str);  //String WebProgramming = str; 
		
		RequestDispatcher rd = request.getRequestDispatcher("Hundred2.jsp");
		rd.forward(request, response);

/*		PrintWriter out = response.getWriter();
		out.println("<HTML>");
		out.println("<HEAD><TITLE>Hundred Servlet</TITLE></HEAD>");
		out.println("<BODY>");
		out.printf("1+2+3+...+1000 = %d", total);
		out.println("</BODY>");
		out.println("</HTML>");
		*/
	}

}
