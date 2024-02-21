<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="/WEB-INF/views/include/top.jsp" />
</head>
<body>
<div class="container">
<br>
	<h2>수정하기</h2>
	<div class="table-responsive">
	<form action="boardModifyInsert.do" method="post">
	<input type="hidden" name="account_id" value="${vo.account_id }">
	<input type="hidden" name="bno" value="${vo.bno }">
		<table class="table">
			<tr>
				<th>글 번호</th>
				<td>${vo.bno }</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td id="writerid">${vo.account_id }</td>
			</tr>
			<tr>
				<th>작성일</th>
				<td>${vo.bwrittendate }</td>
			</tr>
			<tr>
				<th>조회수</th>
				<td>${vo.breadcnt }</td>
			</tr>
			<tr>
				<th>추천수</th>
				<td>${vo.blike }</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>
				<input type="text" class="form-control" id="btitle" value="${vo.btitle }"
     			name="btitle" maxlength="100" required="required" pattern=".{4,100}" /></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea class="form-control" rows="5" id="bcontent"
 						   name="bcontent">${vo.bcontent }</textarea>
				</td>
			</tr>
		</table>
		<button id="btnModify" class="btn btn-dark">글 수정</button>
		</form>
	</div>
	
</div>
</body>
</html>