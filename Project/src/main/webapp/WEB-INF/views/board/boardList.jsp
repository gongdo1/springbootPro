<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="/WEB-INF/views/include/top.jsp" />
</head>
<body>
<div class="container">
<h2>게시판</h2>
<table class="table">
    <thead>
      <tr>
      	<th>번호</th>
        <th>제목</th>
        <th>작성자</th>
        <th>작성일</th>
        <th>조회수</th>
        <th>좋아요</th>
      </tr>
    </thead>
    <tbody>
    <c:forEach items="${board }" var="board" varStatus="status">
      <tr>
      	<td>${board.bno }</td>
        <td><a href="boardOne.do?bno=${board.bno }">${board.btitle }</a></td>
        <td>${board.account_id }</td>
        <td>${board.bwrittendate }</td>
        <td>${board.breadcnt }</td>
        <td>${board.blike }</td>
      </tr>
     </c:forEach>
    </tbody>
  </table>
<div class="col-lg-offset-2 col-lg-10">
<button type="button" onclick="test('${avo.account_id}')"class="btn btn-primary">글쓰기</button>
</div>
</div>
<script>
  function test(avo){
	  if(avo === ""){
		  alert("로그인 후 이용해주세요.");
		  location.href="/";
	  } else {
		  location.href="boardForm.do";
	  } 
  }
 </script>
</body>
</html>