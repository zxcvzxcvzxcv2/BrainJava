<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="DBError.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.sql.*"%>

<%
	String gcode = request.getParameter("gcode");  //파라미터로  gcode값을 받는곳
	Connection conn = null;
	Statement stmt = null;
	
	try {
		String url = "jdbc:mysql://localhost:3306/webdb";
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(url, "root", "12345");
		
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




