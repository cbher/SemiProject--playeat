<%@ page import="semi.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    
<%

   String contextPath = request.getContextPath();
   Member loginUser = (Member)session.getAttribute("loginUser");
   String alertMsg = (String)session.getAttribute("alertMsg");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>플레잇</title>

    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

   	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.5/gsap.min.js" integrity="sha512-7eHRwcbYkK4d9g/6tD/mhkf++eoTHwpNM9woBxtPUBWm67zeAfFC+HrdoE2GanKeocly/VxeLvIqwvCdk7qScg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/lodash.js/4.17.21/lodash.min.js" integrity="sha512-WFN04846sdKMIP5LKNphMaWzU7YpMyCU245etK3g/2ARYbPK9Ub18eG+ljU96qKRCWh+quCY7yefSmlkQw1ANQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	
	<!-- bootstrap 버튼 
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    -->
   
 
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<style>
@font-face { 
    font-family: 'TTLaundryGothicB';
    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/2403-2@1.0/TTLaundryGothicB.woff2') format('woff2');
    font-weight: 700;
    font-style: normal;
}



img{
    display: block;
}

a{
    text-decoration: none;
}
body{
    /* background-color: #f6f5f0; */
    /* position: relative; */
   /* height: 1500px; */
    font-family: 'TTLaundryGothicB';
}

.inner{
    width: 1100px;
    margin: auto;
    position: relative;
}

div{
    /* border: 1px solid black; */
}

/* header */


header{
    width: 100%;
    top: 0;
    z-index: 15;
    position: fixed;
    background-color: #f6f5f0
}


header > .inner{
    height: 120px;
}

header .inner a{
    color: #656565;
}

header .inner a img{
    height: 100%;
    position: absolute;
    top: 0;
    bottom: 0;
    left: 10px;
    margin: auto;
    background-size: cover;
    overflow: hidden;
}

header .inner > .search{
    position: absolute;
    right: 0;
    left: 0;
    height: 100%;
    width: 500px;
    margin: 0 auto;
    box-sizing: border-box;
    display: flex;
    
}

header .inner .search input{
    width: 400px;
    height: 50px;
    border-radius: 40px;
    box-sizing: border-box;
    border-color: #e4d4fa;
    font-size: 17px;
    position: absolute;
    top: 30px; 
    left: 45px;
    padding: 20px;
    padding-right: 50px;
    font-family:'TTLaundryGothicB';
}

header .inner .search input:hover{
    
}


header .inner .search button{
    position: absolute;
    
    top: 33px;
    right: 65px;
    font-size: 43px;
    border-radius: 20px;
    box-sizing: border-box;
    background-color: transparent;
    border: 0;
    width: 50px;
    cursor: pointer;
    color: #e4d4fa;
}


header .inner .search input:focus{
    outline: none;
}


header .inner .login{
    position: absolute;
    right: 0;
}
header .inner .login ul{
    display: flex;

}
header .inner .login ul li{
    text-align: center;
    list-style: none;
    margin-right: 15px;
    font-size: 11px;
    font-weight: 700;
    color: #656565;
    position: relative;
}

header .inner .login ul li::before{
    content: "";
    width: 1px;
    height: 10px;
    background-color: #656565;
    display: block;
    position: absolute;
    top: 0;
    bottom: 0;
    left: -7px;
    margin: auto;
}

header .inner .login ul li:first-child:before{display: none;}

header .menubar::before{
    content: "";
    width: 100%;
    height: 1px;
    background-color: #c8c8c8;
    display: block;
}

.menubar{
    background-color: #f6f5f0;
    height: 80px;
    z-index: 10;
    position: relative;
}

.menubar .menu{
    height: 100%;
    box-sizing: border-box;
}

.menubar .menu .inner{
    display: flex;
    box-sizing: border-box;
    height: 100%;
    padding: 0;
    
}

.menubar .menu .inner li {
    width: 100%;
    height: 100%;
    list-style: none;
}
.menubar .menu .inner li ul{
    width: 100%;
    padding: 0;
    display: none;
}

