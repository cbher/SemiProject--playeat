<%@page import="db.com.semi.common.model.vo.PageInfo"%>
<%@page import="db.com.semi.Questions.model.vo.Questions"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% ArrayList<Questions> list = (ArrayList<Questions>)request.getAttribute("list"); 
    
    String listview = (String)session.getAttribute("adminQuestionslistview");

 
    	if(listview == null){
    	listview= "all";
    	}
    	PageInfo pi = (PageInfo)session.getAttribute("adminQuestionslistpi");
    	
    	//시작값과 끝값 가져오기
    	int startRow = (pi.getCurrentPage()-1)*pi.getBoardLimit()+1;
		int endRow = startRow + pi.getBoardLimit() -1;
		if (endRow > list.size()) {
		    endRow = list.size();
		}
		%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style >
.mainlist{
background-color: #F6F5F0;
	width: 1000px;

    margin: auto;
    margin-top: 250px;
}
table tr{border: 1px solid black;
		box-sizing: border-box;
		background-color: white;
		border-radius: 50px;
}
table tr>td{
	border-radius: 50px;
}
table tr>th{
	border-radius: 50px;
}
tbody>tr:hover{
	background-color: #E4D4FA;
	cursor: pointer;
	text-decoration: underline;
}
table td{text-align: center;}
</style>
</head>
<body>
	 <%@ include file = "/../views/common/adminMenubar.jsp" %>
<div class="mainlist">
<div class="qetitle">
	<br>
<h2 align="center">문의사항 목록</h2>
<br>
<form id="myForm" action="Questions.qe?selectqe=">
	
	<select name="selectqe" id="" style="float: right; margin-right: 55px;" onchange="submitForm()">
		
	
    <option >목록보기</option>
    <option value="all">전체</option>
    <option value="ready" >문의대기중</option>
    <option value="clear">문의완료</option>

	</select>
</form>
	<script>
	function submitForm() {
  	 document.getElementById("myForm").submit();

}
	
	</script>

</div>
<br>
<br>

<div class="qelist" align="center">
	<table>
	<thead>
	<tr>
	<th width="70" height="30">글번호</th>
	<th width="350">제목</th>
	<th width="90">작성자</th>
	<th width="90">작성일</th>
	<th  width="70" >답변여부</th>
	
	</tr>	
	<%if(list.size()== 0) {%>
	<tr>
	<th colspan="5"> 값이 존재하지 않습니다</th>
	</tr>
	<%}else{ %>
	</thead>
	<tbody>
	<%for(int a = startRow -1  ; a < endRow ; a++){ %>
	<tr>
		<td width="70" height="30"><%= list.get(a).getInquireNo() %></td>
		<td width="350"><%= list.get(a).getInquireTitle() %></td>
		<td width="90"><%=list.get(a).getInquireWirther() %></td>
		<td width="90"><%=list.get(a).getCreateDate() %></td>
		
		<%if("Y".equals(list.get(a).getStatus())){%>
			<td width="70" style="color:red; font-weight:900">X</td>
		<%}else{%>
		<td width="70" style="color: greenyellow; font-weight: 900;" >O</td>
		<%}%>
	</tr>
	<%}} %>
	</tbody>
	</table>




	
	<br><br>
	<div></div>
	
	<div class="paging" align="center">
	<%if(pi.getCurrentPage() !=1){ %>
	<button onclick="location.href='<%=contextPath%>/Questions.qe?cpage=<%=pi.getCurrentPage() -1 %>&selectqe=<%=listview%>'">&lt;</button>
	<% }%>
	<!--시작페이지부터 끝페이지까지 1씩 증가하는 반복문 생성 -->
	<% for(int p = pi.getStartPage() ; p<= pi.getEndPage(); p++){ %>
		<!--만약 숫자가 내가 원하는 페이지와 같으면 그 페이지만 색 다르게 만들고 못누르게 하기 -->
			<!-- -->
	<%if(p == pi.getCurrentPage()){ %>
	   <button disabled><%=p %></button>
	   <!-- 같지 않다면 그냥 평범한 버튼으로 만들어버리기 -->
        <%}else{ %>
          <!-- p번주소로 가면서 p라는 이름으로 버튼 생성하기 -->
	 <button onclick="location.href='<%=contextPath%>/Questions.qe?cpage=<%=p%>&selectqe=<%=listview%>'"><%=p %></button>
	    <%} %>
        <%} %>
         <!-- for문과 if 끝남 만냑 마지막페이지까지 간다면에 대한 내용 -->
         <%if(pi.getCurrentPage() != pi.getMaxPage()){ %>
         	<%if(list.size()!= 0) {%>

            <button onclick="location.href='<%=contextPath%>/Questions.qe?cpage=<%= pi.getCurrentPage() +1 %>&selectqe=<%=listview%>'">&gt;</button>
        	<%} }%>
        
	</div>
	
	
	<br> <br>
	</div>
</div>
<script>
	$(function(){
		$(".qelist tbody>tr").click(function(){
			location.href =  '<%=request.getContextPath()%>/Detail.qo?qno='+ $(this).children().eq(0).text();
		})
	})
</script>
</body>
</html>