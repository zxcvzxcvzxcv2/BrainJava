<%@ page contentType="text/html;charset=euc-kr" import="java.sql.*,oracle.dbpool.*"  %>

<HTML>
	<HEAD><TITLE>��ǻ���������θ�</TITLE>
	</HEAD>
	<link href="../common/u3.css" type=text/css rel=stylesheet>

<BODY leftmargin=0 topmargin=0 marginwidth=0 marginheight=0>
    <jsp:include page="../common/basic_screen.jsp" flush="true"/>

<form name=board_search method=post>
<br>
	<table border=1 width=550 height=30 bordercolor=black>
		<tr>
			<td align=center bgcolor=0063ce><font size=3 color=#FFFFFF><b>�� �� �� �� ��</b></td>
		</tr>
	</table>
	<br>
	<table width=550 border=1 cellspacing=0 cellpadding=0  bordercolor="#C0C0C0">
		<tr bgcolor="#7eaee9" height=21>
			<td width=50 align="center" bgcolor="#7EAEE9"><font size="2" >��ȣ</font></td>
			<td width=230  align="center">����</td>
			<td width=100 align="center">��¥</td>
			<td width=100 align="center">�۾���</td>
			<td width=60 align="center">��ȸ��</td>
		</tr>
<%!   
	int pagesize = 10;  // ���������� 10�� ��¹�
	int pageNUM=1;    // ������ ��ȣ
	int pagecount=1 ; // ������ ���� ���� ����
	int absolutepage=1;  // ���� ��ġ ������ ��ȣ
	int dbcount=0 ;   //  DB �ȿ� �� ���� ���� ����
%>
<%
	try{ 
		DBConnectionManager pool = DBConnectionManager.getInstance();
		Connection con = pool.getConnection("ora8");
 
		String  b_name, b_email, b_title, b_content, b_date, mailto;
		int  b_id =0 , b_hit = 0, level=0, color=1 ;

		// DB ���� �� ���
		Statement stmt = con.createStatement();  
		ResultSet pageset = stmt.executeQuery("select count(b_id) from re_board");
		if( pageset.next()){
			dbcount = pageset.getInt(1); 
			pageset.close();
		}

        int ii = dbcount + 1;

		if(dbcount%pagesize == 0)   
			pagecount = dbcount/(pagesize); // �� �������� ���ϱ�
		else
			pagecount = dbcount/(pagesize)+1; // �� �������� ���ϱ�

		if(request.getParameter("pageNUM") != null) {
			pageNUM=Integer.parseInt(request.getParameter("pageNUM"));	 //������ ������ �����ֱ�
			absolutepage=(pageNUM-1)*pagesize+1;
			ii = ii - (pageNUM-1)*pagesize;
		}

		String sql = "select b_id, b_name, b_email, b_title, b_content, ";
		sql = sql + " to_char(b_date,'yy-mm-dd'), b_hit, ref, step, anslevel "; 
		sql = sql + " from re_board order by ref desc, step ";
		sql = sql.toUpperCase().trim();
		ResultSet rs = stmt.executeQuery(sql);

		for(int k=1; k<absolutepage; k++)rs.next();
		int k=1;

		while(rs.next() && k<=pagesize){ 
			b_id=rs.getInt(1);			//�۹�ȣ
			b_name=rs.getString(2);		// �۾���
			b_email=rs.getString(3);	//�ۼ��� ����
			b_title=rs.getString(4);	// ������
			b_content=rs.getString(5);	//�۳���
			b_date=rs.getString(6);		//�ۼ���¥
			b_hit=rs.getInt(7);			// ��ȸ��
			level=rs.getInt(10);		//�� ����
			if(!b_email.equals("")) {
			mailto="<a href=mailto:"+b_email+">"+b_name+"</a>";
			} else {
				mailto=b_name; 
			}
            ii--;
 %>
		<tr height=22 bgcolor=ffffff onMouseOver=this.style.backgroundColor='#FFF8DE'  onMouseOut=this.style.backgroundColor='#FFFFFF'>
			<td width=50 align=center><%= ii %></td>
			<td width=230 align="left"><a href='show.jsp?b_id=<%= b_id %>'>
<%			
				if(level>0) { 
					for(int i = 0; i< level; i++){
 %>				&nbsp;
 <%
		        }
 %>
				<img src="img/reply.gif" width="16" height="16"border=0>  	
<% 
                } 
 %> 
             <%=b_title%></a></td>
			 <td width=100 align=center><%=b_date%></td>
			 <td width=100 align=center><%=b_name%></td>
			 <td width=60 align=center><%=b_hit%></td>
		  </tr>
<%
		k++;
		} 

		rs.close();
		stmt.close(); 
		con.close(); 
		pool.freeConnection("ora8", con); 
	} catch (Exception e) {
	out.println(e);
	}
%>

	</table>
	<table width=550 bgcolor=000000 border=0 cellpadding=0 cellspacing=0>
		<tr bgcolor=ffffff>
			<td width=10>&nbsp;</td>
			<td width=350  align=center valign=middle height=30>
  
<%		// ������ ������
			 int limit = 4 ;   //������ ����Ʈ ���� ����
			 //���� ������ ���ϱ�
			 int temp =(pageNUM-1) % limit ;
			 int startPage = pageNUM - temp;
			// [����] ��ũ �߰��ϱ�
			if ((startPage-limit)>0){ %>
				<a href='board_list.jsp?pageNUM=<%=startPage-1%>'>[����]<a>
<% 
			}
			 //������ ��ȣ �����ϱ�
			for(int i=startPage ; i<(startPage+limit);i++){
				if( i == pageNUM){%>
					&nbsp;<%=i%>&nbsp;
<% 
				} else { 
%>
					<a href='board_list.jsp?pageNUM=<%=i%>'><%=i%><a>
<%
					}
				 if(i >= pagecount) break;
			 }
			 //[����] ��ũ �߰�
			if ((startPage+limit)<=pagecount){ %>
  				<a href='board_list.jsp?pageNUM=<%=startPage+limit%>'>[����] <a>
<%
			}
%>
			</td>
			<td width=180 height=30 valign=middle align=right>
			<a href="write_form.jsp"><img src="img/m_bt10.gif" border=0 align=absmiddle></a>
			<a href="board_list.jsp"><img src="img/m_bt06.gif" border=0 align=absmiddle></a>
			</td>
			<td width=10>&nbsp;</td>
		</tr>
	</table>
</form>
	<jsp:include page="../common/basic_copyright.jsp" flush="true"/>
</body>
</html>
