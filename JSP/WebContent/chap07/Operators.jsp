<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>익스프레션 언어 연산자 연습</title>
</head>
<body>
   X = ${param.NUM1 }, Y = ${param.NUM2  }<br/>
   
   X + Y = ${param.NUM1 + param.NUM2 } <br/>
   X - Y = ${param.NUM1 - param.NUM2 } <br/>
   X * Y = ${param.NUM1 * param.NUM2 } <br/>
   X / Y = ${param.NUM1 / param.NUM2 } <br/>
   X % Y = ${param.NUM1 % param.NUM2 } <br/>
   
   X가 더 큽니까? ${param.NUM1 - param.NUM2 > 0 } <br/>
   Y가 더 큽니까? ${param.NUM1 - param.NUM2 < 0 } <br/>
   
   X와 Y가 모두 양수입니까? ${(param.NUM1 > 0) && (param.NUM2 > 0)} <br/>
   X와 Y가 같습니까? ${param.NuM1 == param.NUM2? "예" : "아니오" } <br/>

</body>
</html>