<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="DBError.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<jsp:useBean id="bbsItem" class="chap13.BBSItem" />
 <jsp:setProperty name="bbsItem" property="seqNo" value="${param.SEQ_NO }"/>
<% bbsItem.readDB(); %>
<h4>게시글 읽기</h4>
[제목]    ${bbsItem.title } <br/>
[작성자]  ${bbsItem.writer } <br/>
[작성일시] ${bbsItem.date } ${bbsItem.time }<br/>
---------------------------------------------------------<br />
${bbsItem.content }
