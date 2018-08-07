import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AnimalServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, 
			             HttpServletResponse response) 
			             throws ServletException, IOException {
		
		//super.doGet(req, resp);
		
		String food = request.getParameter("FOOD");
		
		HttpSession session = request.getSession();
		session.setAttribute("FOOD",  food);
		
		response.setContentType("text/html;charset = UTF-8");
		PrintWriter out = response.getWriter();
		
		out.println("<HTML>");
		out.println("<HEAD><TITLE>성격 테스트</TITLE></HEAD>");
		out.println("<BODY>");
		out.println("<H3>좋아하는 동물은?</H3>");
		out.println("<FORM ACTION = result>");
		out.println("<INPUT TYPE = text NAME = ANIMAL>");
		out.println("<INPUT TYPE = submit NAME = '확인'>");
        out.println("</FORM>");
		out.println("</BODY>");
		out.println("</HTML>");
	}

}
