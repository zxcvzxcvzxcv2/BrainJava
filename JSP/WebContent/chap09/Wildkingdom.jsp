<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>동물의 왕국</title>
</head>
<body>
사자의 생일잔치에 누가 왔을까요? <br/><br/>
<c:set var="guests" value="토끼^거북이/사슴"/>
<c:forTokens var="animal" items="${guests }" delims="^^/">
   ${animal } <br/>
</c:forTokens>

</body>
</html>