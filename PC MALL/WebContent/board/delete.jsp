<%@ page  import="java.sql.*,oracle.dbpool.*" contentType="text/html;charset=euc-kr" %>

<%
	DBConnectionManager pool = DBConnectionManager.getInstance();
	Connection con = pool.getConnection("ora8");
   
	try {
		int b_id=Integer.parseInt(request.getParameter("b_id"));
		String pwd =null ;   //DB���� ���� �۾������ �����̰����� ����
 
		Statement stmt= con.createStatement();
		ResultSet rs=stmt.executeQuery("select pwd from re_board where b_id="+b_id);
		if(rs.next()) {
			pwd=rs.getString(1);
		}
		if(pwd.equals(request.getParameter("pwd"))){ 
			stmt.executeUpdate("delete from re_board where b_id="+b_id);
%>
			<script language=javascript>
				document.location.href='board_list.jsp';
			</script>
<%
		} else {
%>
			<script language=javascript>
				alert("���� ������ �� �����ϴ�.");
				history.back();
			</script>
<%
		}
		rs.close();
		stmt.close(); 

	} catch (Exception e) {
		out.println(e);
	}  finally{
		pool.freeConnection("ora8", con); 
	}
%>