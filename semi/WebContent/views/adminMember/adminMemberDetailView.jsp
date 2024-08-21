<%@page import="db.com.semi.adminMember.model.vo.AdMember"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <% AdMember list = (AdMember)request.getAttribute("list");  %>
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
</style>
</head>
<body>
   <%@ include file = "/../views/common/adminMenubar.jsp" %>
   
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
            <td width ="450" >&nbsp; <%=list.getUserId() %></td>
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
            <td rowspan="2"><%=list.getIntroduce() %></td>
        </tr>
        <tr>
            <th  height="50">탈퇴여부</th>
            <td>&nbsp; <%if(list.getStatus().equals("Y")){%>회원 <%}else{ %>탈퇴 <%} %></td>
         
        </tr>



    </tbody>
   </table>
   <br><br>
   <div align="center" class="adlistbutton">
    <a href=""> <button >회원제제</button></a>
    <a href=""> <button >후반용</button></a>
    <a href=""> <button >후반용</button></a>
</div>
   <br>
   
  
</div>
</body>
</html>