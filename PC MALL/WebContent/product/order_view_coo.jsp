<%@ page language="java" import="java.sql.*,oracle.dbpool.*" contentType="text/html;charset=EUC_KR" %>


<html>
<head>
  <title>��ǻ���������θ�</title>
<SCRIPT language=JavaScript src="../common/u3.js"></SCRIPT>
<LINK href="../common/u3.css" type=text/css rel=STYLESHEET>
</head>

<BODY leftmargin='0' topmargin='0' marginwidth='0' marginheight='0'>
    <jsp:include page="../common/basic_screen.jsp" flush="true"/>
	
<!-- ======================================================================= -->
<%!
		String name,company_id,expression,photo,category;
		int id,price,qty;
		int number=1;
		int totalprice=0;
		int totalqty=0;

		String user_name,ssn,user_id,passwd,zip,address,e_mail,job,phone;
%>

<%
DBConnectionManager pool = DBConnectionManager.getInstance();
Connection con = pool.getConnection("ora8");//���ڰ� ora8

Statement stmt=null;
ResultSet rs1=null;
ResultSet rs2=null;

String pid =(String)session.getAttribute("pid");
try {

	String sql1="select a.id,a.name,a.price,a.company_id,a.expression,a.photo,a.category,b.qty from product a, basket b where b.temp2='C' and a.id=b.product_id and b.user_id= '"+pid+"'";
	String sql2="select mem_name,mem_ssn,mem_uid,mem_pwd,mem_zip,mem_address,mem_phone,mem_email,mem_job from member where mem_uid ='"+ pid+ "'";

	stmt=con.createStatement();
	rs1=stmt.executeQuery(sql1);// ��ǰ ���� �Ѹ���

%>

<center>
		<table>
		<tr>
            <td width=600><b><font face="aroha" >&nbsp;[<%=pid%>]ȸ������ �ֹ��Ͻ� �������� �����Դϴ�. </font></b></td>
            <td align=right>&nbsp;</td>
		</tr>
		</table>
<font size=2 color="#39599c"><b><%=pid%></b></font><font size=2>���� �ֹ��Ͻ� ��ǰ�� �Ʒ��� �����ϴ�</font>
</center>


<table border="0" cellpadding='0' cellspacing='0' width='620' align="center">
		<tr>
            <TD align=middle bgColor=#7aaad5><FONT color=#ffffff><B><%=pid%>���� �ֹ��Ͻ� �����Դϴ�.</B> </FONT></TD>
		</TR>
</table>

<table border="0" align="center" width="620">
	<tr>
		<th bgcolor="#CC3300"><font color="#FFFFFF" size=2>��ǰ��</font></th>
		<th  bgcolor="#CC3300"><font color="#FFFFFF" size=2>����</font></th>
		<th  bgcolor="#CC3300"><font color="#FFFFFF" size=2>�ǸŰ�(��)</font></th>
		<th  bgcolor="#CC3300"><font color="#FFFFFF" size=2>�հ�(����*�ǸŰ�)</font></th>
	</tr>
<%
		while(rs1.next()) {
			id=rs1.getInt(1);
			name=rs1.getString(2);
			price=rs1.getInt(3);
			company_id=rs1.getString(4);
			expression=rs1.getString(5);
			photo=rs1.getString(6);
			category=rs1.getString(7);
			qty=rs1.getInt(8);

			totalprice=totalprice +  (price*qty);
			totalqty = totalqty + (qty);
%>
	<tr>
		<td  bgcolor='#FFFFCC'><font size="2"><%= name %></font></td>
		<td  bgcolor='#FFFFCC' align=right><font size="2"><%= qty %>��&nbsp;</font></td> 
		<td  bgcolor='#FFFFCC' align=right width="70"><font size="2"><%=price%>��</font></td>
		<td  bgcolor='#FFFFCC' align=right width="120"><font size="2"><%=price*qty%>��</font></td>
	</tr>
		
<%
    }
%>
</table>
<table width=620 cellspacing=0 cellpadding=0>
        <TR bgColor=#7aaad5><TD align=middle></TD></TR>
</table>

<table align=center>
	<tr>
		<td>
			<font class="aroha"><%=pid%> ȸ������ �����Ͻ� �Ѽ����� [<%=totalqty%>��] �̰�  �����ϽǱݾ��� [<%=totalprice%>��] �Դϴ�.</font>
		</td>
	</tr>
</table>

<%
		rs1.close();
			
		rs2=stmt.executeQuery(sql2);
		if(rs2.next()){
			user_name=rs2.getString(1);
			user_id=rs2.getString(3);
			passwd=rs2.getString(4);
			zip=rs2.getString(5);
			address=rs2.getString(6);
			phone=rs2.getString(7);
			e_mail=rs2.getString(8);
		}
%>

<form name=reg method="post" action="order_com.jsp" >

<table border="0" cellpadding='0' cellspacing='0' width='620' align="center">
       <tr bgcolor=#7aaad5>
           <td align=middle bgcolor=#7aaad5><font color=#ffffff><b><%=pid%>���� ����� �����Դϴ�.</b> </font></td>
		</tr>
</table>

<table width="500" border="1" cellspacing="3" cellpadding="0" align="center" background="#FFFFFF">
	<tr>
		<th colspan=2 align="center" bgcolor="#CC0099"><font color=white size=2>�� �� �� �� ��</font></th>
	</tr>
	<tr>
		<td  bgcolor='#e2edfa' width=100><font size=2>ȸ�� �̸�</font></td>
		<td  bgcolor=F6F8FC><font size=2><%= user_name %></font></td>
	</tr>
	<tr>
	<td  bgcolor='#e2edfa' width=100><font size=2>ȸ�� ID </font></td>
		<td  bgcolor=F6F8FC><font size=2><%= user_id %></font></td>
	</tr>
	<tr>
		<td  bgcolor='#e2edfa' width=100><font size=2>E-mail</font> </td>
		<td  bgcolor=F6F8FC><font size=2><input type=text name=email size=40 value=<%= e_mail %>></font></td>
	</tr>
	<tr>
		<td  bgcolor='#e2edfa' width=100><font size=2>�ּ�</font> </td>
		<td  bgcolor=F6F8FC><font size=2><input type=text name=addr size=40  value=<%= address %>></font></td>
	</tr>
	<tr>
		<td  bgcolor='#e2edfa' width=100><font size=2>��ȭ��ȣ </font></td>
		<td  bgcolor=F6F8FC><font size=2><input type=text name=tel value=<%= phone %>></td></font>
	</tr>
	<tr>
		<td  bgcolor='#e2edfa' width=100><font size=2>���<br>(�ֹ������Ҹ�)</font></td>
		<td  bgcolor=F6F8FC><font size=2><textarea name="message" rows=3 cols=50></textarea></font></td>
	</tr>

	<tr>
		<td   bgcolor="white" colspan=2 align=center> 
			<input type=submit name=submit value="�ֹ��ϱ�">
			<input type=reset name=reset value="�ٽþ���">
		</td>

	</tr>
</table>

<table width=620 cellspacing=0 cellpadding=0>
    <tr bgcolor=#7aaad5>
        <td align=middle></td>
	</tr>
</table>
</form>
<%
	
	rs2.close();

	} catch (Exception e) {
	  out.println(e);
	} finally {
	if (stmt != null) stmt.close();
	if (con != null) {
     pool.freeConnection("ora8", con); 
	}
}%>
<!-- ================================== -->
	<jsp:include page="../common/basic_copyright.jsp" flush="true"/>
</body>
</html>