<%@page import="semi.common.PageInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import = "semi.member.model.vo.Member" %>
<%@page import = "semi.mypage.myInquire.model.vo.Inquire" %>

<% 
	ArrayList<Inquire> list = (ArrayList<Inquire>)request.getAttribute("inquireList");
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
  <style>
        body,h1,h2,h3, h4, h5, h6, p, ul,li, div, a {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            background-color: #f6f5f0;
        }

        img {
            display: block;
        }

        a {
            text-decoration: none;
            color: inherit;
        }

        .inner {
            width: 1100px;
            margin: 0 auto;
            position: relative;
        }

       
        /* Content */
        #wrap {
            width: 1100px;
            margin: 150px auto 0;
            background-color: #f6f5f0;
            padding-bottom: 50px;
        }

        #content {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
            margin-bottom: 50px;
        }

        #content_title {
            display: flex;
            justify-content: space-around;
            margin-bottom: 20px;
            font-size: 24px;
            font-weight: bold;
        }

        #content_title a {
            padding: 10px 20px;
            background-color: #8b7dbe;
            color: #fff;
            border-radius: 5px;
        }

        #content_title a:hover {
            background-color: #6a5cba;
        }

        .rvbox {
            background-color: #f9f9f9;
            margin-bottom: 20px;
            padding: 15px;
            display: flex;
            border: 1px solid #ddd;
            border-radius: 10px;
        }

        .rvbox_1 img {
            width: 60px;
            height: 60px;
            border-radius: 10px;
            margin-right: 20px;
        }

        .rvbox_2 {
            flex-grow: 1;
        }

        .rvbox_2 div {
            margin-bottom: 5px;
        }

        .rvbox_3 {
            text-align: right;
            color: #777;
        }

        #pgnum {
            text-align: center;
            padding: 20px 0;
        }

        #sort {
            position: absolute;
            right: 20px;
            top: 20px;
        }

        #sort_box {
            display: none;
            position: absolute;
            top: 40px;
            right: 20px;
            background-color: white;
            border: 1px solid #ddd;
            padding: 10px;
            border-radius: 5px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
        }

        #sort_button img {
            width: 20px;
            height: 20px;
        }
        
		.inquire-list{
            border: 1px solid black;
            text-align: center;
            justify-content: center;  /* 중앙 정렬 */
            margin: 0 auto;
        }
        #pgnum {
            text-align: center;
            padding: 20px 0;
        }
        
        
       
    </style>

</head>
<body>

 		<%@ include file="../common/mypageMenubar.jsp" %>
         <%@ include file="../common/footer.jsp" %>
	
    <div id="wrap">
        <div id="content">
            <div id="content_title">
                <a href="<%=contextPath%>">나의 리뷰</a>
                <a href="<%=contextPath %>/onecomment.1">한줄평</a>
                <a href="<%=contextPath%>/myinquire.1">내 문의사항</a>
               

            </div>
            <div id="sort">
                <button id="sort_button">
                    <img src="/마이페이지/resource/프로젝트 로고.png" alt="정렬 버튼">
                </button>
                <div id="sort_box">
                    <button>정렬 기준</button><br>
                    <button>날짜 순</button><br>
                    <button>좋아요 순</button><br>
                    <button>댓글 순</button>
                </div>
            </div>
            
            
            
             <table class="inquire-list">
            <thead>
                <tr>
                    <th width="70" height="40">번호</th>
                    <th width="400">제목</th>
                    <th width="100">작성일</th>
                    <th width="80">답변여부</th>
                </tr>
            </thead>

            <tbody>
                <!--
                <tr>
                    <td colspan="5">조회된 게시글이 없습니다.</td>
                </tr>
                -->
				
				<% for(Inquire i : list)  {%>
                <tr>
                    <td><%=i.getInquireNo()%></td>
                    <td><%=i.getInquireTitle()%></td>
                    <td><%=i.getCreateDate() %></td> 
                    <%if(i.getStatus()=="Y"){ %>
                    <td><img src="Y이미지 위치"></td>
					<%}else{ %>
					<td><img src="N이미지 위치"></td>	
					<%} %>
                </tr>
                <% }%>
            </tbody>
        </table>
            
        <div id="pgnum">
        	<% if(currentPage != 1){ %>
		        <button onclick="location.href='<%=contextPath %>/list.bo?cpage=<%= currentPage -1%>'">&lt;</button>
		        <%} %>
		        
		        <% for(int p=startPage; p<= endPage; p++){%>
		        	<% if (p == currentPage){ %>
		        <button disabled><%=p %></button>
		        	<% }else{ %>
		        <button onclick="location.href='<%=contextPath %>/list.bo?cpage=<%=p %>'"><%=p %></button>
		  			<%} %>
		  		<%} %>
		  
		  
		  
		 		<% if(currentPage !=maxPage){ %> 
		        <button onclick="location.href='<%=contextPath %>/list.bo?cpage=<%=currentPage +1%>'">&gt;</button>
		   		<%} %>
        
        </div>

       
    </div>
</body>


<!--스크립트들--------------------------->
<script>
    document.addEventListener("DOMContentLoaded", function () {
        const sortButton = document.getElementById("sort_button");
        const sortBox = document.getElementById("sort_box");

        sortButton.addEventListener("click", function () {
            sortBox.style.display = sortBox.style.display === "none" ? "block" : "none";
        });
    });
</script>
	
</body>
</html>