<%@page import="db.com.semi.common.model.vo.PageInfo"%>
<%@page import="db.com.semi.adminMember.model.vo.AdMember"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% ArrayList<AdMember> list = (ArrayList<AdMember>)request.getAttribute("list"); 
    
    	String select = (String)session.getAttribute("select");
    	PageInfo pi = (PageInfo)session.getAttribute("Memberpi");
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
<style>
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
    <div class="adMembertitle">
        <br>
    <h2 align="center">회원 목록</h2>
    <br>
    <form id="myForm" action="adMemberlist.ml?select=">
        
        <select name="select" id="" style="float: right; margin-right: 55px;" onchange="submitForm()">
            
        
        <option >정렬하기</option>
        <option value="sortNo">회원번호순</option>
        <option value="sortDate" >가입일자</option>
        <option value="sortReport">누적신고수</option>
    
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
    
    <div class="adMemberlist" align="center">
        <table>
        <thead>
        <tr>
        <th width="90" height="40">회원번호</th>
        <th width="250">회원아이디</th>
        <th width="120">회원명</th>
        <th width="150">닉네임</th>
        <th  width="110" >가입일</th>
        <th  width="90" >정지여부</th>
        <th  width="90" >누적신고수</th>

        </tr>	
      <%if(list == null){ %>
        <tr>
        <th colspan="7"> 값이 존재하지 않습니다</th>
        </tr>
        
      	<%}else{ %>
        </thead>
        <tbody>
     	<% for(int a = startRow -1 ; a<endRow ; a++) {%>
        <tr>
            <td  height="30"><%=list.get(a).getUserNo() %></td>
            <td ><%=list.get(a).getUserId() %></td>
            <td ><%=list.get(a).getUserName() %></td>
            <td ><%if(list.get(a).getNickname()==null){}else{%><%=list.get(a).getNickname() %><%} %></td>
            
            <td  ><%=list.get(a).getEnrollDate() %></td>
            
            <%if(list.get(a).getStatus().equals("Y")) {%>
            <td  >회원</td>
            <%}else{ %>
             <td  >정지</td>
             <%} %>
            <td   ><%=list.get(a).getReportCount() %></td>
           
        </tr>
   		<%}} %>
        </tbody>
        </table>
    
    
    
    
        
        <br><br>
        <div></div>
          <div class="paging" align="center">
        <%if(pi.getCurrentPage() !=1){ %>
        <button onclick="location.href='<%=contextPath%>/adMemberlist.ml?cpage=<%=pi.getCurrentPage() -1 %>&select=<%=select%>'">&lt;</button>
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
         <button onclick="location.href='<%=contextPath%>/adMemberlist.ml?cpage=<%=p%>&select=<%=select%>'"><%=p %></button>
            <%} %>
            <%} %>
             <!-- for문과 if 끝남 만냑 마지막페이지까지 간다면에 대한 내용 -->
             <%if(pi.getCurrentPage() != pi.getMaxPage()){ %>
                 <%if(list.size()!= 0) {%>
    
                <button onclick="location.href='<%=contextPath%>/adMemberlist.ml?cpage=<%= pi.getCurrentPage() +1 %>&select=<%=select%>'">&gt;</button>
                <%} }%>
            
        </div>
        
        
        <br> <br>
        </div>
    </div>
    <script>
        $(function(){
            $(".adMemberlist tbody>tr").click(function(){
                location.href =  '<%=request.getContextPath()%>/Detail.mo?Mno='+ $(this).children().eq(0).text();
            })
        })
    </script>
         
     
</body>
</html>