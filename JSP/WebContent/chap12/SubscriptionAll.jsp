<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="DBError.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.util.*"%>
<%@page import="chap12.Subscription"%>

 <%
    ArrayList<Subscription> subInfoList = new ArrayList<Subscription>();
 Subscription subInfo;
 
 	Connection conn = null;
	Statement stmt = null;
 	try{
		String url = "jdbc:mysql://localhost:3306/webdb";
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(url, "root", "12345");
		stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("select * from userinfo");
		// GoodsInfo테이블 컬럼명 -  gcode	title	writer	price
		
		while(rs.next()) {
		
			subInfo = new Subscription();
			subInfo.setUname(rs.getString("uname"));
			subInfo.setUid(rs.getString("uid"));
			subInfo.setUpassword(rs.getString("upassword"));
		
			subInfoList.add(subInfo); // DB에서 조회된 데이터를 리스트에 저장
		}
	
		request.setAttribute("SubInfoList", subInfoList); 
		                        // GoodsInfoList를 request영역에 저장
	       
	}catch(Exception e) {
		e.printStackTrace();
	}
	finally {
		try{
			stmt.close();
		}catch(Exception e) {}
	
		try{
			conn.close();
		}catch(Exception e){}
	}
%>
<jsp:forward page = "SubscriptionAllResult.jsp" />

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>sec</title>
</head>
<body>

</body>
</html>