<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="DBError.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.sql.*" %>    

<%
	String gcode = request.getParameter("gcode");  //파라미터로  gcode값을 받는곳
	Connection conn = null;
	Statement stmt = null;
	
	try {
		Class.forName("org.apache.commons.dbcp.PoolingDriver");
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:apache:commons:dbcp:/webdb_pool");
		
		stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("select * from goodsinfo where gcode = '" + gcode + "'" );
		
		if (rs.next()) {
			String title   = rs.getString("title");
			String writer  = rs.getString("writer");
			int price      = rs.getInt("price");
			
			request.setAttribute("GCODE", gcode);
			request.setAttribute("TITLE", title);
			request.setAttribute("WRITER", writer);
			request.setAttribute("PRICE", price);
		}

	}
	catch (Exception e){
		e.printStackTrace();
	}

	finally {
		try {
			stmt.close();
		} catch (Exception ignored) {
		} 
		try {
			conn.close();
		} catch (Exception ignored) {
		}
	}

%>

<jsp:forward page="GoodsInfoViewer.jsp" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>sec</title>
</head>
<body>

</body>
</html>