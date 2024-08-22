<%@page import="semi.notice.model.vo.Notice"%>

<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<Notice> list = (ArrayList<Notice>)request.getAttribute("list");
	// 공지번호, 공지제목, userId(1번), 조회수, 생성일

%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:wght@500&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet">
<link rel="stylesheet" href="/semi/resources/css/noticeMainview.css">

</head>
<body>

<%@ include file="../common/menubar.jsp" %>
<%@ include file="../common/badge.jsp" %>



<div class="notice-area">
	<h2>공지사항</h2>
	 <br>
	 <%if(loginUser != null && loginUser.getUserId().equals("admin")) {%>
    <div class="button" onclick="<%=contextPath %>/insert.no">작성하기</div>
    <br>
    <%} %>
    <table class="notice-view" align="center" >
        <thead>
        <tr align="center">
            <th>글번호</th>
            <th width="500"> 글 제목</th>
            <th width="100">작성자</th>
            <th width="60px">조회수</th>
            <th width="120">작성일</th>
        </tr>
    </thead>
    <%if(list.isEmpty()){ %>
        <tr>
            <td colspan="5">게시글이 없습니다</td>
            
        </tr>
     <%}else{ %>
     	<%for(Notice n :list) {%>
		<tr>
            <td><%= n.getNoticeNo() %></td>
            <td><%= n.getNoticeTitle() %></td>
            <td><%= n.getNoticeWriter() %></td>
            <td><%= n.getCount() %></td>
            <td><%= n.getCreateDate() %></td>
        </tr>
	  <%} %>
	<%} %>
    </table>

</div>




 

<%@ include file="../common/footer.jsp" %>
<%@ include file="../common/top.jsp" %>

</body>
</html>