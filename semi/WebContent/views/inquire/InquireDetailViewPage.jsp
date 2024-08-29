<%@page import="semi.notice.model.vo.Attechment"%>
<%@page import="semi.cooking.model.vo.Attachment"%>
<%@page import="semi.inquire.model.vo.Inquire"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%
 
 Inquire inq = (Inquire)request.getAttribute("Inquire");
 Attechment at = (Attechment)request.getAttribute("at");
 
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




        <h2>문의사항</h2>
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
        		 <tr>
                <th>첨부파일</th>
                <td colspan="5">
                   	 <!-- case 1. 첨부파일이 없을 경우 -->
                     <%if(at == null){ %>
                   		첨부파일 없습니다. 
                  	 <%}else{ %>
                  	  <!-- case 2. 첨부파일이 있을 경우 -->
                      <a download="<%=at.getOriginName() %>" href="<%=contextPath %>/<%=at.getFilePath() + at.getChangeName()%>"><%=at.getOriginName() %></a>
                     <%} %>
                      <!--  /jsp/폴더경로(resources/board_upfiles/) + 실제파일명 -->
                </td>
            </tr>
        </table>
        <a class="btn btn-outline-success" href="<%=contextPath %>/iqList.ip?cpage=1">목록가기</a>
        <%if(loginUser != null && loginUser.getUserId().equals(inq.getInquireWriter())){ %>
        <a class="btn btn-outline-danger" href="<%=contextPath %>/delete.inq?num=<%=inq.getInquireNo()%>">삭제하기</a>
		<%} %>
		
		
		
		   
    </div>




<%@include file="../common/footer.jsp" %>

</body>
</html>