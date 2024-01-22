<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스프링 쇼핑몰관리 ver1.0</title>
<link href="./css/test.css" rel="stylesheet" type="text/css" charset="utf-8" />
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	rel="stylesheet" type="text/css" />
<style type="text/css">
</style>
</head>
<body>
<nav class="navbar">
      <div class="navbar__logo">
        <i class="fas fa-blog"></i>
        <a href="#">AXCE Coding</a>
      </div>
      <ul class="navbar__menu">
        <li><a href="/">Home</a></li>
        <c:if test="${avo == null}">
        <li><a href="accountForm.do">회원가입</a></li>
        </c:if>
        <c:if test="${avo.admin == 'y'}">
        <li><a href="accountList.do">회원목록</a></li>
        </c:if>
        <li><a href="boardList.do">게시판</a></li>
        <li><a href="#">FAQ</a></li>
      </ul>
      <ul class="navbar__icons">
        <li><i class="fab fa-google"></i></li>
        <li><i class="fab fa-slack"></i></li>
      </ul>
      <a href="#" class="navbar__toggleBtn">
        <i class="fas fa-hamburger"></i>
      </a>
    </nav>

