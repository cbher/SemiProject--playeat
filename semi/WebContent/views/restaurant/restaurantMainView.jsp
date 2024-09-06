<%@page import="semi.play.model.vo.Play"%>
<%@page import="semi.restaurant.model.vo.Restaurant"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	ArrayList<ArrayList> list = (ArrayList<ArrayList>)request.getAttribute("list");
	ArrayList<Restaurant> listSeoul = list.get(0);
	// 글번호, 글제목, 주소, 전화번호, 별점, 대표이미지경로
	ArrayList<Restaurant> listGyunggi = list.get(1);
	ArrayList<Restaurant> listIncheon = list.get(2);
	ArrayList<Restaurant> listKangwon = list.get(3);
	ArrayList<Restaurant> listChoongchung = list.get(4);
	ArrayList<Restaurant> listJulla = list.get(5);
	ArrayList<Restaurant> listGyungsang = list.get(6);
	ArrayList<Restaurant> listJeju = list.get(7);
	
	

%>


  

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	    <link rel="stylesheet" href="https://unpkg.com/swiper@6.8.4/swiper-bundle.min.css" />
    <script src="https://unpkg.com/swiper@6.8.4/swiper-bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <style>
    	
/* random slot */



.random{
    position: absolute;
    top: 250px;
    width: 100%;
}

.random div{
    border: 1px solid #e4d4fa;
}

.random .inner{
    height: 400px;
    border: 3px solid #e4d4fa;
    border-radius: 25px;
    box-sizing: border-box;
}

.random .inner .title{
    background-color: #e4d4fa;
    border-top-left-radius: 20px;
    border-top-right-radius: 20px;
    color: #333
}

.random .inner .content{
    background-color: #f6f5ef;
}

.random .inner .content img{
    width: 250px;
    height: 250px;
    transform: translateX(420px);
    border-radius: 15px;
    
}

.random .inner .name {
    position: relative;
    border: none;
    background-color: #fff;
    border-bottom-left-radius:23px;
    border-bottom-right-radius: 23px;
    height: 100px;
}

.random .inner .name h4{
    font-size: 20px;
    margin: 0;
    text-align: center;
    line-height: 68px;
}

.container {
    text-align: center;
    background-color: #f6f5f0;
}

#recommend-button {
    padding: 10px 20px;
    font-size: 16px;
    cursor: pointer;
}

#menu-display {
    position: relative;
    left:  400px;
    width: 300px; /* Adjust as needed */
    height: 220px; /* Adjust as needed */
    overflow: hidden;
}

#menu-image {
    width: 100%;
    height: 100%;
    position: absolute;
    top: 0;
    left: 0;
    opacity: 0;
    transition: opacity 0.5s ease-in-out;
}

#menu-name {
    font-size: 20px;
    margin: 0;
    height: 70px;
    text-align: center;
    line-height: 92px;
    font-size: 25px;
    font-weight: 900;
}


.random .inner .name button{
    position: absolute;
    right: 0;
    top: 0;
    bottom: 0;
    background-color: #e4d4fa;
    cursor: pointer;
    border: 1px solid #8b7dbe;
    width: 150px;
    border-radius: 25px;
    font-size: 18px;
    color: #333;
    font-weight: 700;
}

.random .inner .name button:hover{
    background-color: #8b7dbe;
}

/* main-slide - seoul */

.main-slide{

    position: absolute;
    top: 800px;
    left: 0;
    right: 0;
    box-sizing: border-box;
    
}

.main-slide .inner{
    border: 3px solid #e4d4fa;
    border-radius: 25px;
    box-sizing: border-box;
}

.main-slide.incheon .inner{
    top: 500px;
}

.main-slide .inner .title{
    height: 20px;
    padding: 20px;
    font-size: 20px;
    font-weight: 700;
    background-color: #e4d4fa;
    border-top-left-radius: 20px;
    border-top-right-radius: 20px;
    border-bottom: 1px solid #c8c8c8;
    line-height: 20px;
    color: black;
}


