<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>회원 가입 결과</title>

<script type="text/javascript">
function goto_userInfoAllView() 
{
	location.href="SubscriptionAll.jsp";
}
</script>

</head>
<body>
<h3>회원 가입 결과</h3>
가입되었습니다.<br/><br/>

<form method="post" action="servletName">   
     <input type="button" value="전체회원 보기"  onclick="javascript:goto_userInfoAllView();"/>
 
</form>
</body>
</html>