package chap13;

import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import org.apache.log4j.Logger;

public class LoginServlet extends HttpServlet {
	
	Logger logger = Logger.getLogger(this.getClass());

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("ID");
		String password = request.getParameter("PASSWORD");
		
		String result;
		if(checkLoginInfo(id, password)) {
			HttpSession session = request.getSession();
			session.setAttribute("LOGIN_ID", id);
			result = "SUCCESS";
		}
		else {
			result = "FAIL";
		}
		response.sendRedirect("chap13/WebTemplate.jsp?BODY_PATH=LoginResult.jsp?LOGIN_RESULT=" + result); 
	}
	
	private boolean checkLoginInfo(String id, String password)
	                           throws ServletException {    // 로그인 체크 메서드
		
		Connection conn = null;
		Statement stmt  = null;
		String query;
		boolean result  = false;
		
		try {
			Class.forName("org.apache.commons.dbcp.PoolingDriver");
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:apache:commons:dbcp:/wdbpool");
			
			if (conn == null)
				throw new Exception("데이터베이스에 연결할 수 없습니다.");
			
		    stmt = conn.createStatement();
		    query = "select upassword from userinfo where uid = '" + id + "'";
		    logger.info("query: " + query);
		    
		    ResultSet rs = stmt.executeQuery(query);
		    
		    if(!rs.next())
		    	result = false;
		    
		    String correctPassword = rs.getString("upassword");
		    
		    if(password.equals(correctPassword))
		    	result = true;
		    else 
		    	result = false;
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			try {
				stmt.close();
			}
			catch (Exception e) {
				e.printStackTrace();
			}
			try {
				conn.close();
			}
			catch(Exception e) {
				e.printStackTrace();
			}
			return result;
		}
		
	}
}
