<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
   

  String str1 = request.getParameter("NUM1");
  String str2 = request.getParameter("NUM2");

  int num1 = 0, num2 = 0, result = 0;
  
  num1 = Integer.parseInt(str1);
  num2 = Integer.parseInt(str2);
  result = num1 * num2;

 %>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Insert title here</title>
</head>
<body>
 <%= num1 %> * <%= num2 %> = <%= result %>
</body>
</html>