.main-slide .inner .swiper-container{
    background-color: #f6f5f0;
    border-radius: 0 0 25px 25px;
}

.main-slide .inner .swiper-pigination{

}

.main-slide .inner .swiper-prev{
    cursor: pointer;
    position: absolute;
    left: -50px;
    top: 180px;
    border: 3px solid #e4d4fa;
    display: flex;
    border-radius: 100%;
    
}

.main-slide .inner .swiper-prev .material-icons,
.main-slide .inner .swiper-next .material-icons{
    
    font-size: 35px;
    color: #e4d4fa;
}


.main-slide .inner .swiper-next{
    cursor: pointer;
    position: absolute;
    right: -50px;
    top: 180px;
    border: 3px solid #e4d4fa;
    display: flex;
    border-radius: 100%;
}



.main-slide .inner .swiper-container .swiper-wrapper{
    display: flex;
    
    
    border-bottom-left-radius: 25px;
    border-bottom-right-radius: 25px;

}

.main-slide .inner .swiper-container .swiper-wrapper .swiper-slide{
    
    
    border-radius: 25px;
    
}

.main-slide .inner .swiper-container .swiper-wrapper .swiper-slide a{
    
}

.main-slide .inner .swiper-container .swiper-wrapper .swiper-slide p{
    text-align: left;
    font-weight: 700;
    padding-left: 20px;
    color: #333;
    
}


.main-slide .inner .swiper-container .swiper-wrapper .swiper-slide a img{
    width: 250px;
    height: 250px;
    margin: 10px;
    border-radius: 25px;
    
}

/* sub-slide incheon */

.sub-slide{

    position: absolute;
    left: 0;
    right: 0;
    box-sizing: border-box;
    
}

.sub-slide.incheon{
    top: 1800px;
}
.sub-slide .inner{
    border: 3px solid #e4d4fa;
    border-radius: 25px;
    box-sizing: border-box;
    
}



.sub-slide .inner .title{
    height: 20px;
    padding: 20px;
    font-size: 20px;
    font-weight: 700;
    background-color: #e4d4fa;
    border-top-left-radius: 20px;
    border-top-right-radius: 20px;
    border-bottom: 1px solid #c8c8c8;
    line-height: 20px;
    color: black;
}


.sub-slide .inner .swiper-container{
    background-color: #f6f5f0;
    border-radius: 0 0 25px 25px;
}

.sub-slide .inner .swiper-pigination{

}

.sub-slide .inner .swiper-prev{
    cursor: pointer;
    position: absolute;
    left: -50px;
    top: 180px;
    border: 3px solid #e4d4fa;
    display: flex;
    border-radius: 100%;
    
}

.sub-slide .inner .swiper-prev .material-icons,
.sub-slide .inner .swiper-next .material-icons{
    
    font-size: 35px;
    color: #e4d4fa;
}


.sub-slide .inner .swiper-next{
    cursor: pointer;
    position: absolute;
    right: -50px;
    top: 180px;
    border: 3px solid #e4d4fa;
    display: flex;
    border-radius: 100%;
}



.sub-slide .inner .swiper-container .swiper-wrapper{
    display: flex;
    
    
    border-bottom-left-radius: 25px;
    border-bottom-right-radius: 25px;

}

.sub-slide .inner .swiper-container .swiper-wrapper .swiper-slide{
    
    
    border-radius: 25px;
    
}

.sub-slide .inner .swiper-container .swiper-wrapper .swiper-slide a{
    
}

.sub-slide .inner .swiper-container .swiper-wrapper .swiper-slide p{
    text-align: left;
    font-weight: 700;
    padding-left: 20px;
    color: #333;
    
}


.sub-slide .inner .swiper-container .swiper-wrapper .swiper-slide a img{
    width: 250px;
    height: 250px;
    margin: 10px;
    border-radius: 25px;
    
}

