<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Insert title here</title>
</head>
<body>

<% 
int sum = 0;
for (int cnt = 1; cnt <= 100; cnt++)
sum += cnt;
request.setAttribute("RESULT", new Integer(sum));
RequestDispatcher dispatcher = request.getRequestDispatcher("HundredResult.jsp");
dispatcher.forward(request,response);
%>

</body>
</html>