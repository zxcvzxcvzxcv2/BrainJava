import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BBSPostServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// super.doPost(req, resp);

		request.setCharacterEncoding("UTF-8");

		String name = request.getParameter("NAME");
		String title = request.getParameter("TITLE");
		String content = request.getParameter("CONTENT");

		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<HTML>");
		out.println("<HEAD><TITLE>게시판 글쓰기 - 결과 화면</TITLE></HEAD>");
		out.println("<BODY>");
		out.printf("이름: %s <BR>", name);
		out.printf("제목: %s <BR>", title);
		out.println("--------<BR>");
		out.printf("<PRE>%s</PRE>", content);
		out.println("--------<BR>");
		out.println("저장되었습니다");
		out.println("</BODY>");
		out.println("</HTML>");
	}

}