#top-btn { 
    display: none; 
    position: fixed;
    bottom: 40px;
    right: 15%;
    z-index: 999;
    background-color: white;
    border: 2px solid #dbdbdb;
    outline: none;
    cursor: pointer;
    padding: 10px;
    border-radius: 50%;
    width: 50px;
    height: 50px;
    font-size: 13px;
    font-weight: 500;
    color: #333333;
}

.sub-slide.gyunggi{
	top:1300px;
}
   
.sub-slide.kangwon{
    top: 2300px;
}

.sub-slide.choongchung{
    top: 2800px;
}

.sub-slide.julla{
    top: 3300px;
}

.sub-slide.gyungsang{
    top: 3800px;
}

.sub-slide.jeju{
    top: 4300px;
}

footer{

}

footer .inner{
    display: block;
    color: #8b7dbe;
    height: 100px;
    font-size: 15px;
    padding: 20px 0 20px 0;
    top: 4800px;
    width: 100%;
    height: 80px;
}   


footer .menu{
    list-style-type: none;
    display: flex;
    justify-content: center;
}

footer .menu li{
    position: relative;
}

footer .menu li::before{
    content: "";
    width: 3px;
    height: 3px;
    background-color: #555;
    position: absolute; /*position의 값을 부여하면 block요소가 됨.*/
    top: 0;
    bottom: 0;
    right: -1px;
    margin: auto;
}
footer .menu li:last-child::before{
    display: none;
}

footer .menu li a{
    font-size: 12px;
    padding: 5px 15px; 
    display: block;
}


footer .inner .info{
    list-style-type: none;
    padding: 0;
    margin: auto;
    display: flex;
    justify-content: center;
    align-items: center;
}

footer .info span{
    margin-right: 20px;
    font-size: 12px;
}

footer .info span:last-child{
    margin-right: 0;
}

