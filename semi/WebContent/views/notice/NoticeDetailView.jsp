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
<link rel="stylesheet" href="/semi/resources/css/noticeDetail.css">

<!-- 
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
 -->

</head>
<body>

<%@include file="../common/menubar.jsp" %>

	<div class="detail"  align="center">
        <h2>공지사항</h2>
        <table class="detail-area" border="1">
                <tr>
                    <th width="100" align="center">제목</th>
                    <td colspan="5"><%=n.getNoticeTitle() %></td>
                </tr>
                <tr>
                    <th align="center">작성자</th>
                    <td align="center"><%=n.getNoticeWriter() %></td>
                    <td colspan="2">&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;</td>
                   
                    <th align="center">작성일</th>
                    <td align="right"><%=n.getCreateDate() %></td>
                </tr>
                <tr>
                    <th align="center">내용</th>
                    <td width="800" colspan="5">
                        <p style="height: 150px;"><%=n.getNoticeContent() %></p>
                    </td>
                </tr>
        </table>
        <a class="btn btn-outline-success" href="<%=contextPath %>/noticeList.no">목록가기</a>
        <%if(loginUser != null && loginUser.getUserId().equals("admin")){ %>
        <a class="btn btn-outline-warning" href="<%=contextPath %>/updateform.no?num="<%=n.getNoticeNo()%>>수정하기</a>
        <a class="btn btn-outline-danger" href="<%=contextPath %>/delete.no">삭제하기</a>
		<%} %>
    </div>


<%@include file="../common/footer.jsp" %>
</body>
</html>