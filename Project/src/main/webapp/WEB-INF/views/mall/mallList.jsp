<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>굿즈 목록</title>
<c:import url="/WEB-INF/views/include/top.jsp" />
</head>
<body>
<br>
<div class="container">
  <h2>굿즈 목록</h2>
  <p></p>
  <div class="card-columns">
<c:forEach items="${mvo }" var="mvo" varStatus="status">
  <div class="card" style="width:235px; ">
    <img class="card-img-top" src="/img/${mvo.mallImg }" alt="Card image" style="width:100%; height:250px;">
    <div class="card-body">
      <h4 class="card-title" style="">${mvo.mallName }</h4>
      <p class="card-text"></p>
      <a href="/mallOne?mallId=${mvo.mallId }" class="btn btn-primary">제품 상세보기</a>
    </div>
  </div>
</c:forEach>
 </div>
</div>

</body>
</html>