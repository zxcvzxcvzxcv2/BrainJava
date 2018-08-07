<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="../DBError.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@page import="java.sql.*" %> 

<%
   String gcode = request.getParameter("gcode");
   
   if(gcode == null) 
	   throw new Exception("상품코드를 입력하세요.");
   Connection conn = null;
   Statement stmt = null;
   
   String url = "jdbc:mysql://localhost:3306/webdb?useUnicode=true&characterEncoding=utf8";
   try {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(url, "root", "12345");
		
		if(conn == null)
			throw new Exception("데이터베이스에 연결할 수 없습니다.");
		stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery(
				"select * from goodsinfo where gcode = '" + gcode + "';");
		
		if (!rs.next())
			throw new Exception(
					     "상품코드(" + gcode + ")에 해당하는 데이터가 없습니다.");
		
		String title = rs.getString("title");
		String writer = rs.getString("writer");
		int price = rs.getInt("price");
		
		request.setAttribute("GCODE", gcode);
		request.setAttribute("TITLE", (title));
		request.setAttribute("WRITER", (writer));
		request.setAttribute("PRICE", (price));
   }
   finally{
	   try{
		   stmt.close();
	   }
	   catch (Exception ignored) {
	   }
	   try {
		   conn.close();
	   }
	   catch (Exception ignored) {
	   }
   }
 RequestDispatcher dispatcher = request.getRequestDispatcher("EditForm.jsp");
 dispatcher.forward(request, response);
%>




<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>sec</title>
</head>
<body>

</body>
</html>