<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품 상세보기</title>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	rel="stylesheet" type="text/css" />
<c:import url="/WEB-INF/views/include/top.jsp" />
</head>
<body>
<div class="container">
<h2>제품 상세보기</h2>
<br>
	    	<div class="table-responsive">
			<table class="table" >
				<tr>
					<th rowspan="3" style="width:300px;">
						   <img src="/img/${mOne.mallImg }" style="width:100%; height:200px;">
					</th>
					<td>${mOne.mallName }</td>
				</tr>
				<tr>
					<!-- <th>작성자</th> -->
					<td id="writerid">가격 : ${mOne.mallPrice }원</td>
				</tr>
				<tr>
					<!-- <th>작성일</th> -->
					<td>제품 등록일 : ${mOne.mallDate }</td>
				</tr>
				<tr>
					<th>추천수</th>
					<td></td>
				</tr>
				<tr>
					<th>제품상세정보</th>
					<td>${mOne.mallDesc }</td>
				</tr>
			</table>
		</div>
		<button id="btnModify" class="btn btn-dark" onclick="ck('${avo.account_id}')">주문하기</button>
		<button id="btnModify" class="btn btn-dark" >장바구니</button>
		<button id="btnList" type="button" onclick="location.href='/mallList'" class="btn btn-dark" >목록으로</button>
		<button id="btnDelete" class="btn btn-dark">제품 삭제</button>
		<!-- 로그인 하지 않은 유저, 글쓴이 로그인 유저 같지 않으면 수정, 삭제 버튼 비활성화 -->
 		<c:set var="loginUser" value="${avo.account_id }" />
		<c:set var="writer" value="${mOne.account_id }" />
		<c:choose>
			<c:when test="${loginUser eq writer }">
				<script>
					// 로그인 해서 로그인 유저가 글쓴이인 경우
					let btnDelete = document.getElementById('btnDelete');
					btnDelete.disabled=false;
					
					btnDelete.addEventListener('click', function() {
						alert("삭제되었습니다.");
						location.href = '/mallDelete?account_id=${mOne.account_id}&mallId=${mOne.mallId}';
					});
				</script>
			</c:when>
			<c:otherwise>
				<script>
					const btnDelete = document.getElementById('btnDelete');
					btnDelete.disabled=true;
					btnDelete.style.display="none";
				</script>
			</c:otherwise>
		</c:choose>

	<!-- 	<script>
		let btnList = document.getElementById('btnList');
		let btnReply = document.getElementById('"btnReply"');
		
		// 목록으로 버튼 클릭시
		btnList.addEventListener('click', function() {
		  location.href = 'boardList.do';
		});

		
	
		  function test(avo){
			  if(avo === ""){
				  alert("로그인 후 이용해주세요.");
				  location.href="/";
			  } else {
				  alert('댓ㄱㄹ');
				  location.href="";
			  } 
		  }
	
	</script> -->
<script>
	 function ck(avo){
		  if(avo === ""){
			  alert("로그인 후 이용해주세요.");
			  location.href="/";
		  } else {
			  location.href="/orderForm?mallId=${mOne.mallId}&account_id="+avo;
		  } 
	  }
</script>
</div>
</body>
</html>