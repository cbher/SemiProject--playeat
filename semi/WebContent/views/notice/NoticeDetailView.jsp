<%@page import="semi.notice.model.vo.Attechment"%>
<%@page import="java.util.ArrayList"%>
<%@page import="semi.notice.model.vo.Notice"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% 
Notice n = (Notice)request.getAttribute("notice");
ArrayList<Attechment> list = (ArrayList<Attechment>)request.getAttribute("list");

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
                    <td width="800" colspan="6">
                        <p style="height: 150px;"><%=n.getNoticeContent() %></p>
                    </td>
                </tr>
                 <!-- 메인 타이틀 -->
                 <%if(!list.isEmpty()) {%>
                  <tr>
                	<td width="800" colspan="6">
                		<img alt="" src="<%=contextPath%>/<%=list.get(0).getFilePath()+list.get(0).getChangeName()%>" width="100%">
                	</td>
                </tr>
                <tr>
                	<td colspan="6">
                	<%for(int i = 1; i<list.size(); i++){ %>
                		<img src="<%=contextPath %>/<%=list.get(i).getFilePath()+list.get(i).getChangeName() %>" width="100%">
                		<%} %>
                	</td>
                </tr>
                <%} %>
              
        </table>
        <a class="btn btn-outline-success" href="<%=contextPath %>/noticeList.no?cpage=1">목록가기</a>
        <%if(loginUser != null && loginUser.getUserId().equals("admin")){ %>
        <a class="btn btn-outline-warning" href="<%=contextPath %>/updateform.no?num=<%=n.getNoticeNo()%>">수정하기</a>
        <a class="btn btn-outline-danger" href="<%=contextPath %>/delete.no?num=<%=n.getNoticeNo()%>">삭제하기</a>
		<%} %>
		
    </div>
    
 


<%@include file="../common/footer.jsp" %>
</body>
</html>