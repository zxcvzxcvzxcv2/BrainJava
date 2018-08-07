<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="DBError.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.sql.*"%>

<%
    request.setCharacterEncoding("UTF-8");
    
	String name = request.getParameter("name");
	String id = request.getParameter("id");
	String password = request.getParameter("password");

	if (name == null || id == null || password == null)
		throw new Exception("데이터를 입력하세요.");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	//Statement stmt = null;
	
	try {
		String url = "jdbc:mysql://localhost:3306/webdb?useUnicode=true&characterEncoding=utf8";
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(url, "root", "12345");
		
		if (conn == null)
			throw new Exception("데이터베이스에 연결할 수 없습니다.");
		
		//String command = String.format("insert into userinfo " + 
		 //           "(uname, uid, upassword) values ('%s', '%s', '%s');",
		 //            name, id, password);
		
	     //String sql="INSERT INTO userinfo(uname, uid, upassword) VALUES ('" + name + "'," + "'" + id + "'," + "'" + password + "')"; 
		  String sql = "INSERT INTO userinfo(uname, uid, upassword) value (?, ?, ?)";
	     
		  pstmt = conn.prepareStatement(sql);
		  pstmt.setString(1, name);
		  pstmt.setString(2, id);
		  pstmt.setString(3, password);
		  
		int rowNum = pstmt.executeUpdate();
		if (rowNum < 1)
			throw new Exception("데이터를 DB에 입력할 수 없습니다.");
	} 
	finally {
		try {
			pstmt.close();
		} 
		catch (Exception ignored) {
			
		}
		try {
			conn.close();
		} 
		catch (Exception ignored) {
		}
	}
	response.sendRedirect("SubscriptionResult.jsp");
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