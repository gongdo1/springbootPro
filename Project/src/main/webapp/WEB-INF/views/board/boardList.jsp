<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<form action="" align="right">
	<select name="ch1" >
		<option value="btitle">제목</option>
		<option value="account_id">작성자</option>
	</select>
	<input type="text" name="ch2" >
	<input type="submit" value="검색">
</form>
<br>
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
        <td><a href="/boardOne?bno=${board.bno }">${board.btitle }</a></td>
        <td>${board.account_id }</td>
        <td>
        <fmt:parseDate value="${board.bwrittendate }" pattern="yyyy-MM-dd" var="date" />
		<fmt:formatDate value="${date}" pattern="yyyy-MM-dd"/>
	</td>
        <td>${board.breadcnt }</td>
        <td>${board.blike }</td>
      </tr>
     </c:forEach>
    </tbody>
  </table>
		<div id="paging" align="center">
			<c:if test='${startPage > 1 }'>
				<a href="/boardList?page=1&ch1=${ch1}&ch2=${ch2}">◁◁&nbsp;&nbsp;</a>
			</c:if>

			<c:if test="${param.page > 1 }">
				<a href="/boardList?page=${param.page-1 }&ch1=${ch1}&ch2=${ch2}">◁&nbsp;</a>
			</c:if>

			<c:forEach var="j" begin="${startPage }" end="${endPage }">
				<a href="/boardList?page=${j }&ch1=${ch1}&ch2=${ch2}">${j }&nbsp;&nbsp;</a>
			</c:forEach>

			<c:set var="page" value="${param.page }"></c:set>
			<c:set var="totalPage" value="${requestScope.totalPage }"></c:set>
			<c:set var="endPage" value="${requestScope.endPage }"></c:set>

			<c:if test="${page < totalPage }">
				<a href="/boardList?page=${param.page+1 }&ch1=${ch1}&ch2=${ch2}">▷&nbsp;&nbsp;</a>
			</c:if>

			<c:if test="${endPage < totalPage }">
				<a href="/boardList?page=${endPage }&ch1=${ch1}&ch2=${ch2}">▷▷</a>
			</c:if>
		</div>
		<div class="col-lg-offset-2 col-lg-10">
			<button type="button" onclick="ck('${avo.account_id}')"
				class="btn btn-primary">글쓰기</button>
		</div>
	</div>
<script>
	function ck(avo) {
		if (avo === "") {
			alert("로그인 후 이용해주세요.");
			location.href = "/";
		} else {
			location.href = "/boardForm";
		}
	}
</script>
</body>
</html>