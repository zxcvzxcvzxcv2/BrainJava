<%@ page contentType="text/html;charset=euc_kr"  %>

<% String user_id= (String) session.getAttribute("pid");%>

<LINK href="../common/u3.css" type=text/css rel=STYLESHEET>

<body link="#000000" vlink="#000000" alink="#FF6633">

<br><br>
<table  width=410 height=25 border=1  cellspacing=0 cellpadding=0 topmargin=0>
	<tr valign=middle bgcolor=ffffff>
		<td align=center bgcolor=#ffccff><font  size=4><b>����Ʈ ��</b></font></td>
	</tr>
</table>
  
<table width=400 border=1 cellspacing="1" cellpadding="0">
	<tr align="center" valign="top"> 
		<td width=200>
			<table width=100 border=0 cellspacing="0" cellpadding="0">
				<tr> 
					<td height=30><b><font color="#0000FF" size=3>���θ�</font></b><br>
						<img src="img/middle_line_01.gif" border=0 width=200></td>
				</tr>                           
				<tr>
					<td><a href="../shoppingmall/gongi.jsp" id="dami"> &nbsp;��������</a></td>
				</tr>
				 <tr>
					<td><a href="../shoppingmall/newproduct.jsp"> &nbsp;�Ż�ǰ �ڳ�</a></td>
				</tr>
				<tr>
					<td><a href="../shoppingmall/pc_calculation.jsp"> &nbsp;����PC����</a></td>
				</tr>
				<tr>
					<td><a href="../shoppingmall/gongdong.jsp"> &nbsp;��������</a></td>
				</tr>
			</table>

		</td>
		<td width=200>
			<table width="50%" border=0 cellspacing="0" cellpadding="0" bgcolor="#ffffff">
				<tr> 
					<td height=30><b><font color="#0000FF" size=3>��������</font></b><br>
						<img src="img/middle_line_01.gif" border=0 width=200></td>
				</tr>
				<tr>
					<td><a href="../member/user.jsp"> &nbsp;ȸ������</a></td>
				</tr>
				<tr>
					<td><a href="../member/modify.jsp?user_id=<%=user_id%>"> &nbsp;ȸ����������</a></td>
				</tr>
				<tr>
					<td><a href="../member/delete.jsp?user_id=<%=user_id%>"> &nbsp;ȸ��Ż��</a></td>
				</tr>
				<tr>
					<td><a href="../product/basket_view.jsp"> &nbsp;��ٱ���</a></td>
				</tr>
			</table>
		</td>

	<table width="50%" border=1 cellspacing="0" cellpadding="0">
			<tr align="center" height=30> 
				<td width=200>
					<table width="50%" border=0 cellspacing="0" cellpadding="0" bgcolor="#ffffff">
						<tr> 
							<td height=30><b><font color="#0000FF" size=3>������ϱ�</font></b><br>
								<img src="img/middle_line_01.gif" border=0 width=200></td>
						</tr>                           
						<tr>
							<td><a href="../board/reply_list.jsp"> &nbsp;�����Խ���</a></td>
						</tr>
						<tr>
							<td><a href="../service/inform_01.jsp"> &nbsp;FAQ</a></td>
						</tr>
					</table> 
				</td>
				<td width=200>
					<table width="50%" border=0 cellspacing="0" cellpadding="0" bgcolor="#ffffff">
						<tr> 
							<td height=30><b><font color="#0000FF" size=3>�� Ÿ</font></b><br>
							<img src="img/middle_line_01.gif" border=0 width=200></td>
						</tr>
						<tr>
							<td><a href="../member/login_form.jsp"> &nbsp;�α���</a></td>
						</tr>
						<tr>
							<td><a href="../service/company_intro.jsp"> &nbsp;ȸ��Ұ�</a></td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</tr>
</table>

</BODY>
</HTML>