<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<c:import url="/WEB-INF/views/include/top.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<style>
span{
	color: red;
}
</style>
<body>
	<div></div>
	<br>
	<div class="container">
	<h1>회원가입</h1>
		<form class="form-horizontal" role="form" method="post"
			action="accountInsert.do">
			<div class="form-group" id="divId">
				<div class="col-lg-10">
					<input type="text" class="form-control onlyAlphabetAndNumber"
						id="account_id" name="account_id" data-rule-required="true"
						placeholder="아이디" value="${userDto.account_id }" maxlength="30">
						<span>${valid_account_id}</span>
				</div>
			</div>
			<div class="form-group" id="divPassword">
				<div class="col-lg-10">
					<input type="password" class="form-control" id="account_pwd"
						name="account_pwd" data-rule-required="true" placeholder="비밀번호"
						maxlength="30">
						<span>${valid_account_pwd}</span>
				</div>
			</div>
			<div class="form-group" id="divEmail">
				<div class="col-lg-10">
					<input type="email" class="form-control" id="user_email"
						name="user_email" data-rule-required="true" placeholder="이메일주소"
						maxlength="40">
						<span >${valid_user_email}</span>
				</div>
			</div>
			<div class="form-group" id="divName">
				<div class="col-lg-10">
					<input type="text" class="form-control onlyHangul" id="user_name"
						name="user_name" data-rule-required="true" placeholder="이름"
						maxlength="15">
						<span >${valid_user_name}</span>
				</div>
			</div>
			<div class="form-group" id="divName">
				<div class="col-lg-10">
					<input type="text" class="form-control onlyHangul" id="user_birth"
						name="user_birth" data-rule-required="true" placeholder="생년월일 8자리"
						maxlength="8">
						<span >${valid_user_birth}</span>
				</div>
			</div>
			<div class="form-group" id="divPhoneNumber">
				<label for="inputPhoneNumber" class="col-lg-2 control-label">휴대폰
					번호</label>
				<div class="col-lg-10">
					<input type="tel" class="form-control onlyNumber" id="user_phone"
						name="user_phone" data-rule-required="true"
						placeholder="-를 제외하고 숫자만 입력하세요." maxlength="11">
						<span >${valid_user_phone}</span>
				</div>
			</div>
			<div class="form-group">
				<label for="inputPhoneNumber" class="col-lg-2 control-label">성별</label>
				<div class="col-lg-10">
					<select class="form-control" id="user_gender" name="user_gender">
						<option value="null">선택안함</option>
						<option value="m">남자</option>
						<option value="f">여자</option>
					</select>
					<%-- <span >${valid_user_gender}</span> --%>
				</div>
			</div>
			<div class="form-group">
				<div class="col-lg-offset-2 col-lg-10">
					<button type="submit" class="btn btn-primary">회원가입하기</button>
				</div>
			</div>
		</form>
	</div>
</body>
</html>