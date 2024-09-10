<%@page import="db.com.semi.adOneDay.model.vo.adOneDayClass"%>
<%@page import="db.com.semi.common.model.vo.PageInfo"%>
<%@page import="db.com.semi.adminMember.model.vo.AdMember"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% ArrayList<adOneDayClass> list = (ArrayList<adOneDayClass>)request.getAttribute("list"); 
    
    	String select = (String)session.getAttribute("oneselect");
    	PageInfo pi = (PageInfo)session.getAttribute("oneclasspi");
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
form>button{
border: 1px solid black;
		box-sizing: border-box;
		background-color: white;
		border-radius: 50px;
			width : 200px;
			height: 60px;
}
form>button:hover{
	background-color: #E4D4FA;
	cursor: pointer;

}
table td{text-align: center;}

table{
  width: 860px;
table-layout: fixed;}
</style>
</head>
<body>
    <%@ include file = "/../views/common/adminMenubar.jsp" %>
    <div class="mainlist">
    <div class="adMembertitle">
        <br>
    <h2 align="center">원클래스 신청 목록</h2>
    <br>
    <form id="myForm" action="adoneclass.ac?cpage=<%=pi.getCurrentPage() %>&select=">
        
        <select name="select" id="" style="float: right; margin-right: 55px;" onchange="submitForm()">
            
        
        <option >정렬하기</option>
        <option value="all">전체</option>
        <option value="ready">삭제된 클래스</option>
        <option value="clear">정상 클래스</option>
       
    
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
    
    <div class="adOndaylist" align="center">
        <table>
        <thead>
        <tr>
        <th width="90" height="40">신청번호</th>
        <th width="250">클래스명</th>
        <th width="120">테마</th>
        <th width="150">분류</th>
        <th  width="110" >참여 정원</th>
        <th  width="90" >삭제 여부</th>
   

        </tr>	
      <%if(list.isEmpty()){ %>
        <tr>
        <th colspan="6"> 값이 존재하지 않습니다</th>
        </tr>
        
      	<%}else{ %>
        </thead>
        <tbody>
     	<% for(int a = startRow -1 ; a<endRow ; a++) {%>
        <tr>
            <td  height="30"><%=list.get(a).getOneNo() %></td>
            <td width="300px" style="white-space: nowrap;  overflow: hidden; text-overflow: ellipsis; "><%=list.get(a).getOneTitle() %></td>
            <td ><%=list.get(a).getTemCateName() %></td>
            <td ><%=list.get(a).getOnecategoryName() %></td>
            
            <td  ><%=list.get(a).getEntPeople() %></td>
            
            <%if(list.get(a).getOneStatus().equals("Y")) {%>
           <td width="70" style="color:red; font-weight:900">X</td>
            <%}else if(list.get(a).getOneStatus().equals("N")){ %>
           	<td width="70" style="color: greenyellow; font-weight: 900;" >O</td>
             <%} %>
		 
           
        </tr>
   		<%}} %>
        </tbody>
        </table>
     <br><br>
    <form action="adOneDayenroll.ae">
     <button>추가하기</button>
    </form>
    
    
        
        <br><br>
        <div></div>
          <div class="paging" align="center">
        <%if(pi.getCurrentPage() !=1){ %>
        <button onclick="location.href='<%=contextPath%>/adoneclass.ac?cpage=<%=pi.getCurrentPage() -1 %>&select=<%=select%>'">&lt;</button>
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
         <button onclick="location.href='<%=contextPath%>/adoneclass.ac?cpage=<%=p%>&select=<%=select%>'"><%=p %></button>
            <%} %>
            <%} %>
             <!-- for문과 if 끝남 만냑 마지막페이지까지 간다면에 대한 내용 -->
             <%if(pi.getCurrentPage() != pi.getMaxPage()){ %>
                 <%if(list.size()!= 0) {%>
    
                <button onclick="location.href='<%=contextPath%>/adoneclass.ac?cpage=<%= pi.getCurrentPage() +1 %>&select=<%=select%>'">&gt;</button>
                <%} }%>
            
        </div>
        
        
        <br> <br>
        </div>
    </div>
    <script>
        $(function(){
            $(".adOndaylist tbody>tr").click(function(){
                location.href =  '<%=request.getContextPath()%>/Detail.ao?Ano='+ $(this).children().eq(0).text();
            })
        })
    </script>
         
     
</body>
</html>