<%@page import="semi.cooking.model.vo.Attachment"%>
<%@page import="java.util.ArrayList"%>
<%@page import="semi.cooking.model.vo.CookingBoard"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	CookingBoard cBoard = (CookingBoard)request.getAttribute("cBoard");
	// 글번호, 글제목, 글내용, 작성일, 로그인한 회원아이디, 카테고리 번호
	ArrayList<Attachment> list = (ArrayList<Attachment>)request.getAttribute("list");
	// 파일번호, 원본명, 수정명, 파일경로
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
img{
    display: block;
}

a{
    text-decoration: none;
}
body{
    /* background-color: #f6f5; */

}

li{
    list-style: none;
}

.inner{
    width: 1100px;
    margin: 0 auto;
    position: relative;

}

div{
    /* border: 1px solid black; */
}

/* header */

.wrap{
    position: relative;
}
.introduce{

}

.introduce .inner{
    height: auto;
    top: 200px;
    border-radius: 10px;
    background-color: #f6f5f0;
}

.introduce .inner .title{
    height: 150px;
    box-sizing: border-box;
    padding-left: 50px;
    padding-top: 20px;
    font-size: 45px;
    color: #8b7dbe;
}

.introduce .inner .content{
    border-top: 1px solid #c8c8c8;
}

.introduce .inner .content img{
    width: 900px;
    height: 500px;
    margin: auto;
    margin-bottom: 40px;
}

.introduce .inner .explanation{
    height: 500px;
    
}

.introduce .inner .explanation textarea{
    width: 900px;
    height: 400px;
    font-size: 18px;
    margin-left: 98px;
    text-align: left;
    border: none;
    background-color: #fff;
    outline: none;
    resize: none;
}

button{
        background-color: #e4d4fa;
        cursor: pointer;
        border: 1px solid #8b7dbe;
        width: 80px;
        height: 30px;
        border-radius: 25px;
        font-size: 18px;
        color: #333;
        font-weight: 700;
    }

button:hover{
    background-color: #8b7dbe;
}

</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>

    <div class="introduce">
        <div class="inner">
            <div class="title">
                레시피
            </div>
            <table align="center">
                <tr>
                    <td width="200"><%= cBoard.getUserNo() %></td>
                    <td width="400"><%= cBoard.getCreateDate() %></td>
                    <% if(cBoard.getCookCategory() == 1){ %>
                    	<td width="100">일반게시판</td>
                    <% }else{ %>
                    	<td width="100">명예의 전당</td>
                    <% } %>	
                    <% if(loginUser != null){ %>
	                    <% if(loginUser.equals(cBoard.getUserNo())){ %>
		                    <td width="100"><button>수정</button></td>
		                    <td width="100"><button>삭제</button></td>
		                <% } %>
		            <% } %>
                </tr>
            </table>
            <br>
            <div class="content">
                <br>
                <% for(Attachment at : list){ %>
                	<img src="<%= at.getFilePath() + at.getChangeName() %>" alt="">
				<% } %>
            </div>
            <div class="explanation">
                <textarea readonly>
                   <%= cBoard.getcBoardContent() %>
                </textarea>
                
            </div>
        </div>
    </div>
</body>
</html>