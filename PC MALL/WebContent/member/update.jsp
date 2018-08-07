<%@ page contentType="text/html;charset=euc-kr" 
    import="java.sql.*,java.util.*,oracle.dbpool.*"
    errorPage="error.jsp" %>
<% request.setCharacterEncoding("euc-kr"); %>

<% 
	DBConnectionManager pool = DBConnectionManager.getInstance();
	Connection con = pool.getConnection("ora8");

	try {
		String mem_uid   = request.getParameter("uid");
		String mem_pwd   = request.getParameter("pwd");
		String mem_email = request.getParameter("email");
		String mem_addr  = request.getParameter("addr");
		String mem_zip   = request.getParameter("zip");
		String mem_phone = request.getParameter("tel");
		String mem_job   = request.getParameter("job");
		String mem_name  = request.getParameter("name");  /////////

        String sql = "update member set m_pwd=?,";
		sql = sql +  "m_email=?,m_job=?,m_phone=?,";
		sql = sql +  "m_zip=?,m_address=?, m_name=? ";  ///////////
		sql = sql +  "where m_uid ='" + mem_uid + "'";

		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, mem_pwd);
		pstmt.setString(2, mem_email);
		pstmt.setString(3, mem_job);
		pstmt.setString(4, mem_phone);
        pstmt.setString(5, mem_zip);
		pstmt.setString(6, mem_addr);
		pstmt.setString(7, mem_name);      ///////////////

		pstmt.executeUpdate();
		pstmt.close();
        pool.freeConnection("ora8", con);
        
       	 
    	session.setAttribute("pname",mem_name);	 //ȸ�� �̸�
        
%>
        <script language=javascript>
                alert("ȸ�������� �����߽��ϴ�.");
                document.location.href='../main/index.jsp';
        </script>
<%     
	} catch (Exception e) {
		out.println(e);
		pool.freeConnection("ora8", con); 
	}
%>