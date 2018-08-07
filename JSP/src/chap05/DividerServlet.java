package chap05;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DividerServlet extends HttpServlet {
	
	

	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		super.init();
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String str1 = request.getParameter("NUM1");
		String str2 = request.getParameter("NUM2");
		
		int num1 = Integer.parseInt(str1);
		int num2 = Integer.parseInt(str2);
		int result = num1/num2;
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<HTML>");
		out.println("<HEAD><TITLE>서블릿 나눗셈 프로그램</TITLE></HEAD>");
		out.println("<BODY>");
		out.printf("%d / %d = %d", num1, num2, result);
		out.println("</BODY>");
		out.println("</HTML>");
		
		
		
	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		super.destroy();
	}
	
	

}
