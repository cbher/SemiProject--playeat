<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
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
    /* background-color: #f6f5f0; */
    position: relative;


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
    
}

header{
    width: 100%;
    top: 0;
    z-index: 9;
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
    height: 150%;
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
}

header .inner .search input:hover{
    
}


header .inner .search button{
    position: absolute;
    
    top: 33px;
    right: 55px;
    font-size: 43px;
    border-radius: 20px;
    box-sizing: border-box;
    background-color: transparent;
    border: 0;
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
    z-index: 0;
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
/* BADGE */
.badge {
    position:absolute;
    top: 0;
    left: 70%;
    width: 180px;
    height: 520px;
    margin: 5% 0 0 320px;
    background-color:#f6f5f0;
    border: 2px solid #8B7DBE;
    border-radius: 10px;
    display: flex;
    align-items: center;
    flex-direction: column;
    z-index: 8;
}

@media (max-width:870px) {
    .badge {width:15%; left: auto; right:0; margin-left: 0;}
    div.info {width:80%; margin: 100px 0;}
}

.badge .text{
    font-size: 20px;
    text-align: center;
    border-bottom: 1px solid #8B7DBE;
    color: #8B7DBE;
    background-color: #e4d4fa;
    border-radius: 10px 10px 0px 0;
    width: 100%;
    height: 30px;
    line-height: 1.5;
}

.badge a{
    display: flex;
    justify-content: center;
    align-items: center;
    border: 1px solid #8B7DBE;
    border-radius: 5px;
    margin: auto;
    width: 140px;
    height: 130px;
}

.badge img{
    width: 100%;
    height: 100%;
}

.badge .place .badge-title{
    background: rgba(0,0,0,0.5);
    position: absolute;
    border-radius: 5px;
    margin: auto;
    width: 140px;
    height: 130px;
    color: #fff;
    padding: 20px;
    box-sizing: border-box;
    opacity: 0;
    transition: 0.5s;
}

.badge .place .badge-title h2{
    text-align: center;
    line-height: 5;
    font-size: 20px;
    /* margin-left: 9px; */
    display: inline;
}

.place:hover .badge-title {
    opacity: 1;
  }
	
</style>

<link rel="stylesheet" href="./css/cooking.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <script defer src="./js/cooking.js"></script>
    <link rel="stylesheet" href="https://unpkg.com/swiper@6.8.4/swiper-bundle.min.css" />
    <script src="https://unpkg.com/swiper@6.8.4/swiper-bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    
</head>
<body>
	        <header>
            <div class="inner">
                <a href="" class="logo">
                    <img src="./resourse/play_eat-removebg-preview.png" alt="">
                </a>
                <div class="search">
                    <form action="test.do">
                        
                            <input type="text" name="search" placeholder="검색어를 입력하세요">
                            <button class="material-icons" type="submit" >search</button>
                        
                    </form>
                </div>
                <div class="login">
                    <ul>
                        <li><a href="">로그인</a></li>
                        <li><a href="">회원가입</a></li>
                    </ul>
                </div>
                
            </div>
            <section class="menubar">
                <div class="menu">
                    <ul class="inner">
                        <li>
                            <a href="">공지문의</a>
                            <ul class="hide-menu">
                                <li><a href="">공지사항</a></li>
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
                            <a href="">요리</a> 
                            <ul class="hide-menu">
                                <li><a href="clist.co">레시피 찾기</a></li>
                                <li><a href="">레시피 업로드</a></li>
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
                            <a href="">미니게임</a>
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
        <div class="badge">
            <div class="text">최근 본 장소</div>
            <a href="javascript:void(0)" class="place">
              <img src="./resourse/덮밥.jpg" alt="">
              <div class="badge-title">
                <h2>여긴어디야</h2>
              </div>
            </a>
            <a href="javascript:void(0)" class="place">
              <img src="./resourse/짜장면.jpg" alt="">
              <div class="badge-title">
                <h2>여긴어디야</h2>
              </div>
            </a>
            <a href="javascript:void(0)" class="place">
              <img src="./resourse/삼겹살.jpg" alt="">
              <div class="badge-title">
                <h2>여긴어디야</h2>
              </div>
            </a>
        </div>
        <script defer>
		    let quickMenu = $('.badge');
		    const DURATION = 900; // 이동 애니메이션 시간
		
		    function positionQuickMenu() {
		        let windowHeight = $(window).height();
		        let quickMenuHeight = quickMenu.height();
		        
		        // 화면의 중앙 위치를 계산
		        let point = ($(window).scrollTop() + (windowHeight / 2)) - (quickMenuHeight / 2);
		
		        point -= 100;
		
		        quickMenu.stop().animate({ top: point }, DURATION);
		    }
		
		    $(window).scroll(function() {
		        positionQuickMenu(); // 스크롤할 때마다 중앙에 맞춰 이동
		    });
		
		    $(window).resize(function() {
		        positionQuickMenu(); // 창 크기가 변경될 때도 중앙에 재배치
		    });
		
		    $(document).ready(function() {
		        positionQuickMenu(); // 페이지 로드 시 중앙에 배치
		    });
    </script>
</body>
</html>