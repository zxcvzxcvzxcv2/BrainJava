<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>개인정보 출력 예제</title>
</head>
<body>

<h2>개인정보 출력</h2>

이 름 : <%= request.getParameter("ID") %><br />
전화번호 : <%= request.getParameter("NUMBER") %><br />

</body>
</html>