<%@ page contentType="text/html;charset=EUC_KR"  %>

<%
     if( session.getAttribute("pid") == null) {
%>
    <script language="Javascript">
	   alert("�α����� �ϼ���")
	   location.href="../member/login.jsp";
    </script>
<%
	} else {
%>

<html>
<head>
  <title>��ǻ���������θ�</title>
	<LINK href="../common/u3.css" type=text/css rel=STYLESHEET>
	<SCRIPT language=JavaScript src="../common/u3.js"></script>
<script type="text/javascript">

function deleteConfirm(){
	if (confirm("���� Ż�� �Ͻðڽ��ϱ�??") == true){    //Ȯ��
    	//document.form.submit();
	    location.href="delete.jsp";
	}else{   //���
		history.go(-1);
    	//return;
	}
}
</script>

</head>

<body onload="deleteConfirm();">

</body>
</html>
<% } %>