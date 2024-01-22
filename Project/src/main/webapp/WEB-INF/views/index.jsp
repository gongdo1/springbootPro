<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/WEB-INF/views/include/top.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
</head>
<body>
<div class="container">
<h2>home</h2>
<c:if test="${avo == null }">
<div>
<form method="post" action="login.do" id="login-form">
            <div class="form-group" id="divId">
				<div class="col-lg-10">
					<input type="text" class="form-control onlyAlphabetAndNumber"
						id="account_id" name="account_id" data-rule-required="true"
						placeholder="아이디" maxlength="30" size="15">
				</div>
			</div>
			<div class="form-group" id="divPassword">
				<div class="col-lg-10">
					<input type="password" class="form-control" id="account_pwd"
						name="account_pwd" data-rule-required="true" placeholder="비밀번호"
						maxlength="30">
				</div>
			</div>
            <div class="form-group">
				<div class="col-lg-offset-2 col-lg-10">
					<button type="submit" class="btn btn-primary">로그인</button>
				</div>
			</div>
        </form>
</div>
</c:if>
		<!-- 로그인 했을 때의 정보---------------------------------------------------------------- -->
		<c:if test="${avo != null}">
			<div id="loginDiv">
				<a href=""></a>
				<div class="user_img">
					<img src="img/${avo.user_img }"  style="width: 60px; height: 50px;" />
				</div>
				<div>${avo.account_id }님안녕하세요!</div>
				<button type="button" class="btn btn-danger"
					onclick="location.href='logout.do'">로그아웃</button>
			</div>
		</c:if>
		<!-- ----------------------------------------------------------------------------------- -->
</div>
</body>
</html>