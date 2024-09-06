<%@page import="db.com.semi.adminMember.model.vo.Attechment"%>
<%@page import="javax.print.attribute.UnmodifiableSetException"%>
<%@page import="db.com.semi.adminMember.model.vo.AdMember"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <% AdMember list = (AdMember)request.getAttribute("list");  
    Attechment at = (Attechment)request.getAttribute("at");  
    String mno = request.getParameter("Mno");
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

table th,table td{
background-color: white;
border-radius: 20px;

}

table{
    border-collapse: separate; /* 기본값이 separate이지만, 명시적으로 설정 */
    border-spacing: 15px;
}
.adlistbutton a{
    margin: 20px;
}
.adlistbutton button{
font-size: 25px;

background-color: #E4D4FA;
border: 0;
height: 60px;
width: 150px;
border-radius: 10px;
}
.adlistbutton button:hover{
    cursor: pointer;
}
.penaltyjon{
    left: 50%;
    right: 50%;
    position: fixed;
    top: 480px;
    /* top:200px; */
       transform: translate(-50%, -50%);
       border-radius: 30px;
       border: 1px solid black;
       display: none;
       
}
table *{
    border: 1px solid black;
}
.penaltyjon button{
    background-color: #E4D4FA;
    width: 120px;
    height: 40px;
    border-radius: 10px;
    border: 1px solid black;
}
.penaltyjon td{
    border: 0;
  
}

.penaltyjon button:hover{
    background-color: purple;
    cursor: pointer;
}
.penaltyjon input{
    border-radius: 20px;
    height: 20px;
}
</style>
</head>
<body>
   <%@ include file = "/../views/common/adminMenubar.jsp" %>
    <div class="penaltyjon" style="background-color: white; width: 700px; height: 300px;">
	
	<br>
	<h2 align = "center"> 회원 제제 </h2>
	<br>
    <form action="adpenaltytime.ap" method="post">
	<table align = "center">
        <tr>
            <th>정지시간</th>
            <td><input type="number" max="24" min="0" style="width: 96.5%;" name="penaltytime" class="penaltytime"></td>
        </tr>
        <input type="hidden" name="Mno" value="<%= mno %>">
        <input type="hidden" name="userNo" value="<%= list.getUserNo() %>">
        <input type="hidden" name="userName" value="<%= list.getUserName() %>">
        <input type="hidden" name="userId" value="<%= list.getUserId() %>">
        <tr>
            <th>정지일</th>
            <td><input type="number" name="penaltyday" class="penaltyday" value="0" min="0"></td>
        </tr>
   
    </table>
    <br>
    <div align="center" name="test">
    <button onclick="alltime()" type="button">영구정지</button>&nbsp;
    <button type="submit">회원 제제</button> &nbsp;
    <button onclick="closepenalty()" class="toggleButton" type="button">취소</button>
    </div>
    </div>
    </form>
    <script>
      function alltime(){
       const penaltyday = document.getElementsByClassName("penaltyday")
       const penaltytime = document.getElementsByClassName("penaltytime")
      
        penaltyday[0].value = 99999999999999 ;
        penaltytime[0].value = 24 ;
      }
      function closepenalty(){
        const penaltyjon =   document.getElementsByClassName("penaltyjon")
        penaltyjon[0].style.display = 'none'
       
      }
    </script>
   


   <div class="mainlist">
   <br>  
   <h2 align = "center"> 회원 상세 보기</h2>
   <br>
   <table align="center">
    <thead></thead>
    <tbody>
        <tr>
            <th width="100" height="30">회원번호</th>
            <td width="250">&nbsp; <%=list.getUserNo() %></td>
            <th width ="100">아이디</th>
            <td width ="275" >&nbsp; <%=list.getUserId() %></td>
            <td width="175" rowspan="4"><%if(at==null){%>프로필 사진이 없습니다 <%}else{%> <img style="max-width: 175px;" alt="" src="<%=contextPath+at.getFilePath()+at.getChangeName() %>">
            <%} %></td>
        </tr>
        <tr>
            <th  height="30">회원명</th>
            <td>&nbsp; <%=list.getUserName() %></td>
            <th>비밀번호</th>
            <td>&nbsp; <%=list.getUserPwd() %></td>
        </tr>
        <tr>
            <th  height="30">닉네임</th>
            <td >&nbsp; <%=list.getNickname() %></td>
            <th>전화번호</th>
            <td>&nbsp; <%=list.getPhone() %></td>
        </tr>
        <tr>
            <th height="30">가입일자</th>
            <td>&nbsp; <%=list.getEnrollDate() %></td>
            <th>누적신고수</th>
            <td>&nbsp; <%=list.getReportCount() %></td>
        </tr>
        <tr>
            <th  height="50">이메일</th>
            <td>&nbsp; <%=list.getEmail()%></td>
            <th rowspan="2"  height="100">자기소개</th>
            <td rowspan="2" colspan="2"><%=list.getIntroduce() %></td>
        </tr>
        <tr>
            <th  height="50">탈퇴여부</th>
            <td>&nbsp; <%if(list.getStatus().equals("Y")){%>회원 <%}else{ %>탈퇴 <%} %></td>
         
        </tr>



    </tbody>
   </table>
   <br><br>
   <div align="center" class="adlistbutton">
   <button onclick="penalty();" class="toggleButton" >회원제제</button>
    <a href="adMemberlist.ml"> <button >목록으로</button></a>

    <script>
        function penalty(){
              const penaltyjon =   document.getElementsByClassName("penaltyjon")
        penaltyjon[0].style.display = 'block'
        const penaltyday = document.getElementsByClassName("penaltyday")
       const penaltytime = document.getElementsByClassName("penaltytime")
      
        penaltyday[0].value = '';
        penaltytime[0].value ='' ;
        }
        
		

    </script>
</div>
   <br>
   
  
</div>
</body>
</html>