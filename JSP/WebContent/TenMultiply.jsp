<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>1부터 10까지의 곱</title>
<!--  이것은 JSP에 의해 생성된 HTML문서입니다. -->
</head>
<body>
<%-- 다음은 데이터를 처리하는 스크립틀릿입니다. --%>

<% int result = 1; // 곱을 저장할 변수

/* 1부터 10까지 곱하는 반복문*/
   for (int cnt = 1; cnt <= 10; cnt++)
	   result *= cnt;
%>
   
   1부터 10까지 곱한 값은? <%= result %>
</body>
</html>