<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<%@page import="java.util.*" %>
<c:set var="date" value="<%= new Date() %>"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>상품 정보</title>
</head>
<body>

 <h3>상품 정보</h3>
 코드: ${GCODE } <br />
 제목: ${TITLE }<br />
 저자: ${WRITER }<br />
 가격: <fmt:formatNumber value="${PRICE }" type="currency" /><br />
  가격: <fmt:formatNumber value="${PRICE }" groupingUsed="true" /><br />
 
 <fmt:formatDate value="${date }" type="time" />
</body>
</html>