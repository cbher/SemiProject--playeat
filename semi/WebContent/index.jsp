<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  
<!-- swiper-->

<link rel="stylesheet" href="https://unpkg.com/swiper@6.8.4/swiper-bundle.min.css" />
<script src="https://unpkg.com/swiper@6.8.4/swiper-bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>


<!-- meterial-->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.5/gsap.min.js" integrity="sha512-7eHRwcbYkK4d9g/6tD/mhkf++eoTHwpNM9woBxtPUBWm67zeAfFC+HrdoE2GanKeocly/VxeLvIqwvCdk7qScg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/lodash.js/4.17.21/lodash.min.js" integrity="sha512-WFN04846sdKMIP5LKNphMaWzU7YpMyCU245etK3g/2ARYbPK9Ub18eG+ljU96qKRCWh+quCY7yefSmlkQw1ANQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<!-- gsap -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.5/gsap.min.js" integrity="sha512-7eHRwcbYkK4d9g/6tD/mhkf++eoTHwpNM9woBxtPUBWm67zeAfFC+HrdoE2GanKeocly/VxeLvIqwvCdk7qScg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>


<style>
.main-slide{
    margin-top: 180px;
    border: 1px solid #e4d4fa;
}
.main-slide .swiper-container {
    width: 60%;                 /* 전체 화면 너비 */
    height: 600px;               /* 원하는 높이 설정 */
    display: flex;
    justify-content: center;     /* 중앙 정렬 */
    align-items: center;         /* 중앙 정렬 */
  }
  
.main-slide .swiper-slide {
    display: flex;
    justify-content: center;
    align-items: center;
    width: auto;                 /* 슬라이드 너비 자동 설정 */
    height: 100%;                /* 컨테이너 높이에 맞춤 */
  }
  
.main-slide .swiper-slide img {
    max-width: 100%;             /* 이미지가 슬라이드 안에서 넘치지 않도록 */
    max-height: 100%;
    border-radius: 25px;         /* 이미지에 둥근 모서리 적용 */
  }
  


.play-slide{
    display: block;
    /* margin: 100px; */
    position: absolute;
    top: 720px;
    left: 0;
    right: 0;
    box-sizing: border-box;

    margin-top: 120px;

    
}

.play-slide .inner{
    border: 3px solid #e4d4fa;
    border-radius: 25px;
    box-sizing: border-box;
    height: 400px;
}

.play-slide .inner .title{
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


.play-slide .inner .swiper-prev{
    cursor: pointer;
    position: absolute;
    left: -50px;
    top: 180px;
    border: 3px solid #e4d4fa;
    display: flex;
    border-radius: 100%;
    
}

.play-slide .inner .swiper-prev .material-icons,
.play-slide .inner .swiper-next .material-icons{
    
    font-size: 35px;
    color: #e4d4fa;
}


.play-slide .inner .swiper-next{
    cursor: pointer;
    position: absolute;
    right: -50px;
    top: 180px;
    border: 3px solid #e4d4fa;
    display: flex;
    border-radius: 100%;
}



.play-slide .inner .swiper-container .swiper-wrapper{
    display: flex;
    
    
    border-bottom-left-radius: 25px;
    border-bottom-right-radius: 25px;

}

.play-slide .inner .swiper-container .swiper-wrapper .swiper-slide{
    
    
    border-radius: 25px;
    
}

.play-slide .inner .swiper-container .swiper-wrapper .swiper-slide p{
    text-align: left;
    font-weight: 700;
    padding-left: 20px;
    color: #333;
    
}

.play-slide .inner .swiper-container .swiper-wrapper .swiper-slide a img{
    width: 250px;
    height: 250px;
    margin: 10px;
    border-radius: 25px;
    
}

.food-slide{
  
    display: block;
    position: absolute;
    top: 1220px;
    left: 0;
    right: 0;
    box-sizing: border-box;
    margin-top: 120px;
}

.food-slide .inner{
    border: 3px solid #e4d4fa;
    border-radius: 25px;
    box-sizing: border-box;
    height: 400px;
}

.food-slide .inner .title{
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

.food-slide .inner .swiper-prev{
    cursor: pointer;
    position: absolute;
    left: -50px;
    top: 180px;
    border: 3px solid #e4d4fa;
    display: flex;
    border-radius: 100%;   
}

.food-slide .inner .swiper-prev .material-icons,
.food-slide .inner .swiper-next .material-icons{  
    font-size: 35px;
    color: #e4d4fa;
}

.food-slide .inner .swiper-next{
    cursor: pointer;
    position: absolute;
    right: -50px;
    top: 180px;
    border: 3px solid #e4d4fa;
    display: flex;
    border-radius: 100%;
}

.food-slide .inner .swiper-container .swiper-wrapper{
    display: flex;  
    border-bottom-left-radius: 25px;
    border-bottom-right-radius: 25px;
}

.food-slide .inner .swiper-container .swiper-wrapper .swiper-slide{
    border-radius: 25px; 
}

.food-slide .inner .swiper-container .swiper-wrapper .swiper-slide p{
    text-align: left;
    font-weight: 700;
    padding-left: 20px;
    color: #333;   
}

.food-slide .inner .swiper-container .swiper-wrapper .swiper-slide a img{
    width: 250px;
    height: 250px;
    margin: 10px;
    border-radius: 25px;    
}

.fame-area{
    position: absolute;
    top: 1100px;
    left: 0;
    margin: auto;
    justify-content: center;
    align-items: center;
    width: 1100px;
    background-image: url(./resources/backGroundImg/명전_뒷배경\ \(1\).png);
    height: 800px;
    border-radius: 12px;
}

.fame-area #title{
    text-align: center;
    position: absolute;
    top: 0;
    left: 46%;
}

.fame-area img{
    position: absolute;
    border-radius: 20px;
    border: 3px solid #e4d4fa;
}

.fame-area .fame-name a{
    position: absolute;
    border-radius: 20px;
    font-size: 24px;
    font-weight: 700; 
    color: #e4d4fa;
}


.fame-area #fame-1 img{
    width: 120px;
    height: 120px;
    top: 37%;
    left: 44.8%;
}
.fame-area #fame-2 img{
    width: 100px;
    height: 100px;
    top: 55%;
    right: 23%;

}
.fame-area #fame-3 img{
    width: 100px;
    height: 100px;
    top: 60%;
    left: 20%;
}

.fame-area #fame-1-name a{
    top: 75%;
    left: 48%;
    color: #8b7dbe; 
}
.fame-area #fame-2-name a{
    top: 85%;
    right: 25%;
    color: black;
}
.fame-area #fame-3-name a{
    top: 89%;
    left: 22%;
}


</style>


</head>
<body>
	


	<% response.sendRedirect("mypage.myreview");%>






</body>
</html>