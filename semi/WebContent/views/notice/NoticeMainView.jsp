<%@page import="semi.notice.model.vo.Notice"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<Notice> list = (ArrayList<Notice>)request.getAttribute("list");

%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<link  rel="stylesheet" href="/semi/resources/css/noticeMainview.css">

</head>
<body>

<%@ include file="../common/menubar.jsp" %>
<%@ include file="../common/badge.jsp" %>



<div class="notice">
	<h2>공지사항</h2>
    <table class="notice-view" align="center" border="1" >
        <thead>
        <tr align="center">
            <th>글번호</th>
            <th width="500"> 글 제목</th>
            <th width="100">작성자</th>
            <th width="40px">조회수</th>
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
            <td><%=n.getNoticeTitle() %></td>
            <td><%= n.getNoticeWriter() %></td>
            <td><%=n.getStatus() %></td>
            <td><%=n.getCreateDate() %></td>
        </tr>
	  <%} %>
	<%} %>
    </table>

</div>




 

<%@ include file="../common/footer.jsp" %>
<%@ include file="../common/top.jsp" %>

</body>
</html>