<%@ page contentType="text/html;charset=euc-kr" 
                 import="java.sql.*,java.util.*,oracle.dbpool.*"
            errorPage="error.jsp" %>
<HTML>
   <HEAD>
      <TITLE> ID �ߺ� üũ </TITLE>
   </HEAD>

<BODY>

<%
     DBConnectionManager pool = DBConnectionManager.getInstance();
     Connection con = pool.getConnection("ora8");
     String sql = "select count(m_uid) from member where m_uid = '";
            sql = sql + request.getParameter("uid") + "'";
       Statement stmt = con.createStatement();
       ResultSet rs = stmt.executeQuery(sql);

       rs.next();
       if(rs.getInt(1) > 0) {
 %>
      <center>
         <h4>���̵�(id) �ߺ� !!!</h4>
         <img src="img/warning.gif"><br><br>
         <font size=2>�Է��� ���̵�(id)�� ������Դϴ�.</font><br>
         <a href="JavaScript:window.close()">�ݱ�</a>
      </center>
<%
       } else {
%>
      <center>
         <h4>��� �����մϴ� !!!</h4>
         <img src="img/cong.gif"><br><br>
         <font size=2>�Է��� ���̵�(id)�� ��� �����մϴ�.</font><br>
         <a href="JavaScript:window.close()">����ϱ�</a>
      </center>
<%
       }
     rs.close();
     stmt.close();
     pool.freeConnection("ora8", con);
%>
</BODY>
</HTML>