<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/WEB-INF/views/include/top.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>롤전적검색</title>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>
<body>
	<div class="container">
		<h2>롤전적검색</h2>
		<div>
			<form action="/sertest">
				<input type="text" name="summonerName"> 
				<input type="submit" value="검색">
			</form>
			<div>
				<img
					src="https://ddragon.leagueoflegends.com/cdn/14.2.1/img/profileicon/${summoner.profileIconId}.png"
					style="height: 50px; width: 50px;" /> 이름 : ${summoner.name }<br>
				레벨 : ${summoner.summonerLevel }
				<%-- ${mvo }  --%>

			</div>
			<table border=1 style="width: 550px;">
				<tr align="center" bgcolor="orange">
					<td>승리팀/${info.gameMode }</td>
					<td>챔피언레벨</td>
					<td>킬뎃어시</td>
					<td>총피해량</td>
					<td>총받은피해량</td>
					<td>CS</td>
					<td>총획득골드</td>
					<td>아이템</td>
				</tr>
				<c:forEach items="${participant}" var="participant"
					varStatus="status">
					<c:if test="${participant.teamId eq '100'}">
						<tr>
							<td>${participant.summonerName}
								Level${participant.summonerLevel}</td>
							<td><img
								src=https://ddragon.leagueoflegends.com/cdn/10.6.1/img/champion/${participant.championName}.png
								style="height: 20px; width: 20px;" />${participant.champLevel}</td>
							<td>${participant.kills}/${participant.deaths}/${participant.assists}</td>
							<td>${participant.totalDamageDealtToChampions}</td>
							<td>${participant.totalDamageTaken}</td>
							<td>${participant.totalMinionsKilled}</td>
							<td>${participant.goldEarned}</td>
							<td><img
								src="https://ddragon.leagueoflegends.com/cdn/14.2.1/img/item/${participant.item0}.png"
								style="height: 20px; width: 20px;" /> <img
								src="https://ddragon.leagueoflegends.com/cdn/14.2.1/img/item/${participant.item1}.png"
								style="height: 20px; width: 20px;" /> <img
								src="https://ddragon.leagueoflegends.com/cdn/14.2.1/img/item/${participant.item2}.png"
								style="height: 20px; width: 20px;" /> <img
								src="https://ddragon.leagueoflegends.com/cdn/14.2.1/img/item/${participant.item3}.png"
								style="height: 20px; width: 20px;" /> <img
								src="https://ddragon.leagueoflegends.com/cdn/14.2.1/img/item/${participant.item4}.png"
								style="height: 20px; width: 20px;" /> <img
								src="https://ddragon.leagueoflegends.com/cdn/14.2.1/img/item/${participant.item5}.png"
								style="height: 20px; width: 20px;" /></td>
						</tr>
					</c:if>
				</c:forEach>
				<tr align="center" bgcolor="orange">
					<td>패배팀</td>
					<td>챔피언레벨</td>
					<td>킬뎃어시</td>
					<td>총피해량</td>
					<td>총받은피해량</td>
					<td>CS</td>
					<td>총획득골드</td>
					<td>아이템</td>
				</tr>
				<c:forEach items="${participant}" var="participant"
					varStatus="status">
					<c:if test="${participant.teamId eq '200'}">
						<tr>
							<td>${participant.summonerName}
								Level${participant.summonerLevel}</td>
							<td><img
								src=https://ddragon.leagueoflegends.com/cdn/10.6.1/img/champion/${participant.championName}.png
								style="height: 20px; width: 20px;" />${participant.champLevel}</td>
							<td>${participant.kills}/${participant.deaths}/${participant.assists}</td>
							<td>${participant.totalDamageDealtToChampions}</td>
							<td>${participant.totalDamageTaken}</td>
							<td>${participant.totalMinionsKilled}</td>
							<td>${participant.goldEarned}</td>
							<td><img
								src="https://ddragon.leagueoflegends.com/cdn/14.2.1/img/item/${participant.item0}.png"
								style="height: 20px; width: 20px;" /> <img
								src="https://ddragon.leagueoflegends.com/cdn/14.2.1/img/item/${participant.item1}.png"
								style="height: 20px; width: 20px;" /> <img
								src="https://ddragon.leagueoflegends.com/cdn/14.2.1/img/item/${participant.item2}.png"
								style="height: 20px; width: 20px;" /> <img
								src="https://ddragon.leagueoflegends.com/cdn/14.2.1/img/item/${participant.item3}.png"
								style="height: 20px; width: 20px;" /> <img
								src="https://ddragon.leagueoflegends.com/cdn/14.2.1/img/item/${participant.item4}.png"
								style="height: 20px; width: 20px;" /> <img
								src="https://ddragon.leagueoflegends.com/cdn/14.2.1/img/item/${participant.item5}.png"
								style="height: 20px; width: 20px;" /></td>
						</tr>
					</c:if>
				</c:forEach>
			</table>
			<table border=1 style="width: 500px;">
				<tr align="center" bgcolor="orange">
					<td>전적</td>
				</tr>
				<c:forEach items="${matchids}" var="matchids" varStatus="status">
					<tr>
						<td>
						<a href="/machid?machid=${matchids }&summonerName=${summoner.name }">${matchids}<%-- /${info.gameEndTimestamp } --%></a></td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
<script>
/* document.addEventListener("DOMContentLoaded", fetchData); */

function fetchData() {
    fetch("/machidJson", {
        method: "GET",
        headers: {
            "Content-Type": "application/json",
        },
    })
    .then((response) => response.json())
    .then((data) => {  
    	console.log(data)
        
    	
    	// 받아온 데이터를 출력할 HTML 문자열 생성
            let output = "";
            data.forEach(item => {
                output += '<table border=1>';
                output += '<tr>';
                output += '<td>승리팀</td>';
                output += '<td>챔피언레벨</td>';
                output += '<td>킬뎃어시</td>';
                output += '<tr/>';
                output += '<tr>';
                output += '<td>' + item.summonerName + '</td>';
                output += '<td>' + item.totalDamageDealtToChampions + '</td>';
                output += '<td>' + item.goldEarned + '</td>';
                output += '</tr>'
                output += '</table>';
            });
            
            // 생성된 HTML 문자열을 body에 추가
            document.body.innerHTML += output;
    	
   /*  		// 받아온 데이터를 출력할 요소를 찾습니다.
            const outputDiv = document.getElementById('demo');
            
            // 받아온 데이터를 출력할 요소의 내용으로 설정합니다.
            outputDiv.textContent = JSON.stringify(data);   */

     
    }) 
    .catch((error) => {
        console.error('데이터를 불러오는 중 오류 발생:', error);
    }); 
}
</script>
<div id="demo">
		
	</div>
<!-- <button onclick="fetchData();" >api호출버튼</button> -->
</body>
</html>