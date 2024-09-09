<%@page import="db.com.semi.adminMember.model.vo.Attechment"%>
<%@page import="db.com.semi.adminMember.model.vo.oneComment"%>
<%@page import="db.com.semi.adminMember.model.vo.review"%>
<%@page import="db.com.semi.adminMember.model.vo.AdReport"%>
<%@page import="javax.print.attribute.UnmodifiableSetException"%>
<%@page import="db.com.semi.adminMember.model.vo.AdMember"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <% AdReport list = (AdReport)request.getAttribute("list");  
    review rlist = (review)request.getAttribute("rlist");  
    Attechment at = (Attechment)request.getAttribute("at");  
     oneComment olist = (oneComment)request.getAttribute("olist");  
    String Rno = request.getParameter("Rno");
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

table th,table td{
background-color: white;
border-radius: 20px;

}

table{
    border-collapse: separate; /* 기본값이 separate이지만, 명시적으로 설정 */
    border-spacing: 15px;
}
.adlistbutton{
    display: flex; /* 버튼들을 가로로 나열 */
    gap: 10px;
    text-align: center;
      margin-left: 250px;
}

.adlistbutton button{
font-size: 25px;

background-color: #E4D4FA;
border: 0;
height: 60px;
width: 150px;
border-radius: 10px;
}
.adlistbutton button:hover{
    cursor: pointer;
}
.penaltyjon{
    left: 50%;
    right: 50%;
    position: fixed;
    top: 480px;
    /* top:200px; */
       transform: translate(-50%, -50%);
       border-radius: 30px;
       border: 1px solid black;
       display: none;
       
}
table *{
    border: 1px solid black;
}
.penaltyjon button{
    background-color: #E4D4FA;
    width: 120px;
    height: 40px;
    border-radius: 10px;
    border: 1px solid black;
}
.penaltyjon td{
    border: 0;
  
}

