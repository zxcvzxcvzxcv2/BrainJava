<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>우승자 명단</title>
</head>
<body>
<% 
  String winners[] = new String[3];
  
  winners[0] = "이수현";
  winners[1] = "정세훈";
  winners[2] = "김진희";
  
  request.setAttribute("WINNERS", winners);
  RequestDispatcher dispatcher = request.getRequestDispatcher("WinnersView.jsp");
  
  dispatcher.forward(request, response);
%>


</body>
</html>