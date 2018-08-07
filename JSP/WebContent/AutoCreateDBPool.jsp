<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="org.apache.commons.dbcp.*" %> 
<%@page import="org.apache.commons.pool.impl.*" %>
<%!
    public void jspInit() {
	GenericObjectPool objectPool = new GenericObjectPool();
	DriverManagerConnectionFactory connectionFactory
	          = new DriverManagerConnectionFactory(
	        "jdbc:mysql://localhost:3306/webdb?useUnicode=true&characterEncoding=utf8", "root", "12345");
	new PoolableConnectionFactory(connectionFactory, objectPool, null, null, false, true);
	   PoolingDriver driver = new PoolingDriver();
	   driver.registerPool("/webdb_Pool", objectPool);
}
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