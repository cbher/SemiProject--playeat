<%@page import="semi.inquire.model.vo.Inquire"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%
 
 Inquire inq = (Inquire)request.getAttribute("Inquire");
 
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="/semi/resources/css/noticeDetail.css">

</head>
<body>

<%@include file="../common/menubar.jsp" %>

<div class="detail"  align="center">
        <h2>공지사항</h2>
        <table class="detail-area" border="1">
                <tr>
                    <th width="100" align="center">제목</th>
                    <td colspan="5"><%=inq.getInquireTitle() %></td>
                </tr>
                <tr>
                    <th align="center">작성자</th>
                    <td align="center"><%=inq.getInquireWriter() %></td>
                    <td colspan="2">&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;</td>
                   
                    <th align="center">작성일</th>
                    <td align="right"><%= inq.getCreateDate()%></td>
                </tr>
                <tr>
                    <th align="center">내용</th>
                    <td width="800" colspan="5">
                        <p style="height: 150px;"><%=inq.getInquireContent() %></p>
                    </td>
                </tr>
                
                <%if(inq.getAnswer() != null) {%>
        		 <tr>
		            <th align="center">답변</th>
		            <td width="800" colspan="5">
		                <p style="height: 150px;"><%=inq.getAnswer() %></p>
		            </td>
        		</tr>
        		<%} %>
        		
        </table>
        <a class="btn btn-outline-success" href="<%=contextPath %>/iqList.ip?cpage=1">목록가기</a>
        <%if(loginUser != null && loginUser.getUserId().equals(inq.getInquireWriter())){ %>
        <a class="btn btn-outline-danger" href="<%=contextPath %>/delete.inq?num=<%=inq.getInquireNo()%>">삭제하기</a>
		<%} %>
		
		
		
		   
    </div>




<%@include file="../common/footer.jsp" %>

</body>
</html>