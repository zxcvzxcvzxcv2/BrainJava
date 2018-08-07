<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  

<h4>책 정보</h4>
<table border="1">
  <tr>
    <td width="70">상품코드</td>
    <td width="250">제목</td>
    <td width="100">저자</td>
    <td width="80">가격</td>
    <td width="120">&nbsp;</td>
  </tr>
  <c:forEach var="cnt" begin="0" end="${BOOKS_INFO.size - 1 }">
     <tr>
       <td>${BOOKS_INFO.code[cnt] }</td>
       <td>${BOOKS_INFO.title[cnt] }</td>
       <td>${BOOKS_INFO.writer[cnt] }</td>
       <td>${BOOKS_INFO.price[cnt] }원</td>
       <td><a href="#" onClick='window.open(
       "add-item-to-cart?CODE=${BOOKS_INFO.code[cnt] }",
       "cart_result", "width=400, height=150").focus()'>
           장바구니 담기</a></td>
     </tr>
  </c:forEach>
</table>
<c:if test="${!BOOKS_INFO.lastPage }">
      <a href='books-info?LAST_CODE=${BOOKS_INFO.code[BOOKS_INFO.size - 1] }'>다음 페이지</a>
</c:if>
