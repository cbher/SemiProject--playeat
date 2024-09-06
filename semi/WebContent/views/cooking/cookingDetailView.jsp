<%@page import="semi.cooking.model.vo.Attachment"%>
<%@page import="java.util.ArrayList"%>
<%@page import="semi.cooking.model.vo.CookingBoard"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	CookingBoard cBoard = (CookingBoard)request.getAttribute("cBoard");
	// 글번호, 글제목, 글내용, 작성일, 로그인한 회원아이디, 카테고리 번호, 추천수
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
    display: inline-block;
}

.material-icons{
    position: absolute;
    right: 96px;
    top: 83px;
    font-size: 50px;
    color: #e4d4fa;
    cursor: pointer;
}

.material-icons:hover{
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
    background-color: #f6f5f0;
    font-family:'TTLaundryGothicB';
    border: 1px solid #8b7dbe;
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
    color:#fff;
}

.back a{
	color:#8b7dbe;
}

.infomation td span{
	cursor:pointer;
}

.infomation td span:hover{
	color:#8d7bde
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
            <% if(loginUser != null){ %>
            	<input id="userNo" type="hidden" value="<%= loginUser.getUserNo()%>">
                <div class="material-icons like" onclick="selectLikeCount();">
                    thumb_up
                </div>
            <% }%>
            <table class="infomation" align="center">
                <tr>
                    <td width="200"><%= cBoard.getUserNo() %></td>
                    <td width="300"><%= cBoard.getCreateDate() %></td>
                    <td width="80"><span onclick='report();'>신고</span></td>
                    <td width="100">추천수 : <%= cBoard.getScore()%></td>
                    <% if(cBoard.getCookCategory() == 1){ %>
                    	<td width="100">일반게시판</td>
                    <% }else{ %>
                    	<td width="100">명예의 전당</td>
                    <% } %>	
                    <% if(loginUser != null){ %>
	                    <% if(loginUser.getUserId().equals(cBoard.getUserNo())){ %>
		                    <td width="100"><button onclick="update();">수정</button></td>
		                    <td width="100"><button onclick="deleteBoard();">삭제</button></td>
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
                <textarea readonly><%= cBoard.getcBoardContent() %></textarea>
                
                <div class="back" align="center"><a  href="<%= contextPath %>/clist.co?cpage=1">목록으로</a></div>
            </div>
        </div>
    </div>
    
    <script>
    	
    	<% if(loginUser != null) { %>
    		function report(){
    			if(confirm("정말로 신고하시겠습니까?")){
    				$.ajax({
    					url:"reportCook.rc",
    					data:{
    						bno:"<%= cBoard.getcBoardNo() %>",
    						userId:"<%= cBoard.getUserNo() %>"
    					},
    					success:function(result){
    						
    						if(result > 0){
    							alert("신고가 성공적으로 접수되었습니다.");
    						}else{
    							alert("신고에 실패하였습니다. 다시 시도해주세요.");
    						}
    					}
    				})
    			}
    		}
    	<% } %>
    	
    
    
    	function update(){
            if(confirm("게시물을 수정하시겠습니까?")){
                location.href = "<%= contextPath %>/updateEnrollForm.co?bno=<%= cBoard.getcBoardNo()%>";
            }
    	}
    	
    	function deleteBoard(){
            if(confirm("정말로 삭제하시겠습니까?")){

                location.href = "<%= contextPath %>/delete.co?bno=<%= cBoard.getcBoardNo()%>";
            }
    	}
		
    	<% if(loginUser != null){%>
	    $(function(){
	    			
	    	likeStatus();
	    			
		})
			
        
        function selectLikeCount(){
            $.ajax({
                url : "increaseLike.il",
                data:{bno:<%= cBoard.getcBoardNo() %>,
                	  userNo : $("#userNo").val()},
                success:function(result){
                	$(".inner .infomation tr td").eq(3).text("추천수 : " + result.score); 
					$(".like").css("color","#8b7dbe");
					likeStatus();
                },
                error:function(){
                	console.log("통신 실패");
                },
            })
        }
        
        function likeStatus(){
        	$.ajax({
        		url:"like.li",
        		data:{
        			userNo : $("#userNo").val(),
        			bno : <%= cBoard.getcBoardNo() %>,
        		},
        		success : function(result){
        			if(result > 0){
        				$(".like").css("color", "#8b7dbe");
        			}else{
        				$(".like").css("color", "#e4d4fa");
        				
        			}
        		},
        	})
        };
       <% } %>
    </script>
</body>
</html>