<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "java.util.*" %>    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Insert title here</title>
</head>
<body>

<% 
  ArrayList<String> items = new ArrayList<String>();
  
    items.add("딸기");
    items.add("오렌지");
    items.add("복숭아");
    items.add("포도");
    items.add("수박");
    items.add("멜론");
  
  request.setAttribute("FRUITS", items);
  RequestDispatcher dispatcher = request.getRequestDispatcher("FruitsView.jsp");
  
  dispatcher.forward(request, response);
%>

</body>
</html>