<%@ page contentType="text/html;charset=euc-kr" 
		 import="java.sql.*,oracle.dbpool.*"
		 errorPage="error.jsp" %>
<% request.setCharacterEncoding("euc-kr"); %>

<HTML>
   <HEAD>
      <TITLE> ȸ�� ���� ó�� </TITLE>
   </HEAD>
<BODY>

<%
	DBConnectionManager pool = DBConnectionManager.getInstance();
	Connection con = pool.getConnection("ora8");

     String mem_uid   = request.getParameter("uid");
     String mem_pwd   = request.getParameter("pwd");
     String mem_name  = request.getParameter("name");
     String mem_email = request.getParameter("email");
     String mem_ssn   = request.getParameter("ssn1") +"-"+request.getParameter("ssn2");
     String mem_addr  = request.getParameter("addr");
     String mem_zip   = request.getParameter("zip1") + "-" + request.getParameter("zip2");
     String mem_phone = request.getParameter("tel1") + "-" + request.getParameter("tel2") + "-" + request.getParameter("tel3");
     String mem_job   = request.getParameter("job");

	try {
		Statement stmt = con.createStatement();
        ResultSet rs=stmt.executeQuery("select m_uid from member where m_uid='"+mem_uid+"'");

		if(rs.next()) {
			rs.close();
%>
        <script language=javascript>
                alert("�ߺ��Ǵ� ���̵� �����մϴ�.");
                history.back();
        </script>
<%
        } else {
			// String sql = "insert into member values (?,?,?,?,?,?,?,sysdate,?,sysdate,?,?)";
        	String sql = "insert into member (m_uid, m_pwd, m_name, m_ssn, m_email, m_phone, m_job, m_visit, m_zip, m_address, m_regdate, m_lastvisit )";
        	       sql += " values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, sysdate, sysdate)";
			
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mem_uid);
			pstmt.setString(2, mem_pwd);
			pstmt.setString(3, mem_name);
			pstmt.setString(4, mem_ssn);
			pstmt.setString(5, mem_email);
			pstmt.setString(6, mem_phone);
			pstmt.setString(7, mem_job);
			pstmt.setInt(8, 0);
	        pstmt.setString(9, mem_zip);
			pstmt.setString(10, mem_addr);
			pstmt.executeUpdate();
			
			session.setAttribute("uid", mem_uid);
			pstmt.close();
			rs.close();
			stmt.close();
			pool.freeConnection("ora8", con); 
%>
			<script language=javascript>
				alert("ȸ�������� �����մϴ�.");
				document.location.href='../main/index.jsp';
			</script>
<%
		}
	} catch (SQLException e) {
		pool.freeConnection("ora8", con);
%>
		<script language=javascript>
			alert("ȸ�������� �����Ͽ����ϴ�. �ٽ� �õ��� ���ñ� �ٶ��ϴ�.");
			document.location.href='../main/index.jsp';
		</script>
<%
		}
%>
</BODY>
</HTML>