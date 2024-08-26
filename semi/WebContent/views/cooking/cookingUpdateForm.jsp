<%@page import="semi.cooking.model.vo.CookingBoard"%>
<%@page import="semi.cooking.model.vo.Attachment"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<Attachment> list = (ArrayList<Attachment>)request.getAttribute("list");
	// 파일번호, 원본명, 수정명, 파일경로
	CookingBoard cBoard = (CookingBoard)request.getAttribute("cBoard");
	// 글번호, 글 제목, 글내용, 작성일, 회원아이디, 글 카테고리(명예의 전당, 일반게시판)
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <style>

        input{
            height: 30px;
        }

        .outer{
            margin-top: 250px;
        }

        .inner{
            width: 1100px;
            margin: 0 auto;
            position: relative;
            background-color: #f6f5f0;
            height: 1300px;
        }

        select{
            position: absolute;
            right: 150px;
            top: 110px;
            height: 30px;
        }

        #update-form table{border: 1px solid white; width: 800px;}
        #update-form table th{color: #8b7dbe;}		
        #update-form #category{
            position: relative;
            top: -15px;
            right: -850px;
        }		

        #update-form input, #update-form textarea{
            width: 90%;
            box-sizing: border-box;
            font-size: 16px;
            outline: #333;
        }

        #imgs{
            display:flex;
            flex-wrap: wrap;
            justify-content: center;
        }
        button{
            background-color: #e4d4fa;
            cursor: pointer;
            border: 1px solid #8b7dbe;
            width: 150px;
            height: 50px;
            border-radius: 25px;
            font-size: 18px;
            color: #333;
            font-weight: 700;
        }
    </style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	<%@ include file="../common/badge.jsp" %>
	
	<div class="outer">
        <div class="inner">
            <br>
            <h1 align="center" style="color: #8b7dbe;">요리게시판 수정하기</h1>
            <br> <br>
            <form action="<%= contextPath %>/update.co?bno=<%= cBoard.getcBoardNo() %>" id="update-form" method="post">
                <select name="category" id="category">
                    <option value="1">요리게시판</option>
                    <option value="2">명예의 전당</option>
                </select>
                <script>
                	$("#update-form option").each(function(){
                		if($(this).val() == "<%= cBoard.getCookCategory()%>"){
                			$(this).attr("selected",true);
                		}
                	})
                </script>
                <input type="hidden" name="userNo" value="">
                <table align="center">
                    <tr>
                        <th width="100" height="30">제목</th>
                        <th colspan="3"><input type="text" name="title" required value="<%= cBoard.getcBoardTitle()%>"></th>
                    </tr>
                    <tr>
                        <th>대표이미지 <br> (*필수)</th>
                        <td colspan="3" align="center">
                            <img id="titleImg" src="<%= list.get(0).getFilePath() +'/' + list.get(0).getChangeName() %>" width="250" height="170" onclick="chooseFile(1)">
                        </td>
                    </tr>
                    <tr>
                        <th height="250">상세이미지 <br> ( 선택 / 최대 8장 )</th>
                        <td id="imgs">
                            <img id="contentImg1" width="150" height="120" onclick="chooseFile(2)">
                            <img id="contentImg2" width="150" height="120" onclick="chooseFile(3)">
                            <img id="contentImg3" width="150" height="120" onclick="chooseFile(4)">
                            <img id="contentImg4" width="150" height="120" onclick="chooseFile(5)">
                            <img id="contentImg5" width="150" height="120" onclick="chooseFile(6)">
                            <img id="contentImg6" width="150" height="120" onclick="chooseFile(7)">
                            <img id="contentImg7" width="150" height="120" onclick="chooseFile(8)">
                            <img id="contentImg8" width="150" height="120" onclick="chooseFile(9)">
                            
                        </td>
                        <!-- <td><img id="contentImg4" width="150" height="120" onclick="chooseFile(5)"></td> -->
                    </tr>
                    <tr>
                        <th>내용</th>
                        <th colspan="3">
                            <textarea rows="20" style="resize: none;" name="content" required><%= cBoard.getcBoardContent() %></textarea>
                        </th>
                    </tr>
                </table>
                <% for(int i =1;i<list.size();i++){%>
    			    <script>
						$("#update-form #imgs img").eq(<%=i-1%>).attr("src","<%= list.get(i).getFilePath() + '/' + list.get(i).getChangeName() %>")
                    </script>
				<% } %>
                <div id="file-area" style="display:none">
                    <input type="file" name="file1" id="file1" onchange="loadImg(this, 1)">
                    <input type="file" name="file2" id="file2" onchange="loadImg(this, 2)">
                    <input type="file" name="file3" id="file3" onchange="loadImg(this, 3)">
                    <input type="file" name="file4" id="file4" onchange="loadImg(this, 4)">
                    <input type="file" name="file5" id="file5" onchange="loadImg(this, 5)">
                    <input type="file" name="file6" id="file6" onchange="loadImg(this, 6)">
                    <input type="file" name="file7" id="file7" onchange="loadImg(this, 7)">
                    <input type="file" name="file8" id="file8" onchange="loadImg(this, 8)">
                    <input type="file" name="file9" id="file9" onchange="loadImg(this, 9)">
                    
                </div>
    
                <script>
                    function chooseFile(num){
                        $("#file" + num).click();	
                    }
                    
                    
                    function loadImg(inputFile, num){
                        // inputFile : 현재 변화가 생긴 input type="file" 요소객체
                        // num : 몇번째 input 요소인지 확인 후 해당 영역에 미리보기 하기 위해 전달받는 숫자
    
                        // 선택된 파일이 있다면 inputFile.files[0]에 선택된 파일이 담겨있음
                        //                  => inputFile.files.length 또한 1이 될 것임
                        if(inputFile.files.length == 1){ // 파일 선택된 경우 => 파일을 읽어들여서 미리보기
                            
                            // 파일을 읽어들일 FileReader 객체 생성
                            const reader = new FileReader();
    
                            // 파일을 읽어들이는 메소드
                            reader.readAsDataURL(inputFile.files[0]);
                            // 해당 파일을 읽어들이는 순간 해당 이 파일만을 고유한 url 부여
    
                            // 파일 읽어들이기가 완료됐을 때 실행할 함수를 정의해두기
                            reader.onload = function(e){
                                // e.target.result => 읽어들인 파일의 고유한 url
                                switch(num){
                                    case 1 : $("#titleImg").attr("src", e.target.result); break;
                                    case 2 : $("#contentImg1").attr("src", e.target.result); break;
                                    case 3 : $("#contentImg2").attr("src", e.target.result); break;
                                    case 4 : $("#contentImg3").attr("src", e.target.result); break;
                                    case 5 : $("#contentImg4").attr("src", e.target.result); break;
                                    case 6 : $("#contentImg5").attr("src", e.target.result); break;
                                    case 7 : $("#contentImg6").attr("src", e.target.result); break;
                                    case 8 : $("#contentImg7").attr("src", e.target.result); break;
                                    case 9 : $("#contentImg8").attr("src", e.target.result); break;
                                    
                                }
                            }
    
                        }else{ // 선택된 파일이 취소된 경우 => 미리보기 된 것도 사라지게
                                switch(num){
                                        case 1 : $("#titleImg").attr("src", null); break;
                                        case 2 : $("#contentImg1").attr("src", null); break;
                                        case 3 : $("#contentImg2").attr("src", null); break;
                                        case 4 : $("#contentImg3").attr("src", null); break;
                                        case 5 : $("#contentImg4").attr("src", null); break;
                                        case 6 : $("#contentImg5").attr("src", null); break;
                                        case 7 : $("#contentImg6").attr("src", null); break;
                                        case 8 : $("#contentImg7").attr("src", null); break;
                                        case 9 : $("#contentImg8").attr("src", null); break;
                                    }
                        }
                    }
                </script>
    
                <br>
    
                <div align="center">
                    <button type="submit">
                        수정하기
                    </button>
    
                </div>
    
            </form>
        </div>
    </div>
</body>
</html>