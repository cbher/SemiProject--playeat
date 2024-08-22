<%@page import="semi.inquire.model.vo.Inquire"%>
<%@page import="java.util.ArrayList"%>
<%@page import="semi.common.PageInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	
	ArrayList<Inquire> list = (ArrayList<Inquire>)request.getAttribute("list");
	// 공지번호, 공지제목, userId(1번), 조회수, 생성일

	PageInfo pi = (PageInfo)request.getAttribute("pi");
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
	
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<link rel="stylesheet" href="/semi/resources/css/inquListView.css">

</head>
<body>
	<%@include file="../common/menubar.jsp" %>
	
	<div class="inquire-area">
		<h2 align="center">문의사항</h2>
		 <br>
		 <%if(loginUser != null && loginUser.getUserId().equals("admin")) {%>
		<a  class="button" href="<%=contextPath %>/createIN.no">작성하기</a>
		<br>
		<%} %>
		<table class="inquire-view" align="center" >
			<thead>
			<tr align="center">
				<th width="100">글번호</th>
				<th width="500"> 글 제목</th>
				<th width="100">작성자</th>
				<th width="120">작성일</th>
			</tr>
		</thead>
		<tbody>
		<%if(list.isEmpty()){ %>
			<tr>
				<td colspan="4">문의사항 글이 없습니다</td>
				
			</tr>
		<%}else {%>
			 <%for(Inquire i :list){%>
			<tr>
				<td><%= i.getInquireNo() %></td>
				<td class="content"><%=i.getInquireTitle()%></td>
				<td><%= i.getInquireWriter()%></td>
				<td><%= i.getCreateDate() %></td>
			</tr>
		  <%} %>
		<%} %>
		</tbody>
		</table>
		
		
		<script type="text/javascript">
			$(function(){
				$(".inquire-view>tbody>tr").click(function(){
					const num = $(this).children().eq(0).text();
					location.href='<%=contextPath%>/iqdetail.no?num='+num;
				})
			})	
		</script>
		
		<br>
		<br>
			 <div class="paging-area" align="center">
			 
				 <%if(currentPage != 1){ %>
				 <button onclick="location.href='<%=contextPath%>/iqList.ip?cpage=<%= currentPage -1%>'">&lt;</button>
				 <%} %>
				 <%for(int p =startPage; p <= endPage; p++) {%>
						 <%if(p == currentPage) {%>
						 <button disabled><%=p %></button>
					 <%}else{ %>
						 <button onclick="location.href='<%=contextPath %>/iqList.ip?cpage=<%= p %>'"><%= p %></button>
					<%} %>	
				 <%} %>
				 <% if(currentPage != maxPage){ %>
					 <button onclick="location.href='<%=contextPath%>/iqList.ip?cpage=<%= currentPage + 1%>'">&gt;</button>
				 <%} %>
				 
			 </div>
		
	</div>
	



	<%@include file="../common/footer.jsp" %>
</body>
</html>