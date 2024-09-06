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
  int reportlistcount = 0;
  if(session.getAttribute("reportlistcount") != null){
	  reportlistcount = (int)session.getAttribute("reportlistcount");
  }
  int oneclasscount = 0;
  if(session.getAttribute("oneclasscount") != null){
	  oneclasscount = (int)session.getAttribute("oneclasscount");
  }
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
	.adminMain{
		background-color: ;
		width: 1000px;
        height: 600px;
		margin: auto;
		margin-top: 250px;
		display: flex;
		justify-content: center; /
		align-items: center; 
	}
	.adminMaintable{
		background-color: #e4d4fa;
		width: 99%;
		height: 99%;
	
		box-sizing: border-box;
		border-spacing: 20px;
	}
	.adminMaintable th{
		
		background-color: white;
		border-radius: 100px;
		width: 50%;

	} 
	.adminMaintable hr{
		background-color: ;
		
	}
	.adminMaintable .maintitle{
	
		height: 10%;
	
	}
	.adminMaintable .count{

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
				<div class="maintitle"> 원데이클레스 강좌 수</div>
				<div class="count" id="count1"><%=oneclasscount %></div>

			</th>
			<th>	
				<div class="maintitle">신규 문의</div>
				<div class="count" id="count2"><%=quReadyCount %></div>
			</th>
		</tr>
		<tr>
			<th>	
				<div class="maintitle">신규 신고</div>
				<div class="count" id="count3"><%= reportlistcount %></div>
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