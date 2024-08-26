
<%@page import="db.com.semi.adminPlace.model.vo.Place"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    ArrayList<Place> list = (ArrayList<Place>)request.getAttribute("list");
	String select = (String)request.getAttribute("select");
	String search = (String)request.getAttribute("search");
    
		
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
    .mainlist{
background-color: #F6F5F0;
	width: 1000px;

    margin: auto;
    margin-top: 250px;
}
table tr{border: 1px solid black;
		box-sizing: border-box;
		background-color: white;
		border-radius: 50px;
}
table tr>td{
	border-radius: 50px;
}
table tr>th{
	border-radius: 50px;
}
tbody>tr:hover{
	background-color: #E4D4FA;
	cursor: pointer;
	text-decoration: underline;
}
table td{text-align: center;}
</style>
</head>
<body>
    <%@ include file = "/../views/common/adminMenubar.jsp" %>
    <div class="mainlist">
    <div class="adPlaceTitle">
        <br>
    <h2 align="center">장소 관리</h2>
    <br>
    <form id="selectForm" action="adPlace.pl?search=<%=search%>&select=">
        <div style="float: right; height: 50px; display: flex; align-items: center;">
            <select name="select" id="" style=" margin-right: 15px;" onchange="submitForm()">
                
               
                <option value="all">전체</option>
                <option value="rest" >식당</option>
                <option value="place">놀거리</option>   
            </select>
      
              
                <input style="margin-right: 15px; height: 20px; width: 200px; border-radius: 90px; border: 1px solid black;" type="text" placeholder="  검색할 장소명을 입력해주세요" name="Pname">
                <button type="submit" style="margin-right: 15px;">검색하기</button> 
            </form> 
            </div>
            <br>
            <script>
        function submitForm() {
           document.getElementById("selectForm").submit();
    
    }
        
        </script>
    
    </div>
    <br>
    <br>
    
    <div class="adPlacelist" align="center">
        <table>
        <thead>
        <tr>
        <th width="90" height="40">장소번호</th>
        <th width="250">장소명</th>
        <th width="120">폐업여부</th>
        <th width="150">장소 주소</th>
        <th  width="110" >장소번호</th>
        <th  width="90" >분류</th>
        <th  width="90" >별점</th>

        </tr>	
      <%if(list == null){ %>
        <tr>
        <th colspan="7"> 값이 존재하지 않습니다</th>
        </tr>
        
      	<%}else{ %>
        </thead>
        <tbody>
     	<% for(Place a : list) {%>
        <tr>
            <td  height="30"><%=a.getpNo() %></td>
            <td ><%=a.getpTitle() %></td>
            <td ><%=a.getpStatus() %></td>
            <td ><%=a.getAddress() %></td>
            
            <td  ><%=a.getpCall() %></td>
            
            <%if(a.getpSelectNum() == 100) {%>
            <td  >식당</td>
            <%}else if(a.getpSelectNum() == 200){ %>
             <td  >놀거리</td>
             <%} %>
            <td   ><%=a.getpScore() %></td>
           
        </tr>
   		<%}} %>
        </tbody>
        </table>
    
    
    
    
        
        <br><br>
        <div></div>
         
         
     
</body>
</html>