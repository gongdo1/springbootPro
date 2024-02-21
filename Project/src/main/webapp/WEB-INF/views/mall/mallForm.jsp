<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	rel="stylesheet" type="text/css" />
<c:import url="/WEB-INF/views/include/top.jsp" />
</head>
<body>
<div class="container">
<h1>제품 등록</h1>
<div class="form-group">
  <form action="/mallInsert" method="post" enctype="multipart/form-data">
    <div class="form-group">
      <label for="title">제품번호</label>
    <input type="text" class="form-control"  name="mallId" value="${mallId }" readonly="readonly" />
    </div>
    <div class="form-group">
   <label for="content">제품이름</label>
	<input type="text" class="form-control" name="mallName"  id="mallName">
 	</div>
 	<div class="form-group">
   <label for="content">제품가격</label>
	<input type="text" class="form-control" name="mallPrice"  id="mallPrice"
		oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
 	</div>
 	<div class="form-group">
   <label for="comment">제품상세설명</label>
  <textarea class="form-control" rows="5" name="mallDesc"  id="mallDesc"></textarea>
 	</div>
    <div class="form-group">
   <label for="content">제품사진</label>
	<input type="file" class="form-control-file border" name="mallFile"  >
	<p class="card-text">사진 미첨부시 기본이미지로 대체됩니다.</p>
 	</div>
    <div class="form-group">
      <label for="writer">작성자</label>
      <input type="text" class="form-control" name="account_id" value="${avo.account_id }" readonly="readonly" />
    </div>
    <button type="submit" class="btn btn-primary">등록</button>
  </form>
</div>
</div>
</body>
</html>