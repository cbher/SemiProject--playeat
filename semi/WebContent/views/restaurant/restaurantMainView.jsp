<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="/semi/resources/css/restaurantMain.css">
	<script defer src="/semi/resources/js/restaurantMain.js"></script>
	    <link rel="stylesheet" href="https://unpkg.com/swiper@6.8.4/swiper-bundle.min.css" />
    <script src="https://unpkg.com/swiper@6.8.4/swiper-bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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
                    <div class="swiper-slide">
                        <a href="">
                            <img src="./resourse/AdobeStock_600875580-1024x683.jpg" alt="">
                        </a>
                        <p>플레이잇1</p>
                    </div>
                    <div class="swiper-slide">
                        <a href="">
                            <img src="./resourse/shutterstock_2006673803-scaled.jpg" alt="">
                        </a>
                        <p>플레이잇2</p>
                    </div>
                    <div class="swiper-slide">
                        <a href="">
                            <img src="./resourse/play&eat.png" alt="">
                        </a>
                        <p>플레이잇3</p>
                    </div>
                    <div class="swiper-slide">
                        <a href="">
                            <img src="./resourse/play&eat.png" alt="">
                        </a>
                        <p>플레이잇4</p>
                    </div>
                    <div class="swiper-slide">
                        <a href="">
                            <img src="./resourse/play&eat.png" alt="">
                        </a>
                        <p>플레이잇5</p>
                    </div>
                    <div class="swiper-slide">
                        <a href="">
                            <img src="./resourse/play&eat.png" alt="">
                        </a>
                        <p>플레이잇6</p>
                    </div>
                    <div class="swiper-slide">
                        <a href="">
                            <img src="./resourse/play&eat.png" alt="">
                        </a>
                        <p>플레이잇7</p>
                    </div>
                    <div class="swiper-slide">
                        <a href="">
                            <img src="./resourse/play&eat.png" alt="">
                        </a>
                        <p>플레이잇7</p>
                    </div>
                    <div class="swiper-slide">
                        <a href="">
                            <img src="./resourse/play&eat.png" alt="">
                        </a>
                        <p>플레이잇7</p>
                    </div>
                    <div class="swiper-slide">
                        <a href="">
                            <img src="./resourse/play&eat.png" alt="">
                        </a>
                        <p>플레이잇7</p>
                    </div>
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
                    <div class="swiper-slide">
                        <a href="">
                            <img src="./resourse/AdobeStock_600875580-1024x683.jpg" alt="">
                        </a>
                        <p>플레이잇1</p>
                    </div>
                    <div class="swiper-slide">
                        <a href="">
                            <img src="./resourse/shutterstock_2006673803-scaled.jpg" alt="">
                        </a>
                        <p>플레이잇2</p>
                    </div>
                    <div class="swiper-slide">
                        <a href="">
                            <img src="./resourse/play&eat.png" alt="">
                        </a>
                        <p>플레이잇3</p>
                    </div>
                    <div class="swiper-slide">
                        <a href="">
                            <img src="./resourse/play&eat.png" alt="">
                        </a>
                        <p>플레이잇4</p>
                    </div>
                    <div class="swiper-slide">
                        <a href="">
                            <img src="./resourse/play&eat.png" alt="">
                        </a>
                        <p>플레이잇5</p>
                    </div>
                    <div class="swiper-slide">
                        <a href="">
                            <img src="./resourse/play&eat.png" alt="">
                        </a>
                        <p>플레이잇6</p>
                    </div>
                    <div class="swiper-slide">
                        <a href="">
                            <img src="./resourse/play&eat.png" alt="">
                        </a>
                        <p>플레이잇7</p>
                    </div>
                    <div class="swiper-slide">
                        <a href="">
                            <img src="./resourse/play&eat.png" alt="">
                        </a>
                        <p>플레이잇7</p>
                    </div>
                    <div class="swiper-slide">
                        <a href="">
                            <img src="./resourse/play&eat.png" alt="">
                        </a>
                        <p>플레이잇7</p>
                    </div>
                    <div class="swiper-slide">
                        <a href="">
                            <img src="./resourse/play&eat.png" alt="">
                        </a>
                        <p>플레이잇7</p>
                    </div>
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
                    <div class="swiper-slide">
                        <a href="">
                            <img src="./resourse/AdobeStock_600875580-1024x683.jpg" alt="">
                        </a>
                        <p>플레이잇1</p>
                    </div>
                    <div class="swiper-slide">
                        <a href="">
                            <img src="./resourse/shutterstock_2006673803-scaled.jpg" alt="">
                        </a>
                        <p>플레이잇2</p>
                    </div>
                    <div class="swiper-slide">
                        <a href="">
                            <img src="./resourse/play&eat.png" alt="">
                        </a>
                        <p>플레이잇3</p>
                    </div>
                    <div class="swiper-slide">
                        <a href="">
                            <img src="./resourse/play&eat.png" alt="">
                        </a>
                        <p>플레이잇4</p>
                    </div>
                    <div class="swiper-slide">
                        <a href="">
                            <img src="./resourse/play&eat.png" alt="">
                        </a>
                        <p>플레이잇5</p>
                    </div>
                    <div class="swiper-slide">
                        <a href="">
                            <img src="./resourse/play&eat.png" alt="">
                        </a>
                        <p>플레이잇6</p>
                    </div>
                    <div class="swiper-slide">
                        <a href="">
                            <img src="./resourse/play&eat.png" alt="">
                        </a>
                        <p>플레이잇7</p>
                    </div>
                    <div class="swiper-slide">
                        <a href="">
                            <img src="./resourse/play&eat.png" alt="">
                        </a>
                        <p>플레이잇7</p>
                    </div>
                    <div class="swiper-slide">
                        <a href="">
                            <img src="./resourse/play&eat.png" alt="">
                        </a>
                        <p>플레이잇7</p>
                    </div>
                    <div class="swiper-slide">
                        <a href="">
                            <img src="./resourse/play&eat.png" alt="">
                        </a>
                        <p>플레이잇7</p>
                    </div>
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
                    <div class="swiper-slide">
                        <a href="">
                            <img src="./resourse/AdobeStock_600875580-1024x683.jpg" alt="">
                        </a>
                        <p>플레이잇1</p>
                    </div>
                    <div class="swiper-slide">
                        <a href="">
                            <img src="./resourse/shutterstock_2006673803-scaled.jpg" alt="">
                        </a>
                        <p>플레이잇2</p>
                    </div>
                    <div class="swiper-slide">
                        <a href="">
                            <img src="./resourse/play&eat.png" alt="">
                        </a>
                        <p>플레이잇3</p>
                    </div>
                    <div class="swiper-slide">
                        <a href="">
                            <img src="./resourse/play&eat.png" alt="">
                        </a>
                        <p>플레이잇4</p>
                    </div>
                    <div class="swiper-slide">
                        <a href="">
                            <img src="./resourse/play&eat.png" alt="">
                        </a>
                        <p>플레이잇5</p>
                    </div>
                    <div class="swiper-slide">
                        <a href="">
                            <img src="./resourse/play&eat.png" alt="">
                        </a>
                        <p>플레이잇6</p>
                    </div>
                    <div class="swiper-slide">
                        <a href="">
                            <img src="./resourse/play&eat.png" alt="">
                        </a>
                        <p>플레이잇7</p>
                    </div>
                    <div class="swiper-slide">
                        <a href="">
                            <img src="./resourse/play&eat.png" alt="">
                        </a>
                        <p>플레이잇7</p>
                    </div>
                    <div class="swiper-slide">
                        <a href="">
                            <img src="./resourse/play&eat.png" alt="">
                        </a>
                        <p>플레이잇7</p>
                    </div>
                    <div class="swiper-slide">
                        <a href="">
                            <img src="./resourse/play&eat.png" alt="">
                        </a>
                        <p>플레이잇7</p>
                    </div>
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
                    <div class="swiper-slide">
                        <a href="">
                            <img src="./resourse/AdobeStock_600875580-1024x683.jpg" alt="">
                        </a>
                        <p>플레이잇1</p>
                    </div>
                    <div class="swiper-slide">
                        <a href="">
                            <img src="./resourse/shutterstock_2006673803-scaled.jpg" alt="">
                        </a>
                        <p>플레이잇2</p>
                    </div>
                    <div class="swiper-slide">
                        <a href="">
                            <img src="./resourse/play&eat.png" alt="">
                        </a>
                        <p>플레이잇3</p>
                    </div>
                    <div class="swiper-slide">
                        <a href="">
                            <img src="./resourse/play&eat.png" alt="">
                        </a>
                        <p>플레이잇4</p>
                    </div>
                    <div class="swiper-slide">
                        <a href="">
                            <img src="./resourse/play&eat.png" alt="">
                        </a>
                        <p>플레이잇5</p>
                    </div>
                    <div class="swiper-slide">
                        <a href="">
                            <img src="./resourse/play&eat.png" alt="">
                        </a>
                        <p>플레이잇6</p>
                    </div>
                    <div class="swiper-slide">
                        <a href="">
                            <img src="./resourse/play&eat.png" alt="">
                        </a>
                        <p>플레이잇7</p>
                    </div>
                    <div class="swiper-slide">
                        <a href="">
                            <img src="./resourse/play&eat.png" alt="">
                        </a>
                        <p>플레이잇7</p>
                    </div>
                    <div class="swiper-slide">
                        <a href="">
                            <img src="./resourse/play&eat.png" alt="">
                        </a>
                        <p>플레이잇7</p>
                    </div>
                    <div class="swiper-slide">
                        <a href="">
                            <img src="./resourse/play&eat.png" alt="">
                        </a>
                        <p>플레이잇7</p>
                    </div>
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
                    <div class="swiper-slide">
                        <a href="">
                            <img src="./resourse/AdobeStock_600875580-1024x683.jpg" alt="">
                        </a>
                        <p>플레이잇1</p>
                    </div>
                    <div class="swiper-slide">
                        <a href="">
                            <img src="./resourse/shutterstock_2006673803-scaled.jpg" alt="">
                        </a>
                        <p>플레이잇2</p>
                    </div>
                    <div class="swiper-slide">
                        <a href="">
                            <img src="./resourse/play&eat.png" alt="">
                        </a>
                        <p>플레이잇3</p>
                    </div>
                    <div class="swiper-slide">
                        <a href="">
                            <img src="./resourse/play&eat.png" alt="">
                        </a>
                        <p>플레이잇4</p>
                    </div>
                    <div class="swiper-slide">
                        <a href="">
                            <img src="./resourse/play&eat.png" alt="">
                        </a>
                        <p>플레이잇5</p>
                    </div>
                    <div class="swiper-slide">
                        <a href="">
                            <img src="./resourse/play&eat.png" alt="">
                        </a>
                        <p>플레이잇6</p>
                    </div>
                    <div class="swiper-slide">
                        <a href="">
                            <img src="./resourse/play&eat.png" alt="">
                        </a>
                        <p>플레이잇7</p>
                    </div>
                    <div class="swiper-slide">
                        <a href="">
                            <img src="./resourse/play&eat.png" alt="">
                        </a>
                        <p>플레이잇7</p>
                    </div>
                    <div class="swiper-slide">
                        <a href="">
                            <img src="./resourse/play&eat.png" alt="">
                        </a>
                        <p>플레이잇7</p>
                    </div>
                    <div class="swiper-slide">
                        <a href="">
                            <img src="./resourse/play&eat.png" alt="">
                        </a>
                        <p>플레이잇7</p>
                    </div>
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
                    <div class="swiper-slide">
                        <a href="">
                            <img src="./resourse/AdobeStock_600875580-1024x683.jpg" alt="">
                        </a>
                        <p>플레이잇1</p>
                    </div>
                    <div class="swiper-slide">
                        <a href="">
                            <img src="./resourse/shutterstock_2006673803-scaled.jpg" alt="">
                        </a>
                        <p>플레이잇2</p>
                    </div>
                    <div class="swiper-slide">
                        <a href="">
                            <img src="./resourse/play&eat.png" alt="">
                        </a>
                        <p>플레이잇3</p>
                    </div>
                    <div class="swiper-slide">
                        <a href="">
                            <img src="./resourse/play&eat.png" alt="">
                        </a>
                        <p>플레이잇4</p>
                    </div>
                    <div class="swiper-slide">
                        <a href="">
                            <img src="./resourse/play&eat.png" alt="">
                        </a>
                        <p>플레이잇5</p>
                    </div>
                    <div class="swiper-slide">
                        <a href="">
                            <img src="./resourse/play&eat.png" alt="">
                        </a>
                        <p>플레이잇6</p>
                    </div>
                    <div class="swiper-slide">
                        <a href="">
                            <img src="./resourse/play&eat.png" alt="">
                        </a>
                        <p>플레이잇7</p>
                    </div>
                    <div class="swiper-slide">
                        <a href="">
                            <img src="./resourse/play&eat.png" alt="">
                        </a>
                        <p>플레이잇7</p>
                    </div>
                    <div class="swiper-slide">
                        <a href="">
                            <img src="./resourse/play&eat.png" alt="">
                        </a>
                        <p>플레이잇7</p>
                    </div>
                    <div class="swiper-slide">
                        <a href="">
                            <img src="./resourse/play&eat.png" alt="">
                        </a>
                        <p>플레이잇7</p>
                    </div>
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
    
    
</body>
</html>
	
</body>
</html>