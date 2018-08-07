package chap13;

import javax.servlet.http.*;
import javax.servlet.*;
import java.io.*;
import java.sql.*;
import org.apache.log4j.*;

public class BBSListServlet extends HttpServlet {

	  Logger logger = Logger.getLogger(this.getClass());


	@Override
	public void doGet(HttpServletRequest request, 
			             HttpServletResponse response) 
			             throws ServletException, IOException {
		
		String strUpperSeqNo = request.getParameter("LAST_SEQ_NO");
		
		int upperSeqNo;
		if(strUpperSeqNo==null)
			upperSeqNo = Integer.MAX_VALUE;
		
		else
			upperSeqNo = Integer.parseInt(strUpperSeqNo);
		
		    BBSList list = readDB(upperSeqNo);
		    
		    request.setAttribute("BBS_LIST", list);
		    RequestDispatcher dispatcher = request.getRequestDispatcher(
		    		                   "chap13/WebTemplate.jsp?BODY_PATH=BBSListView.jsp");
		    dispatcher.forward(request, response);
	    }
	  
	private BBSList readDB(int upperSeqNo) 
			             throws ServletException {   // 데이터베이스로부터 게시글 목록을 읽는 메서드
		BBSList list = new BBSList();
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
		    query = " select * from bbs where seqNo < " + upperSeqNo + " order by seqno desc;";
		    logger.info("query: " + query);
		    
		    ResultSet rs = stmt.executeQuery(query);
		    		              
		    
		    for (int cnt = 0; cnt < 5; cnt++) {
		    	if(!rs.next())
		    		break;
		    	
		    	list.setSeqNo(cnt,  rs.getInt("seqNo"));
		    	list.setTitle(cnt,  rs.getString("title"));
		    	list.setWriter(cnt, rs.getString("writer"));
		    	list.setDate(cnt,   rs.getDate("wdate"));
		    	list.setTime(cnt,   rs.getTime("wtime"));
		    }
		    
		    if (!rs.next())
		    	list.setLastPage(true);
		}
		catch (Exception e) {
			throw new ServletException(e);
		}
		finally {
			try {
				stmt.close();
			}
			catch (Exception ignored) {
			}
			try {
				conn.close();
			}
			catch (Exception ignored) {
				
			}
		}
		return list;
	}
}
