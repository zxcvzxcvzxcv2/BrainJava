import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PersonalServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//super.doGet(req, resp);
		
		String name = request.getParameter("NAME");
		String color = request.getParameter("COLOR");
		String animal = request.getParameter("ANIMAL");
        String food[] = request.getParameterValues("FOOD");

		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		out.println("<HTML>");
		out.println("<HEAD><TITLE>성격 테스트</TITLE></HEAD>");
		out.println("<BODY>");
		out.println("<H2>성격 테스트</H2>");
		out.printf("%s님의 성격 테스트 결과 <BR><BR>", name);
		out.printf("%s 색을 좋아하는 당신은 %s, 그리고 ", color, animal);
		for (int cnt = 0; cnt < food.length; cnt++) {
			if(cnt > 0)
				out.printf("과 %s", food[cnt]);
			else
				out.printf("%s", food[cnt]);
		}
		out.println("을 좋아하는 성격입니다.");
		out.println("</BODY>");
		out.println("</HTML>");
	}


}