footer .inner .info .copyright{
    display: flex;
    align-items: center;
}

    	
    </style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	<%@ include file="../common/badge.jsp" %>
	<%@ include file="../common/top.jsp" %>
	    <section class="random">
        <div class="inner">
            <div class="title">
                <h1 align="center">오늘 뭐먹지?</h1>
            </div>
            <div class="container">
                <div id="menu-display">
                    <img id="menu-image" src="" alt="추천 메뉴">
                    
                </div>
            </div>
            <div class="name">
                <p id="menu-name"></p>
                <button id="recommend-button">메뉴 추천하기</button>
            </div>
        </div>
    </section>

    <section class="main-slide seoul">
        <div class="inner">
            <div class="title">서울 음식</div>
            <div class="swiper-container">
                <div class="swiper-wrapper">
                <% for(int i = 0; i<listSeoul.size();i++){ %>
                    <div class="swiper-slide">
                        <a href="<%= contextPath %>/restaurantDetail.pl?placeNo=<%= listSeoul.get(i).getPlaceNo() %>">
                            <img src="<%= listSeoul.get(i).getTitleImg() %>" alt="">
                        </a>
                        <p><%= listSeoul.get(i).getPlaceTitle() %></p>
                    </div>
                <% } %>
                </div>
            </div>

            
            <div class="swiper-prev">
                <div class="material-icons">arrow_back</div>
            </div>
            <div class="swiper-next">
                <div class="material-icons">arrow_forward</div>
            </div>
        </div>
    </section>
    
    <section class="sub-slide gyunggi">
        <div class="inner">
            <div class="title">경기도 음식</div>
            <div class="swiper-container">
                <div class="swiper-wrapper">
                <% for(int i = 0; i < listGyunggi.size();i++ ){ %>
                    <div class="swiper-slide">
                        <a href="<%= contextPath %>/restaurantDetail.pl?placeNo=<%= listGyunggi.get(i).getPlaceNo() %>">
                            <img src="<%= listGyunggi.get(i).getTitleImg() %>" alt="">
                        </a>
                        <p><%= listGyunggi.get(i).getPlaceTitle() %></p>
                    </div>
                <% } %>
                    
                </div>
            </div>

            
            <div class="swiper-prev">
                <div class="material-icons">arrow_back</div>
            </div>
            <div class="swiper-next">
                <div class="material-icons">arrow_forward</div>
            </div>
        </div>
    </section>

    <section class="sub-slide incheon">
        <div class="inner">
            <div class="title">인천 음식</div>
            <div class="swiper-container">
                <div class="swiper-wrapper">
                    <% for(int i = 0; i < listIncheon.size();i++ ){ %>
                    <div class="swiper-slide">
                        <a href="<%= contextPath %>/restaurantDetail.pl?placeNo=<%= listIncheon.get(i).getPlaceNo() %>">
                            <img src="<%= listIncheon.get(i).getTitleImg() %>" alt="">
                        </a>
                        <p><%= listIncheon.get(i).getPlaceTitle() %></p>
                    </div>
                <% } %>
                </div>
            </div>

            
            <div class="swiper-prev">
                <div class="material-icons">arrow_back</div>
            </div>
            <div class="swiper-next">
                <div class="material-icons">arrow_forward</div>
            </div>
        </div>
    </section>
    <section class="sub-slide kangwon">
        <div class="inner">
            <div class="title">강원도 음식</div>
            <div class="swiper-container">
                <div class="swiper-wrapper">
                    <% for(int i = 0; i < listKangwon.size();i++ ){ %>
                    <div class="swiper-slide">
                        <a href="<%= contextPath %>/restaurantDetail.pl?placeNo=<%= listKangwon.get(i).getPlaceNo() %>">
                            <img src="<%= listKangwon.get(i).getTitleImg() %>" alt="">
                        </a>
                        <p><%= listKangwon.get(i).getPlaceTitle() %></p>
                    </div>
                <% } %>
                </div>
            </div>

            
            <div class="swiper-prev">
                <div class="material-icons">arrow_back</div>
            </div>
            <div class="swiper-next">
                <div class="material-icons">arrow_forward</div>
            </div>
        </div>
    </section>
    <section class="sub-slide choongchung">
        <div class="inner">
            <div class="title">충청도 음식</div>
            <div class="swiper-container">
                <div class="swiper-wrapper">
                    <% for(int i = 0; i < listChoongchung.size();i++ ){ %>
                    <div class="swiper-slide">
                        <a href="<%= contextPath %>/restaurantDetail.pl?placeNo=<%= listChoongchung.get(i).getPlaceNo() %>">
                            <img src="<%= listChoongchung.get(i).getTitleImg() %>" alt="">
                        </a>
                        <p><%= listChoongchung.get(i).getPlaceTitle() %></p>
                    </div>
                <% } %>
                </div>
            </div>

            
            <div class="swiper-prev">
                <div class="material-icons">arrow_back</div>
            </div>
            <div class="swiper-next">
                <div class="material-icons">arrow_forward</div>
            </div>
        </div>
    </section>
    <section class="sub-slide julla">
        <div class="inner">
            <div class="title">전라도 음식</div>
            <div class="swiper-container">
                <div class="swiper-wrapper">
                    <% for(int i = 0; i < listJulla.size();i++ ){ %>
                    <div class="swiper-slide">
                        <a href="<%= contextPath %>/restaurantDetail.pl?placeNo=<%= listJulla.get(i).getPlaceNo() %>">
                            <img src="<%= listJulla.get(i).getTitleImg() %>" alt="">
                        </a>
                        <p><%= listJulla.get(i).getPlaceTitle() %></p>
                    </div>
                <% } %>
                </div>
            </div>

            
            <div class="swiper-prev">
                <div class="material-icons">arrow_back</div>
            </div>
            <div class="swiper-next">
                <div class="material-icons">arrow_forward</div>
            </div>
        </div>
    </section>
    <section class="sub-slide gyungsang">
        <div class="inner">
            <div class="title">경상도 음식</div>
            <div class="swiper-container">
                <div class="swiper-wrapper">
                    <% for(int i = 0; i < listGyungsang.size();i++ ){ %>
                    <div class="swiper-slide">
                        <a href="<%= contextPath %>/restaurantDetail.pl?placeNo=<%= listGyungsang.get(i).getPlaceNo() %>">
                            <img src="<%= listGyungsang.get(i).getTitleImg() %>" alt="">
                        </a>
                        <p><%= listGyungsang.get(i).getPlaceTitle() %></p>
                    </div>
                <% } %>
                </div>
            </div>

            
            <div class="swiper-prev">
                <div class="material-icons">arrow_back</div>
            </div>
            <div class="swiper-next">
                <div class="material-icons">arrow_forward</div>
            </div>
        </div>
    </section>
    <section class="sub-slide jeju">
        <div class="inner">
            <div class="title">제주도 음식</div>
            <div class="swiper-container">
                <div class="swiper-wrapper">
                    <% for(int i = 0; i < listJeju.size();i++ ){ %>
                    <div class="swiper-slide">
                        <a href="<%= contextPath %>/restaurantDetail.pl?placeNo=<%= listJeju.get(i).getPlaceNo() %>">
                            <img src="<%= listJeju.get(i).getTitleImg() %>" alt="">
                        </a>
                        <p><%= listJeju.get(i).getPlaceTitle() %></p>
                    </div>
                <% } %>
                </div>
            </div>

            
            <div class="swiper-prev">
                <div class="material-icons">arrow_back</div>
            </div>
            <div class="swiper-next">
                <div class="material-icons">arrow_forward</div>
            </div>
        </div>
    </section>
    
     <footer>
        <div class="inner">
          <ul class="menu">
            <li><a href="">개인정보처리방침</a></li>
            <li><a href=""> 이용약관 </a></li>
            <li><a href="">위치정보이용약관</a></li>
            <li><a href="">원클래스약관</a></li>
          
          </ul>
      
          <div class="info">
            <span>kh H반 4조</span>
            <span>semi4jyo@gmail.com</span>
            <span>개인정보 책임자 4조</span>
      
      
            <p class="copyright">
              &copy; <span id="this-year"></span> kh정보교육원 H반 4조 세미프로젝트
            </p>
          </div>
        </div>
      </footer>
      

      <script>
        // footer this-year (현재년도 표시)
        const thisYear = document.querySelector("#this-year");
        thisYear.textContent = new Date().getFullYear();
      </script>
    
    <script defer>


    new Swiper('.main-slide .swiper-container',{
        slidesPerView: 4, // 한번에 보여줄 슬라이드 개수
        spaceBetween: 10, // 슬라이드 사이 여백
         // 1번 슬라이드가 가운데 보이기
        loop:false,
        // autoplay: {
        //     delay : 5000,
        // },
        pagination:{
            el : '.main-slide .swiper-pagination', // 페이지 번호 요소 선택자
            clickable : true, // 사용자의 페이지 번호 요소 제어 가능 여부

        },
        navigation : {
            prevEl : '.main-slide .swiper-prev',
            nextEl : '.main-slide .swiper-next',
        }

    });
    
    new Swiper('.sub-slide.gyunggi .swiper-container',{
        slidesPerView: 4, // 한번에 보여줄 슬라이드 개수
        spaceBetween: 10, // 슬라이드 사이 여백
         // 1번 슬라이드가 가운데 보이기
        loop:false,
        // autoplay: {
        //     delay : 5000,
        // },
        pagination:{
            el : '.sub-slide.gyunggi .swiper-pagination', // 페이지 번호 요소 선택자
            clickable : true, // 사용자의 페이지 번호 요소 제어 가능 여부

        },
        navigation : {
            prevEl : '.sub-slide.gyunggi .swiper-prev',
            nextEl : '.sub-slide.gyunggi .swiper-next',
        }

    });

    new Swiper('.sub-slide.incheon .swiper-container',{
        slidesPerView: 4, // 한번에 보여줄 슬라이드 개수
        spaceBetween: 10, // 슬라이드 사이 여백
         // 1번 슬라이드가 가운데 보이기
        loop:false,
        // autoplay: {
        //     delay : 5000,
        // },
        pagination:{
            el : '.sub-slide.incheon .swiper-pagination', // 페이지 번호 요소 선택자
            clickable : true, // 사용자의 페이지 번호 요소 제어 가능 여부

        },
        navigation : {
            prevEl : '.sub-slide.incheon .swiper-prev',
            nextEl : '.sub-slide.incheon .swiper-next',
        }

    });

    new Swiper('.sub-slide.kangwon .swiper-container',{
        slidesPerView: 4, // 한번에 보여줄 슬라이드 개수
        spaceBetween: 10, // 슬라이드 사이 여백
         // 1번 슬라이드가 가운데 보이기
        loop:false,
        // autoplay: {
        //     delay : 5000,
        // },
        pagination:{
            el : '.sub-slide.kangwon .swiper-pagination', // 페이지 번호 요소 선택자
            clickable : true, // 사용자의 페이지 번호 요소 제어 가능 여부

        },
        navigation : {
            prevEl : '.sub-slide.kangwon .swiper-prev',
            nextEl : '.sub-slide.kangwon .swiper-next',
        }

    });

    new Swiper('.sub-slide.choongchung .swiper-container',{
        slidesPerView: 4, // 한번에 보여줄 슬라이드 개수
        spaceBetween: 10, // 슬라이드 사이 여백
         // 1번 슬라이드가 가운데 보이기
        loop:false,
        // autoplay: {
        //     delay : 5000,
        // },
        pagination:{
            el : '.sub-slide.choongchung .swiper-pagination', // 페이지 번호 요소 선택자
            clickable : true, // 사용자의 페이지 번호 요소 제어 가능 여부

        },
        navigation : {
            prevEl : '.sub-slide.choongchung .swiper-prev',
            nextEl : '.sub-slide.choongchung .swiper-next',
        }

    });

    new Swiper('.sub-slide.julla .swiper-container',{
        slidesPerView: 4, // 한번에 보여줄 슬라이드 개수
        spaceBetween: 10, // 슬라이드 사이 여백
         // 1번 슬라이드가 가운데 보이기
        loop:false,
        // autoplay: {
        //     delay : 5000,
        // },
        pagination:{
            el : '.sub-slide.julla .swiper-pagination', // 페이지 번호 요소 선택자
            clickable : true, // 사용자의 페이지 번호 요소 제어 가능 여부

        },
        navigation : {
            prevEl : '.sub-slide.julla .swiper-prev',
            nextEl : '.sub-slide.julla .swiper-next',
        }

    });

    new Swiper('.sub-slide.gyungsang .swiper-container',{
        slidesPerView: 4, // 한번에 보여줄 슬라이드 개수
        spaceBetween: 10, // 슬라이드 사이 여백
         // 1번 슬라이드가 가운데 보이기
        loop:false,
        // autoplay: {
        //     delay : 5000,
        // },
        pagination:{
            el : '.sub-slide.gyungsang .swiper-pagination', // 페이지 번호 요소 선택자
            clickable : true, // 사용자의 페이지 번호 요소 제어 가능 여부

        },
        navigation : {
            prevEl : '.sub-slide.gyungsang .swiper-prev',
            nextEl : '.sub-slide.gyungsang .swiper-next',
        }

    });

    new Swiper('.sub-slide.jeju .swiper-container',{
        slidesPerView: 4, // 한번에 보여줄 슬라이드 개수
        spaceBetween: 10, // 슬라이드 사이 여백
         // 1번 슬라이드가 가운데 보이기
        loop:false,
        // autoplay: {
        //     delay : 5000,
        // },
        pagination:{
            el : '.sub-slide.jeju .swiper-pagination', // 페이지 번호 요소 선택자
            clickable : true, // 사용자의 페이지 번호 요소 제어 가능 여부

        },
        navigation : {
            prevEl : '.sub-slide.jeju .swiper-prev',
            nextEl : '.sub-slide.jeju .swiper-next',
        }

    });









    // script.js
    document.addEventListener('DOMContentLoaded', function() {
        // 메뉴 데이터
        const menus = [
            { name: "덮밥", image: "resources/randomMenuImg/덮밥.jfif" },
            { name: "삼겹살", image: "resources/randomMenuImg/삼겹살.jfif" },
            { name: "짜장면", image: "resources/randomMenuImg/짜장면.jpg" },
            { name: "불고기", image: "resources/randomMenuImg/불고기.jpg" },
            { name: "제육", image: "resources/randomMenuImg/제육.jpg" },
            { name: "돈가스", image: "resources/randomMenuImg/돈가스.jpg" },
            { name: "라멘", image: "resources/randomMenuImg/라멘.jpg" },
            { name: "김치찌개", image:"resources/randomMenuImg/김치찌개.jfif"},
            { name: "국밥", image: "resources/randomMenuImg/국밥.jfif"},
            { name: "돼지고기 김치찜", image:"resources/randomMenuImg/돼지고기김치찜.jfif"},
            { name: "냉면", image:"resources/randomMenuImg/냉면.jfif"},
            { name: "떡볶이", image:"resources/randomMenuImg/떡볶이.jfif"},
            { name: "햄버거", image:"resources/randomMenuImg/햄버거.jfif"},
            { name: "찜닭", image:"resources/randomMenuImg/찜닭.jfif"},
            { name: "칼국수", image:"resources/randomMenuImg/칼국수.jfif"},
            { name: "스파게티", image:"resources/randomMenuImg/스파게티.jfif"},
            { name: "백반", image:"resources/randomMenuImg/백반.jfif"},
        ];

        const menuImage = document.getElementById('menu-image');
        const menuName = document.getElementById('menu-name');

        // 슬롯머신 애니메이션 실행
        function startSlotMachine() {
            // 슬롯머신 이미지 배열 생성
            let images = [];
            for (let i = 0; i < 10; i++) {
                const randomIndex = Math.floor(Math.random() * menus.length);
                images.push(menus[randomIndex].image);
            }

            // 슬롯머신 애니메이션
            let index = 0;
            menuImage.style.opacity = 1; // Make sure image is visible
            menuImage.src = images[index];
            const duration = 3; // 애니메이션 총 지속 시간 (초)
            const frameRate = 30; // 애니메이션 프레임 속도 (프레임/초)
            const frames = duration * frameRate; // 총 프레임 수
            const interval = duration * 1000 / frames; // 각 프레임 간격 (밀리초)
            
            const animationInterval = setInterval(() => {
                menuImage.src = images[index];
                index = (index + 1) % images.length; // 순환
            }, interval);

            // 애니메이션 종료 후 최종 이미지 설정
            setTimeout(() => {
                clearInterval(animationInterval);
                const finalIndex = Math.floor(Math.random() * menus.length);
                const selectedMenu = menus[finalIndex];
                menuImage.src = selectedMenu.image;
                menuName.textContent = selectedMenu.name;
                menuImage.style.opacity = 1;
            }, duration * 1000); // duration 동안 회전 후 멈춤
        }

        document.getElementById('recommend-button').addEventListener('click', function() {
            menuImage.style.opacity = 0; // 이미지 사라지게 하기
            setTimeout(() => {
                startSlotMachine();
            }, 500); // 클릭 후 500ms 후에 슬롯머신 시작
        });
    });


    </script>
    
</body>
</html>
	