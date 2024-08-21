<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <% 
    int quReadyCount = 0;
    if(session.getAttribute("Readylistcount") != null){
        quReadyCount = (int)session.getAttribute("Readylistcount");
    }
  int adMemberlistCount = 0;
  if(session.getAttribute("adMemberlistCount") != null){
		  adMemberlistCount = (int)session.getAttribute("adMemberlistCount");}
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
	.adminMain{
		background-color: yellow;
		width: 1000px;
        height: 600px;
		margin: auto;
		margin-top: 250px;
		display: flex;
		justify-content: center; /
		align-items: center; 
	}
	.adminMaintable{
		background-color: yellow;
		width: 99%;
		height: 99%;
		border: 1px solid black;
		box-sizing: border-box;
		border-spacing: 20px;
	}
	.adminMaintable th{
		border: 1px solid black;
		background-color: white;
		border-radius: 100px;
		width: 50%;

	} 
	.adminMaintable hr{
		background-color: yellow;
		
	}
	.adminMaintable .maintitle{
		border: 1px solid black;
		height: 10%;
	
	}
	.adminMaintable .count{
		border: 1px solid black;
		height: 80%;
		display: flex;
		justify-content: center;
		align-items: center;
		text-align: center;
		font-size: 50px;
		
	}
</style>
</head>
<body>
	 <%@ include file = "/../views/common/adminMenubar.jsp" %>
	
	 <div class="adminMain" align="center">
		<table class="adminMaintable">
		<tr>
			<th>
				<div class="maintitle">신규 원데이클레스 신청</div>
				<div class="count" id="count1">123</div>

			</th>
			<th>	
				<div class="maintitle">신규 문의</div>
				<div class="count" id="count2"><%=quReadyCount %></div>
			</th>
		</tr>
		<tr>
			<th>	
				<div class="maintitle">신규 신고</div>
				<div class="count" id="count3">123</div>
			</th>
			<th>	
				<div class="maintitle">총 회원수</div>
				<div class="count" id="count4"><%=adMemberlistCount %></div>
			</th>
		</tr>
		</table>

		<script>
			function createCounter(id, target) {
			  let count = 0;
			  let element = document.getElementById(id);
			  let interval = setInterval(function(){
				if (count >= target) {
				  clearInterval(interval);
				} else {
				  count += 1;
				  element.innerHTML = new Intl.NumberFormat().format(count);
				}
			  }, 10); // 숫자가 증가하는 속도 설정
			}
		  
			// 각 카운터를 초기화
			let num1 = parseInt(document.getElementById("count1").innerHTML, 10);
			let num2 = parseInt(document.getElementById("count2").innerHTML, 10);
			let num3 = parseInt(document.getElementById("count3").innerHTML, 10);
			let num4 = parseInt(document.getElementById("count4").innerHTML, 10);
		  
			createCounter("count1", num1);
			createCounter("count2", num2);
			createCounter("count3", num3);
			createCounter("count4", num4);
		  </script>

	 </div>
	 

</body>
</html>