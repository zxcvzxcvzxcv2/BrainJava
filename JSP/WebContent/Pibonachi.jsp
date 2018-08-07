<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Insert title here</title>
</head>
<body>

	<%
 int a = 1, b = 1, c = 0;
%>

	<%=a %>
	<%=b %>

	<%
  while(true) {		
  c = a + b;
  a = b;
  b = c;
			
  if(c < 100)
  {
%>
	<%=c %>
<%
    }
      else
          break;
    }
%>

</body>
</html>