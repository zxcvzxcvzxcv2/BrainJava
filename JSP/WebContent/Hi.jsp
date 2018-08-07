<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@page buffer="4kb" autoFlush="true" %>
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>인사하기</title>
</head>
<body>
   안녕하세요, <%= request.getParameter("NAME") %> <br/>
   
   Buffer Size : <%=out.getBufferSize() %> Byte
   
   <% 
   response.sendRedirect("http://www.hanb.co.kr/");
   %>
</body>
</html>