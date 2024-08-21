<%@page import="semi.notice.model.vo.Notice"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
Notice n = (Notice)request.getAttribute("notice");

%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<%@include file="../common/menubar.jsp" %>


<div class="update-area" align="center">
	<h3 align="center">공지글 작성하기</h3>
    <form action="<%=contextPath %>/update.no" method="post">
    <input type="hidden" name="num" value="<%=n.getNoticeNo() %>">
        <table align="center" id="insertTable">
            <thead>
                <tr>
                   <th width="60">제목</th>
                   <td width="300"><input type="text" name="title" value="<%=n.getNoticeTitle() %>"></td>
                   
                </tr>
            </thead>
            <tbody>
            <tr>
            	<th colspan="2" align="center">내용</th>
            	
            </tr>
                <tr>
                    <td colspan="2">
                        <textarea name="content" id="" ><%=n.getNoticeContent() %></textarea>
                    </td>
                </tr>
            </tbody>
        </table>
        <div class="btn-center">
        <button type="submit" class="btn btn-sm btn-outline-info">수정하기</button>
        <button class="btn btn-sm btn-outline-secondary" onclick="history.back()">뒤로가기</button>
         </div>  
    </form>

</div>

<%@include file="../common/footer.jsp" %>

</body>
</html>