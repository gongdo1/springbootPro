<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
</head>
<body>
<div class="container">
  <h2>회원 목록</h2>
  <table class="table">
    <thead>
      <tr>
        <th>회원아이디</th>
        <th>회원이름</th>
        <th>회원성별</th>
        <th>회원핸드폰번호</th>
      </tr>
    </thead>
    <tbody>
    <c:forEach items="${li}" var="li" varStatus="status">
      <tr>
        <td>${li.account_id }</td>
        <td>${li.user_name }</td>
        <td>${li.user_gender }</td>
        <td>${li.user_phone }</td>
      </tr>
     </c:forEach>
    </tbody>
  </table>
</div>
</body>
</html>