<%@ page contentType="text/html;charset=euc-kr" %>

<%  
	String productnum= request.getParameter("productnum");

	if(session.getAttribute("pid") == null) {
%>
		<script language=javascript>
		alert("�α����� �ϼž� �մϴ�.");	    
		location.href="../member/login.jsp";
		</script> 
<%
	} else {
		response.sendRedirect("../product/basket_insert.jsp?productnum="+productnum);
	}
%>
