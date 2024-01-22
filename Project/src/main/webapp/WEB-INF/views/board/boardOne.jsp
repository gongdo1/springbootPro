<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 상세보기</title>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	rel="stylesheet" type="text/css" />
<c:import url="/WEB-INF/views/include/top.jsp" />
</head>
<body>
<div class="container">
<h2>게시글 상세 화면</h2>
	    	<div class="table-responsive">
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
					<td>${vo.btitle }</td>
				</tr>
				<tr>
					<th>내용</th>
					<td>${vo.bcontent }<br /> 
					<img src="" />
					</td>
				</tr>
			</table>
		</div>
		<button id="btnModify" class="btn btn-dark">글 수정</button>
		<button id="btnDelete" class="btn btn-dark">글 삭제</button>
		<!-- 로그인 하지 않은 유저, 글쓴이 로그인 유저 같지 않으면 수정, 삭제 버튼 비활성화 -->
 		<c:set var="loginUser" value="${avo.account_id }" />
		<c:set var="writer" value="${vo.account_id }" />
		
		<c:choose>
			<c:when test="${loginUser eq writer }">
				<script>
					// 로그인 해서 로그인 유저가 글쓴이인 경우
					const btnModify = document.getElementById('btnModify');
					const btnDelete = document.getElementById('btnDelete');
					btnModify.disabled=false;
					btnDelete.disabled=false;
				</script>
			</c:when>
			<c:otherwise>
				<script>
					const btnModify = document.getElementById('btnModify');
					const btnDelete = document.getElementById('btnDelete');
					btnModify.disabled=true;
					btnModify.style.display="none";
					btnDelete.disabled=true;
					btnDelete.style.display="none";
				</script>
			</c:otherwise>
		</c:choose>
		
		<button id="btnReply" type="button" class="btn btn-dark">댓글달기</button>
		<button id="btnList" type="button" class="btn btn-dark" >목록으로</button>
		<script>
		const btnList = document.getElementById('btnList');
		// 목록으로 버튼 클릭시
		btnList.addEventListener('click', function() {
		  location.href = 'boardList.do';
		})
				
	</script>
</div>
</body>
</html>