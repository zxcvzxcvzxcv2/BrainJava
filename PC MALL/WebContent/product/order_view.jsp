<%@ page contentType="text/html;charset=euc_kr" import="java.sql.*,oracle.dbpool.*" %>

<HTML>
	<HEAD>
		<TITLE>��ǻ���������θ�</TITLE>
	<script language=JavaScript src="../common/u3.js"></script>
	<link href="../common/u3.css" type=text/css rel=stylesheet>
		</HEAD>

<BODY leftmargin=0 topmargin=0 marginwidth=0 marginheight=0>
    <jsp:include page="../common/basic_screen.jsp" flush="true"/>
<%!
	String name, user_name, user_id,  address, e_mail, phone;
	int id,price,qty;
	int number=1;
	int totalprice=0;
	int totalqty=0;
%>
<%
	String pid =(String)session.getAttribute("pid");
	String sql1="select id,name,price,qty from basket_view where user_id= '"+pid+"'";
	String sql2="select mem_uid,mem_name,mem_email,mem_address,mem_phone from member where mem_uid ='"+ pid+ "'";
try {
	DBConnectionManager pool = DBConnectionManager.getInstance();
	Connection con = pool.getConnection("ora8");
	Statement stmt = con.createStatement();
	ResultSet rs1=stmt.executeQuery(sql1);
%>
	<center><br>
	<table border=1 cellpadding=0 cellspacing=0 width=550 align=center>
		<tr bgcolor=#7aaad5>
			<td height=30 align=middle bgcolor=#ccffcc><font size=3 color=#000000><b>[<%=pid%>]���� �ֹ��Ͻ� ��ǰ�� �Ʒ��� �����ϴ�.</b></font></td>
		</tr>
	</table>
	<table border=1 align=center width=620>
		<tr height=23>
			<th bgcolor="#cc0000"><font color="#ffffff">��ǰ��</font></th>
			<th bgcolor="#cc0000"><font color="#ffffff">����</font></th>
			<th bgcolor="#cc0000"><font color="#ffffff">�ǸŰ�</font></th>
			<th bgcolor="#cc0000"><font color="#ffffff">�հ�</font></th>
		</tr>
<%
	while(rs1.next()) {
		id = rs1.getInt(1);
		name = rs1.getString(2);
		price = rs1.getInt(3);
		qty = rs1.getInt(4);
		totalqty = totalqty + (qty);
		totalprice = totalprice +  (price*qty);
%>
		<tr>
			<td  bgcolor=#ccffff><%= name %></font></td>
			<td  bgcolor=#ffffcc align=right><%= qty %>��&nbsp;</font></td> 
			<td  bgcolor=#ffffcc align=right width=70><%=price%>��</font></td>
			<td  bgcolor=#ffffcc align=right width=120><%=price*qty%>��</font></td>
		</tr>
<% } %>
	</table>
	<table align=center>
		<tr>
			<td><%= pid %> ȸ������ �����Ͻ� �Ѽ����� [<%= totalqty %>��] �̰�,  �����Ͻ� �ݾ��� [<%=totalprice %>��] �Դϴ�</font></td>
		</tr>
	</table>
<%
	rs1.close();
	totalqty=0;
	totalprice=0;
	ResultSet rs2=stmt.executeQuery(sql2);
	if(rs2.next()){
		user_id=rs2.getString(1);
		user_name=rs2.getString(2);
		e_mail=rs2.getString(3);
		address=rs2.getString(4);
		phone=rs2.getString(5);
	}
%>
	<form name=reg method="post" action="order_com.jsp" >
	<table width=500 border=1 cellspacing=3 cellpadding=0 align=center background="#ffffff">
		<tr>
			<th height=30 colspan=2 align=center bgcolor="#ffff99"><font size=3 color=black>[<%=pid%>]���� ������� ����&nbsp;�߼��� ����</font></th>
		</tr>
		<tr>
			<td  bgcolor='#e2edfa' width=100>&nbsp;ȸ�� ID</td>
			<td  bgcolor=f6f8fc>&nbsp;<%= user_id %></td>
		</tr>
		<tr>
			<td  bgcolor=#e2edfa width=100>&nbsp;ȸ�� �̸�</td>
			<td  bgcolor=f6f8fc>&nbsp;<%= user_name %></td>
		</tr>
		<tr>
			<td  bgcolor=#e2edfa width=100>&nbsp;E-mail</font> </td>
			<td  bgcolor=f6f8fc>&nbsp;<input type=text name=email size=40 value=<%= e_mail %>></td>
		</tr>
		<tr>
			<td  bgcolor=#e2edfa width=100>&nbsp;�ּ�</font> </td>
			<td  bgcolor=f6f8fc>&nbsp;<input type=text name=addr size=40  value="<%= address %>"></td>
		</tr>
		<tr>
			<td  bgcolor=#e2edfa width=100>&nbsp;��ȭ��ȣ </font></td>
			<td  bgcolor=f6f8fc>&nbsp;<input type=text name=tel value=<%=phone %>></td>
		</tr>
		<tr>
			<td  bgcolor=#e2edfa width=100>&nbsp;�ֹ��� ���� ��</font></td>
			<td  bgcolor=f6f8fc>&nbsp;<textarea name="message" rows=3 cols=50></textarea></td>
		</tr>
		<tr>
			<td   bgcolor="white" colspan=2 align=center> 
				<input type=submit name=submit value="�ֹ��ϱ�">
				<input type=reset name=reset value="�ٽþ���">
			</td>
		</tr>
	</table>
	</form>
<%
	rs2.close();
	stmt.close();
	pool.freeConnection("ora8", con);
	} catch (Exception e) {
	  out.println(e);
		}
%>
<!-- =========================== -->
	<jsp:include page="../common/basic_copyright.jsp" flush="true"/>
</BODY>
</HTML>