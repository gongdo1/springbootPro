<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="/WEB-INF/views/include/top.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<link href="./css/modal.css" rel="stylesheet" type="text/css" charset="utf-8" />
<link  href="https://cdnjs.cloudflare.com/ajax/libs/fotorama/4.6.4/fotorama.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/fotorama/4.6.4/fotorama.js"></script>
</head>
<body>
<div class="container">
<h2>home</h2>
<div align="center" class="fotorama" id="fotorama" style="width:500px; height:300px;" data-auto="false" data-autoplay="true">
</div>
<br>
<c:if test="${avo == null }">
<div>
<h3 align="center">로그인</h3>
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
					<button onclick="" class="btn btn-primary">회원가입</button>
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
					<img src="/img/${avo.user_img }"  style="width: 60px; height: 50px;" />
				</div>
				<div>${avo.user_name }님 환영합니다!</div>
				<!-- <button type="button" class="btn btn-danger"
					onclick="location.href='logout.do'">로그아웃</button> -->
			</div>
			<br>
		
		</c:if>
		<!-- ----------------------------------------------------------------------------------- -->
		<div>
			<h4>최근 게시판 게시물(5개)</h4>
			<div id="demo"></div>
		</div>
		<br>
			<iframe width="600" height="400" src="https://www.youtube.com/embed/gI8zOmeXbVM" title="Bdd, Deft 인터뷰 | NS vs. KT | 02.16 | 2024 LCK 스프링 스플릿" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
</div>
<script>
document.addEventListener("DOMContentLoaded", fetchData); 

function fetchData() {
    fetch("/indexBoardList", {
        method: "GET",
        headers: {
            "Content-Type": "application/json",
        },
    })
    .then((response) => response.json())
    .then((data) => {  
    	console.log(data)
    	
    	let output="<ul>";
		for (var i = 0; i < data.length; i++) {
			output+="<li>"+data[i].bno+"번 <a href='/boardOne?bno=${board.bno }"
					+data[i].bno+"'>제목: "
					+data[i].btitle+"</a> "+" <span>작성자:"
					+data[i].account_id+"</span></li>";
		}
		output+="</ul>";
		document.getElementById("demo").innerHTML += output;
     
    }) 
    .catch((error) => {
        console.error('데이터를 불러오는 중 오류 발생:', error);
    }); 
}

function fotoramaData() {
    fetch("/fotoramaList", {
        method: "GET",
        headers: {
            "Content-Type": "application/json",
        },
    })
    .then((response) => response.json())
    .then((data) => {  
    	console.log(data)

        const $fotoramaDiv = $('#fotorama').fotorama();

        for (let i = 0; i < data.length; i++) {
           $fotoramaDiv.data('fotorama').push({
           img: "/img/"+data[i].mallImg,
           alt: data[i].mallName
           });
         }
				
    }) 
    .catch((error) => {
        console.error('데이터를 불러오는 중 오류 발생:', error);
    }); 
}

//호출을 추가하여 fotoramaData() 함수를 실행합니다.
fotoramaData();
</script>

<!-- <button onclick="fetchData();" >api호출버튼</button> -->
</body>
</html>