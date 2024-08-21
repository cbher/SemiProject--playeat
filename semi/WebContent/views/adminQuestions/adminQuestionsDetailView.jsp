<%@page import="db.com.semi.Questions.model.vo.Questions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <% Questions view = (Questions)request.getAttribute("detailview"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .main{
        background-color:  #F6F5F0;
      
        width: 1000px;
        margin: auto;
        margin-top: 250px;
    }
table *{
    border: 1px solid black;
    box-sizing: border-box;
}
button{
    width: 200px;
    height: 50px;
    margin-left: 10px;
    margin-right: 10px;
    border: 1px solid black;
}
button:hover{
    background-color:  #E4D4FA;
    cursor: pointer;
    
}
</style>
</head>
<body>
 <%@ include file = "/../views/common/adminMenubar.jsp" %>
    
 <div class="main" align="center">
<br>
<h2>문의사항 상세정보</h2>
<form action="Questions.Aw" method="post" >
<input type="hidden" name="qno" value=<%=view.getInquireNo() %>>
    <table>
        <tr>
            <th width="90" height="30">문의번호</th>
            <td width="110"> <%=view.getInquireNo() %></td>
            <th width="90">작성자</th>
            <td width="500"> <%=view.getInquireWirther() %></td>
        
            
        </tr>
        <tr>
             <th  height="35">문의제목</th>
            <td colspan="3"> <%=view.getInquireTitle() %></td>
        </tr>
        <tr>
           
            <th height="30">작성일</th>
            <td> <%=view.getCreateDate() %></td>
            <th>답변여부</th>
            <%if(view.getStatus().equals('Y')){ %>
            <td> 응답</td>
         	<%}else{ %>
         	 <td> 미응답</td>
         	<%} %>
        </tr>
        <tr>
            <th height="300">내용</th>
            <td colspan="3"  style="vertical-align: top;" > <%=view.getInquireContent() %></td>
        </tr>
        <tr>
            <th height="300">답변내용</th>
            <td height="300px" colspan="5" >
                <textarea name="answer" required style="width: 100%; height: 300px; resize: none;"> <%=view.getAnswer() %></textarea>
              

            </td>
        </tr>
        
    </table>
    <br>
 
        <button >답변하기</button> 
        

 
    <a href="Questions.qe">
        <button  type="button">돌아가기</button>

    </a>
    <br><br>

</form>

 </div>
 
</body>
</html>