.menubar .menu .inner li ul li a{
    font-size: 15px;
}




.menubar .menu .inner li a{
    position: relative;
    
    display: block;
    text-align: center;
    line-height: 80px;
    font-size: 18px;
    font-weight: 700;
    color: #8b7dbe;
    transition: all .3s;
}



.menubar .menu .inner  li:hover>a{
    color: purple;
    
}


.menubar .menu .inner  li:hover ul{
    background-color: #e4d4fa;
    opacity: .9;
    transform: scale(1);
    display: block;
    transition: all .4s;
    
}


.menubar .menu .inner  li ul li:hover a{
    
    color: purple;
    transition: all .5s;
}



.menubar .menu .inner li a:hover:after{
    content: "";
    display: block;
    background-color: purple;
    width: 60%;
    height: 3px;
    margin: 0;
    position: absolute;
    bottom: 0;
    transform: translateX(45px);  
}

.login2{
    margin-top: 10px;
    font-size: 13px;
}



</style>

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
                <form action="<%= contextPath %>/searchMain.sc">
                    
                        <input type="text" name="search" placeholder="검색어를 입력하세요">
                        <button class="material-icons" type="submit" >search</button>
                    
                </form>
            </div>
            <div class="login">
            <% if(loginUser == null) {%>
                <ul>
                    <li><a href="<%= contextPath %>/login.me">로그인</a></li>
                    <li><a href="<%= contextPath %>/enrollForm.me">회원가입</a></li>
                </ul>
            <% }else { %>
            <div class="login2">
            <br>
            <b><%= loginUser.getUserName() %>님</b>의 방문을 환영합니다. <br><br>
            <%if(loginUser.getUserId().equals("admin")) {%>
                <a href="<%= contextPath %>/admain.ad">관리자페이지</a>
                <%} %>
                <a href="<%= contextPath %>/mypage.myreview">마이페이지</a>
                <a href="<%= contextPath %>/logout.me">로그아웃</a>
            </div>
        </div>
		<% } %>
            </div>
        </div>
        <section class="menubar">
            <div class="menu">
                <ul class="inner">
                    <li>
                        <a href="<%= contextPath %>/noticeList.no?cpage=1">공지문의</a>
                        <ul class="hide-menu">
                            <li><a href="<%= contextPath %>/noticeList.no?cpage=1">공지사항</a></li>
                            <li><a href="<%=contextPath%>/iqList.ip?cpage=1">문의사항</a></li>
                            <li><a href="<%=contextPath %>/frequently.inq">자주하는질문</a></li>
                        </ul>   
                    </li>
                    <li>
                        <a href="<%= contextPath %>/playList.pl">놀거리</a>
                        <ul class="hide-menu">
                            <li><a href="<%= contextPath %>/searchMain.sc">놀거리 찾기</a></li>
                            <li><a href="<%= contextPath %>/onedayMain.on?cpage=1">원데이클래스</a></li>
                        </ul>   
                    </li>
                    <li>
                        <a href="<%= contextPath %>/clist.co?cpage=1">요리</a> 
                        <ul class="hide-menu">
                            <li><a href="<%= contextPath %>/clist.co?cpage=1">레시피 찾기</a></li>
                            <li><a href="<%= contextPath %>/cookingEnrollForm.co">레시피 업로드</a></li>
                            <li><a href="<%= contextPath %>/rankingSelect.rk">이번달 명예의 전당</a></li>
                        </ul>  
                    </li>
                    <li>
                        <a href="<%= contextPath %>/restaurantMain.pl">맛집</a>
                        <ul class="hide-menu">
                            <li><a href="<%= contextPath %>/searchMain.sc">맛집찾기</a></li>
                        </ul>   
                    </li>
                    <li>
                        <a href="<%= contextPath %>/minigame.mg">미니게임</a>
                        <ul class="hide-menu">
                            <li><a href="">랜덤뽑기</a></li>
                            <li><a href="<%=contextPath%>/playladder.min">사다리타기</a></li>
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