.penaltyjon button:hover{
    background-color: purple;
    cursor: pointer;
}
.penaltyjon input{
    border-radius: 20px;
    height: 20px;
}
</style>
</head>
<body>
   <%@ include file = "/../views/common/adminMenubar.jsp" %>
    <div class="penaltyjon" style="background-color: white; width: 700px; height: 300px;">
	
	<br>
	<h2 align = "center"> 회원제제 </h2>
	<br>
    <form action="adReportList.dl" method="post">
	<table align = "center">
        <tr>
            <th>정지시간</th>
            <td><input type="number" max="24" min="0" style="width: 96.5%;" name="penaltytime" class="penaltytime"></td>
        </tr>
        <input type="hidden" name="Rno" value="<%= Rno %>">
        <input type="hidden" name="userNo" value="<%= list.getUserNo() %>">
        <input type="hidden" name="userName" value="<%= list.getUserName() %>">
        <input type="hidden" name="reportNo" value="<%= list.getReportNo() %>">
      
 
        <tr>
            <th>정지일</th>
            <td><input type="number" name="penaltyday" class="penaltyday" value="0" min="0"></td>
        </tr>
   
    </table>
    <br>
    <div align="center" name="test">
    <button onclick="alltime()" type="button">영구정지</button>&nbsp;

    <button type="submit">회원 제제</button> &nbsp;
    <button onclick="closepenalty()" class="toggleButton" type="button">취소</button>
    </div>
    </div>
    </form>
    <script>
      function alltime(){
       const penaltyday = document.getElementsByClassName("penaltyday")
       const penaltytime = document.getElementsByClassName("penaltytime")
      
        penaltyday[0].value = 99999999999999 ;
        penaltytime[0].value = 24 ;
      }
      function closepenalty(){
        const penaltyjon =   document.getElementsByClassName("penaltyjon")
        penaltyjon[0].style.display = 'none'
       
      }
    </script>
   


   <div class="mainlist">
   <br>  
   <h2 align = "center"> 신고 상세 보기</h2>
   <br>
   <table align="center">
    <thead></thead>
    <tbody>
        <tr>
            <th width="140" height="30">신고번호</th>
            <td width="250">&nbsp; <%=list.getReportNo() %></td>
            <th width ="140">신고 제제 상황</th>
            <td width ="450" >&nbsp; <%if(list.getReprotStatus().equals("Y")){ %>대기중<%}else{ %>제제완료<%} %></td>
        </tr>
        <tr>
            <th  height="30">게시판명</th>
            <td>&nbsp; <%if( list.getReview_no() >= 1){%>리뷰 게시판
            			<%}else if(list.getpNo()>=1){%> 장소 게시판
            			<%}else if(list.getpComNo()>=1){ %>장소 한줄평 게시판
            			<%}else if(list.getOneNo()>=1){%> 원클래스 게시판
            			<%}else if(list.getoComNo()>=1){%> 장소 게시판
            			<%}else if(list.getcNo()>=1){%> 요리 게시판
            			<%}else{ %>오류!
            			<%} %>
            			
            			
            			</td>
            <th>신고일자</th>
            <td>&nbsp; <%=list.getCreateReport() %></td>
        </tr>
        <tr>
            <th  height="30">피신고자 번호</th>
            <td >&nbsp; <%=list.getUserNo() %></td>
            <th>피신고자 명</th>
            <td>&nbsp; <%=list.getUserName() %></td>
        </tr>
    
        <% if(list.getcNo()>0){ %>
        <tr>
        <th>신고내역 상세보기</th>
        <td colspan="3"><a href="Detailbo.bo?bno=<%=list.getcNo()%>" style="border: 0px">요리게시판 신고내역 바로가기</td></a></td>
        </tr>
        <%} %>
        
        <%if(list.getReportNo()>0 && rlist!=null) {%>
        <tr>
        <th rowspan="5">신고내역</th>
        </tr>
          <tr>
        <td>제목</td>
        <td colspan="3"><%=rlist.getrTitle() %></td>
            </tr>
          <tr>
        <td>내용</td>
        <td colspan="3"><%=rlist.getrContent() %></td>
            </tr>
          <tr>
        <td>작성일</td>
        <td colspan="3"><%=rlist.getrDate() %></td>
            </tr>
          <tr>
        <td >사진</td>
        <%if(rlist != null && at != null){ %>
        
        <td colspan="3">
        <img alt="" src="<%=contextPath %>/<%=at.getFilePath()+at.getChangeName() %>">
        </td>
        <%}else{ %>
        <td colspan="3">사진 파일이 없습니다</td>
            </tr>
        <%}} %>
        
        <%if(list.getReportNo()>0 && olist!=null) {%>
               <tr>
        <th rowspan="5">신고내역</th>
        </tr>
          <tr>
        <td>글번호</td>
        <td colspan="3"><%=olist.getComNo() %></td>
            </tr>
          <tr>
        <td>내용</td>
        <td colspan="3"><%=olist.getComContent() %></td>
            </tr>
          <tr>
        <td>작성일</td>
        <td colspan="3"><%=olist.getCreateDate()%></td>
            </tr>
        
        
          <%} %>




    </tbody>
   </table>
   <br><br>
   <div align="center" class="adlistbutton">
   <button onclick="penalty();" class="toggleButton" >회원제제</button>
   &nbsp;
   <form action="noreport.ad">
   <input type="hidden" name="nrno" value="<%=list.getReportNo()%>">
   <button  type="submit">제제없음</button>&nbsp;
   </form>
   &nbsp;
    <a href="adReportList.rl"> <button >목록으로</button></a>

    <script>
        function penalty(){
              const penaltyjon =   document.getElementsByClassName("penaltyjon")
        penaltyjon[0].style.display = 'block'
        const penaltyday = document.getElementsByClassName("penaltyday")
       const penaltytime = document.getElementsByClassName("penaltytime")
      
        penaltyday[0].value = '';
        penaltytime[0].value ='' ;
        }
        
		

    </script>
</div>
   <br>
   
  
</div>
</body>
</html>