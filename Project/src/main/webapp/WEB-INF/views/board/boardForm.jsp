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
<h1>게시판 글쓰기</h1>
<div class="form-group">
  <form action="/boardInsert" method="post">
    <div class="form-group">
      <label for="title">제목</label>
<!-- placeholder 속성 입력한 데이터가 없는 경우 배경으로 나타난다.실제적으로 입력을 100자까지로 지정 -->
<!-- required 속성을 설정하면 필수입력 사항이된다. -->
<!-- pattern 속성을 이용한 정규표현식으로 데이터의 유효성 검사를 할 수 있다. -->
      <input type="text" class="form-control" id="btitle" placeholder="제목 입력(2-100)" 
      name="btitle" maxlength="100" required="required" pattern=".{2,100}">
    </div>
    <div class="form-group">
   <label for="content">내용</label>
<!--  여러줄의 데이터를 입력하고 하고자 할때 textarea 태그를 사용한다. -->
<!--  textarea 안에 있는 모든 글자는 그대로 나타난다. 공백문자, tag, enter -->
   <textarea class="form-control" rows="5" id="bcontent"
    name="bcontent" placeholder="내용 작성"></textarea>
 </div>
    <div class="form-group">
      <label for="writer">작성자</label>
      <input type="text" class="form-control" id="account_id"
       placeholder="작성자(2자-10자)" name="account_id" value="${avo.account_id }" readonly="readonly" />
    </div>
    <button type="submit" class="btn btn-primary">등록</button>
  </form>
</div>
</div>
</body>
</html>