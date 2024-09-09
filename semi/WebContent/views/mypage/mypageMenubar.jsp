
<%@page import="semi.mypage.editProfile.model.vo.Attachment"%>
<%@page import="semi.mypage.editProfile.model.vo.EditProfile"%>
<%@page import="java.util.ArrayList"%>
<%@page import = "semi.member.model.vo.Member" %>
<%@page import = "semi.mypage.myReview.model.vo.Review" %> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



	
    
    
<%
       
	Member loginUser = (Member)session.getAttribute("loginUser");
	
    session.setAttribute("loginUser", loginUser);  
    
    
    
    ArrayList<EditProfile> profile = (ArrayList<EditProfile>)request.getAttribute("profile");
	ArrayList<Attachment> att = (ArrayList<Attachment>)request.getAttribute("att");
    
    
    String contextPath = request.getContextPath();
	String alertMsg = (String)session.getAttribute("alertMsg");
	
	// 서비스 요청 전 : member.jsp 로딩시 : null
	// 서비스 성공 후 : member.jsp 로딩시 : alert로 띄워줄 메시지 문구
		
%> 
<!DOCTYPE html>


<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이페이지_1</title>
    
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

   	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.5/gsap.min.js" integrity="sha512-7eHRwcbYkK4d9g/6tD/mhkf++eoTHwpNM9woBxtPUBWm67zeAfFC+HrdoE2GanKeocly/VxeLvIqwvCdk7qScg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/lodash.js/4.17.21/lodash.min.js" integrity="sha512-WFN04846sdKMIP5LKNphMaWzU7YpMyCU245etK3g/2ARYbPK9Ub18eG+ljU96qKRCWh+quCY7yefSmlkQw1ANQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
   
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    
    <style>
        
        
        @font-face { 
			    font-family: 'TTLaundryGothicB';
			    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/2403-2@1.0/TTLaundryGothicB.woff2') format('woff2');
			    font-weight: 700;
			    font-style: normal;
		}
        
        body,h1,h2,h3, h4, h5, h6, p, ul,li, div, a {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'TTLaundryGothicB';
           /* background-color: #f6f5f0;*/
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

        /* --------------------------헤더 부분 ----------*/
        header {
            width: 100%;
            background-color: #f6f5f0;
            padding-bottom: 20px;
        }

        header>.inner {
            height: 120px;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
        
        .logo{
            margin-top: 20px;
            margin-left:20px;
        }

		.logo > img{
			height:130px;
			width:130px;
			
		}
        
        header .inner .logout ul {
            display: flex;
            gap: 15px;
            list-style: none;
        }

        header .inner .logout ul li {
            font-size: 11px;
            font-weight: 700;
        }

        /* Menubar */
        .menubar {
            background-color: #f6f5f0;
            padding: 10px 0;
        }

        .menubar .menu .inner {
            display: flex;
            justify-content: space-between;
        }

        .menubar .menu .inner div {
            list-style: none;
            position: relative;
        }

        .menubar .menu .inner div a {
            font-size: 18px;
            font-weight: 700;
            color: #8b7dbe;
            padding: 15px 20px;
            display: block;
        }

        .menubar .menu .inner div a:hover {
            color: purple;
        }

        /* Content */
        #wrap {
            width: 1100px;
            margin: 30px auto 0;
            padding-bottom: 50px;
        }

        #content {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 10px;
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
        .profileBox{
        	
        
        }
        .emptyProfile{
        	width:130px;
        	height:130px;
        	margin-top:10px;
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
   	
    	<!-- 로그인 화면으로 이동시켜야 함 -->
     <%  if (loginUser == null) { //로그인이 안되있을 경우 
  		    
    	 	//alert("로그인을 해야 사용 가능");
  		    response.sendRedirect("/login.me"); 	
     }%>
    	
  
    <header>
        <div class="inner">
            <a href="" class="logo">
                <img src="resources/backGroundImg/play_eat-removebg-preview.png" alt="">
            </a>
            <div class="profileBox">
                <%if(profile.get(0).getFilename()==null){ %>
               	   <a href="<%= contextPath%>/editProfile.eo?userNo=<%=loginUser.getUserNo() %>">
               	   <img class="emptyProfile" src="./resources/images/profile/emptyprofile.png"  alt="프로필 미설정"></a>
              			<%}else{ %>
                	<a href="<%= contextPath%>/editProfile.eo?userNo=<%=loginUser.getUserNo() %>">
                	<img src="<%= request.getContextPath() %>/resources/images/profile/<%=profile.get(0).getFilename() %>?timestamp=<%= System.currentTimeMillis() %>" alt=""></a>
              				<%} %>
                	
                </a>
            </div>
            <div class="logout">
                <ul>  
                	<%if(loginUser.getNickName()!=null){ %>
                	<li><a><%= loginUser.getNickName() %> 님, 반갑습니다!</a></li>
                    <% }else{ %>
                    <li><a><%= loginUser.getUserName() %>님, 반갑습니다!</a></li>
                    <%} %>
                    <li><a href="<%=contextPath%>/logout.me">로그아웃</a></li>   
                </ul>
            </div>
        </div>


        <section class="menubar">
            <div class="menu">
                <ul class="inner">
                    <div><a href="<%= contextPath%>">마이페이지</a></div>
                    <div><a href="<%= contextPath%>/mylist.mo?userNo=<%=loginUser.getUserNo() %>">찜 리스트</a></div>
                    <div><a href="<%= contextPath%>/calender.co">캘린더</a></div>
                    <div><a href="<%= contextPath%>/editProfile.eo?userNo=<%=loginUser.getUserNo() %>">프로필 수정</a></div>
                    <div><a href="<%= contextPath%>/information.view?userNo=<%=loginUser.getUserNo() %>">회원정보 수정</a></div>
                </ul>
            </div>
        </section>
    </header>
</body>


</html>