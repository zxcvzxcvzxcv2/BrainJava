<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="../DBError.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@page import="java.sql.*"%>  
<%
   request.setCharacterEncoding("utf-8");
   String gcode = request.getParameter("gcode");
   String title = request.getParameter("title");
   String writer = request.getParameter("writer");
   String price = request.getParameter("price");
   
   if (gcode == null || title == null || writer == null || price == null)
	   throw new Exception("누락된 데이터가 있습니다.");
   
   Connection conn = null;
   //PreparedStatement pstmt = null;
   //String sql = "";
   Statement stmt = null;
   String url = "jdbc:mysql://localhost:3306/webdb?useUnicode=true&characterEncoding=utf8";

   try {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(url, "root", "12345");
		
		if(conn == null)
			throw new Exception("데이터베이스에 연결할 수 없습니다.");
		
		//sql = "update goodsinfo set title=?, writer=?, price=? where gcode=?";
	    // pstmt=conn.prepareStatement(sql);
	     //pstmt.setString(2, title);
	    // pstmt.setString(3, writer);
	    // pstmt.setString(4, price);
	    // pstmt.setString(1, gcode);

	    stmt  = conn.createStatement();
		String command = String.format("update goodsinfo set " +
		                             "title := '%s', writer := '%s', " + 
		                              "price := '%s' where gcode = '%s';",
		                               title, writer, price, gcode);
		
		int rowNum = stmt.executeUpdate(command);
		if (rowNum < 1) 
			throw new Exception("데이터를 DB에 입력할 수 없습니다.");
   }
	finally {
		try {
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
   response.sendRedirect("UpdateResult.jsp?gcode=" + gcode);
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