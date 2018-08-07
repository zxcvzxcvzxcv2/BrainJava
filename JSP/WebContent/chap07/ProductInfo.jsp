<?xml version="1.0" encoding="UTF-8" ?>
<%@ page import="chap07.ProductInfo" language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
       <jsp:useBean class="chap07.ProductInfo" id="PRODUCT" scope="request"/>
   <jsp:setProperty property="name" name="PRODUCT" value="초코케이크 3호"/>
   <jsp:setProperty property="price" name="PRODUCT" value="20000"/>원
   
  <jsp:forward page="ProductInfoView.jsp"/>
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Insert title here</title>
</head>
<body>



   


</body>
</html>