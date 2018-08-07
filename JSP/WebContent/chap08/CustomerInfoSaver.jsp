<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<jsp:useBean class="chap08.PersonalInfo" id="pinfo" scope="request"/>
<jsp:setProperty property="name" name="pinfo" value="김현수"/>
<jsp:setProperty property="gender" name="pinfo" value="남"/>
<jsp:setProperty property="age" name="pinfo" value="23"/>

<jsp:forward page="CustomerInforViewer.jsp"/>
    