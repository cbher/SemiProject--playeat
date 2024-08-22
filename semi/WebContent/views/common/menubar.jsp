<%@page import="semi.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
	
	Member loginUser = (Member)session.getAttribute("loginUser");
	// 유저번호, 아이디, 비번, 이름,닉네임,폰,이메일,가입일,스테이터스,자기소개,리폿횟수
	
	String alertMsg = (String)session.getAttribute("alertMsg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.5/gsap.min.js" integrity="sha512-7eHRwcbYkK4d9g/6tD/mhkf++eoTHwpNM9woBxtPUBWm67zeAfFC+HrdoE2GanKeocly/VxeLvIqwvCdk7qScg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/lodash.js/4.17.21/lodash.min.js" integrity="sha512-WFN04846sdKMIP5LKNphMaWzU7YpMyCU245etK3g/2ARYbPK9Ub18eG+ljU96qKRCWh+quCY7yefSmlkQw1ANQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
   
   <!-- 메뉴바 css 위치  -->
   	<link href="/semi/resources/css/menubar.css" rel="stylesheet">
   

</head>
<body>
     
     <% if(alertMsg != null) { %>
     	<script>
     		alert('<%=alertMsg%>');
     	</script>	
     	<% session.removeAttribute("alertMsg"); %>
     <% } %>
    <header>
        <div class="inner">
            <a href="<%= contextPath %>" class="logo">
                <img src="resources/backGroundImg/play_eat-removebg-preview.png" alt="">
            </a>
            <div class="search">
                <form action="test.do">
                    
                        <input type="text" name="search" placeholder="검색어를 입력하세요">
                        <button class="material-icons" type="submit" >search</button>
                    
                </form>
            </div>
            <!-- 로그인 전 -->
            <% if(loginUser == null){ %>
            <div class="login">
                <ul>
                    <li><a href="<%=contextPath %>/enterLogin.me">로그인</a></li>
                    <li><a href="">회원가입</a></li>
                </ul>
            </div>
      		<%}else if(loginUser != null && loginUser.getUserId().equals("admin")){ %>
            <!-- 로그인 후-->
             <div class="login">
                <ul>
                <li><%=loginUser.getUserName()%>님 반갑습니다.</li>
                    <li><a href="">관리페이지</a></li>
                    <li><a href="">마이페이지</a></li>
                    <li><a href="<%=contextPath %>/logout.me">로그이웃</a></li>
                </ul>
            </div> 
           <%}else if(loginUser != null && !loginUser.getUserId().equals("admin")){ %>
             <div class="login">
                <ul>
                	<li><%=loginUser.getUserName()%>님 반갑습니다.</li>
                    <li><a href="">마이페이지</a></li>
                   <li><a href="<%=contextPath %>/logout.me">로그이웃</a></li>
                </ul>
                
            </div>
            <%} %>
        </div>
        <section class="menubar">
            <div class="menu">
                <ul class="inner">
                    <li>
                        <a href="">공지문의</a>
                        <ul class="hide-menu">
                            <li><a href="noticeList.no">공지사항</a></li>
                            <li><a href="">문의사항</a></li>
                            <li><a href="">자주묻는질문</a></li>
                        </ul>   
                    </li>
                    <li>
                        <a href="">놀거리</a>
                        <ul class="hide-menu">
                            <li><a href="">테마별</a></li>
                            <li><a href="">지역별</a></li>
                            <li><a href="">원데이클래스</a></li>
                        </ul>   
                    </li>
                    <li>
                        <a href="clist.co?cpage=1">요리</a> 
                        <ul class="hide-menu">
                            <li><a href="clist.co?cpage=1">레시피 찾기</a></li>
                            <li><a href="cookingEnrollForm.co">레시피 업로드</a></li>
                            <li><a href="">이번달 명예의 전당</a></li>
                        </ul>  
                    </li>
                    <li>
                        <a href="">맛집찾기</a>
                        <ul class="hide-menu">
                            <li><a href="">맛집검색</a></li>
                            <li><a href="">지역별 맛집</a></li>
                            <li><a href="">가격별 맛집</a></li>
                            <li><a href="">랜덤 메뉴 추천</a></li>
    
                        </ul>   
                    </li>
                    <li>
                        <a href="<%= contextPath %>/minigame.mg">미니게임</a>
                        <ul class="hide-menu">
                            <li><a href="">랜덤뽑기</a></li>
                            <li><a href="">사다리타기</a></li>
                            <li><a href="">룰렛돌리기</a></li>
                            <li><a href="">제비뽑기</a></li>
                        </ul>   
                    </li>
                   
                </ul>
            </div>

        </section>
        
    </header>




</body>
</html>