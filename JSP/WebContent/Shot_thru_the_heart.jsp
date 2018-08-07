<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.io.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>파일 읽기</title>
</head>
<body>
<%
BufferedReader reader = null;
try {
	String filePath = application.getRealPath("/WEB-INF/Songs/Shot_thru_the_heart.txt");
	reader = new BufferedReader(new FileReader(filePath));
	while (true) {
		String str = reader.readLine();
		if (str == null)
			break;
		out.println(str + "<br>");
	}
}
catch (FileNotFoundException fnfe) {
	out.println("파일이 존재하지 않습니다.");
}
catch (IOException ioe) {
	out.println("파일을 읽을 수 없습니다.");
}
finally {
	try {
		reader.close();
	}
	catch (Exception e) {
		
	}
}
%>

</body>
</html>