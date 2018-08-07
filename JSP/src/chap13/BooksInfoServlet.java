package chap13;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

public class BooksInfoServlet extends HttpServlet {
	
	Logger logger = Logger.getLogger(this.getClass());

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			           throws ServletException, IOException {
		
	String lowerCode = request.getParameter("LAST_CODE");
	
	if(lowerCode == null)
		lowerCode = "00000";
	
	BooksInfo booksInfo = readDB(lowerCode);
	request.setAttribute("BOOKS_INFO", booksInfo);
	
	RequestDispatcher dispatcher = request.getRequestDispatcher(
			      "/chap13/WebTemplate.jsp?BODY_PATH=BooksInfoView.jsp");
	dispatcher.forward(request, response);
}	

	private BooksInfo readDB(String lowerCode) 
	                              throws ServletException { // 데이터베이스로부터 책 정보를 읽는 메서드
		BooksInfo booksInfo = new BooksInfo();
		
		Connection conn = null;
		Statement stmt = null;
		String query = null;
		
		try {
			Class.forName("org.apache.commons.dbcp.PoolingDriver");
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(
					"jdbc:apache:commons:dbcp:/wdbpool");
			
			if (conn == null)
				throw new Exception("데이터베이스에 연결할 수 없습니다.");
			
			stmt = conn.createStatement();
			query = "select * " + "from goodsinfo where gcode > '" + lowerCode + "' order by gcode asc;";
		    logger.info("query: " + query);
		    
		    ResultSet rs = stmt.executeQuery(query);
		    
		    for (int cnt = 0; cnt < 5; cnt++) {
		    	if(!rs.next())
		    		break;
		    	booksInfo.setCode(cnt, rs.getString("gcode"));
		    	booksInfo.setTitle(cnt, rs.getString("title"));
		    	booksInfo.setWriter(cnt, rs.getString("writer"));
		    	booksInfo.setPrice(cnt, rs.getInt("price"));
		    }
		    if(!rs.next())
		    	booksInfo.setLastPage(true);	
	}catch (Exception e) {
		throw new ServletException(e);
	}
		finally {
			try {
				stmt.close();
			}
			catch(Exception ignored) {
			}
			try {
				conn.close();
			}
			catch(Exception ignored) {
			}
		}
		return booksInfo;
	}
}

