<%@ page  contentType="text/html;charset=euc-kr" %>
<%
	String b_id = request.getParameter("b_id");
%>

<HTML>
	<HEAD><TITLE>��й�ȣ�Է�ȭ��</TITLE>
		<link href="../ch10/m3.css" type=text/css rel=stylesheet>
</HEAD>

<BODY topmargin=0 leftmargin=0 bgcolor=white>
	<center><br>
	<table cellpadding=0 cellspacing=0 border=1 width=250>
		<tr bgcolor=#7eaee9>
			<td align=center><b>�Խù��� ��й�ȣ�� �Է��ϼ���.</b></td>
		</tr>
		<form name="frm" method="post" action="delete.jsp">
  		<tr>
			<td align="center">
				<input type="password" name="pwd" size=20 >
				<input type="submit" value="Ȯ��">
			</td>
		</tr>
		<input type="hidden" name="b_id" value="<%=b_id%>">  
	</form>
	</table></center>
</BODY>
</HTML>