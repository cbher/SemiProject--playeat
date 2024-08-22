<%@page import="java.util.ArrayList"%>
<%@page import = "semi.member.model.vo.Member" %>
<%@page import = "semi.mypage.myReview.model.vo.Review" %> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
       
	ArrayList<Review> list = (ArrayList<Review>)request.getAttribute("list");

	// 서비스 요청 전 : member.jsp 로딩시 : null
	// 서비스 성공 후 : member.jsp 로딩시 : alert로 띄워줄 메시지 문구
		
%>     
    
 
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이페이지_1</title>
    <style>
       
        
        /* Content */
        #wrap {
            width: 1100px;
            margin: 30px auto 0;
            background-color: #f6f5f0;
            padding-bottom: 50px;
        }

        #content {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
            margin-bottom: 50px;
            height: 1000px;
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

        footer {
            background-color: #f6f5f0;
            padding: 20px 0;
            text-align: center;
            border-top: 1px solid #ddd;
        }

        footer .inner {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        footer .menu {
            list-style: none;
            display: flex;
            justify-content: center;
            gap: 10px;
            margin-bottom: 10px;
        }

        footer .menu li a {
            font-size: 12px;
        }

        footer .info span {
            font-size: 12px;
            margin: 0 10px;
        }
    </style>
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            const sortButton = document.getElementById("sort_button");
            const sortBox = document.getElementById("sort_box");

            sortButton.addEventListener("click", function () {
                sortBox.style.display = sortBox.style.display === "none" ? "block" : "none";
            });
        });
    </script>
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
             
             <% if(list.isEmpty()){ %>
             		
             		비었다
             	
              <%} else{%>
            <% for(Review r : list){ %>
            <div class="rvbox">
                <div class="rvbox_1">
                    <a href=""><img src="가게 이미지" alt=""></a>
                </div>
                <div class="rvbox_2">
                    <div><%=r.getTitle() %></div> 
                </div>
                <div class="rvbox_3">
                     <%= r.getrDate() %>
                </div>
                <div class="rvbox_4">
                     <%= r.getrContent() %>
                </div>
                <div class="rvbox_5">
                     <%= r.getScore() %> 점수
                </div>
                <div>
                	 <a href="<%=contextPath%>/ReviewDelete.bo">삭제</a>
                </div>
                
            </div>
          	<% }%>
          	
           <%} %>
            
            

            <div id="pgnum">
                1 2 3 4 ... 30
            </div>
        </div>

       
    </div>
   
</body>







</html>