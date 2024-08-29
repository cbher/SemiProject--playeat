<%@page import="semi.play.model.service.PlayService"%>
<%@page import="semi.play.model.vo.Play"%>
<%@page import="semi.ranking.model.service.RankingService"%>
<%@page import="semi.ranking.model.vo.Ranking"%>
<%@page import="semi.restaurant.model.dao.RestaurantDao"%>
<%@page import="semi.restaurant.model.service.RestaurantService"%>
<%@page import="semi.restaurant.model.vo.Restaurant"%>
<%@page import="semi.cooking.model.vo.CookingBoard"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%

	RestaurantService restService = new RestaurantService();
	ArrayList<Restaurant> list = restService.mainPageSelectRestaurnt();
	
	ArrayList<Play> playList = new PlayService().selectPlayList();
	
	RankingService ranService = new RankingService();
	ArrayList<Ranking> rankList = ranService.selectTop3();
	Ranking rank1 = rankList.get(0); // 첫 번째 항목
	Ranking rank2 = rankList.get(1); // 두 번째 항목
	Ranking rank3 = rankList.get(2); // 세 번째 항목


%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
    margin-top: 220px;
    
}
.main-slide .swiper-container {
    width: 60%;                 /* 전체 화면 너비 */
    height: 100%;               /* 원하는 높이 설정 */
    display: flex;
    justify-content: center;     /* 중앙 정렬 */
    align-items: center;         /* 중앙 정렬 */
  }
  
.main-slide .swiper-slide {
    display: flex;
    justify-content: center;
    align-items: center;
    width: auto;                 /* 슬라이드 너비 자동 설정 */
    height: 70%;                /* 컨테이너 높이에 맞춤 */
    
  }
  
.main-slide .swiper-slide img {
	/* position: absolute; */
	justify-content: center;
    align-items: center;
    margin: auto;
    width: 720px;
    height: 600px;
    max-width: 60%;          /*  이미지가 슬라이드 안에서 넘치지 않도록 */
    max-height: 100%;
    border-radius: 25px;         /* 이미지에 둥근 모서리 적용 */
  }

.main-slide .swiper-slide p{
	text-align: center;
}

.main-slide .swiper-slide a{
  color: inherit;  /* 링크의 색상 제거 */

}


.play-slide{
    display: block;
    /* margin: 100px; */
    position: absolute;
    top: 760px;
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
   <%@ include file="views/common/menubar.jsp" %>
   <%@ include file="views/common/badge.jsp" %>
   
   
   
   <!--main-->
    <section class="main-slide">
      <div class="inner">
        
          <div class="swiper-container">
              <div class="swiper-wrapper">
                  <div class="swiper-slide">
                   <a target="_blank" href="https://korean.visitkorea.or.kr/kfes/detail/fstvlDetail.do?cmsCntntsId=2755115" >
                     <img src="./resources/main_upfiles/19cc361a-c05f-4763-bdde-4158eba088e2_3.jpg" alt="">
                   	 <p>고양시 축제</p>
                   </a>
                   </div>
                  <div class="swiper-slide">
                      <a target="_blank" href="https://www.accf.or.kr/main/event/musicsociety2024">
                          <img src="./resources/main_upfiles/motion_poster.gif" alt="">
                       <p>월드뮤직페스티벌 2024</p>
                      </a>
                    </div>
                  <div class="swiper-slide">
                      <a target="_blank" href="https://www.sejongpac.or.kr/portal/bbs/B0000057/view.do?nttId=48114&bbsId=B0000057&menuNo=200502">
                          <img src="./resources/main_upfiles/8be85dd0-3223-4e21-9cf8-57b3b429db66_3.jpg" alt="">
                     	 <p>세종썸머페스티벌</p>
                      </a>
                  </div>
                  <div class="swiper-slide">
                      <a target="_blank" href="https://blog.naver.com/981jeju/223249501930">
                          <img src="./resources/main_upfiles/220371a8-ec85-46b7-8bb0-30afa9a93a19_3.png" alt="">
                           <p>구팔일댕댕이라이딩</p>
                      </a>
                  </div>
                  <div class="swiper-slide">
                      <a target="_blank" href="https://ges.seoul.kr/">
                          <img src="./resources/main_upfiles/7dda978f-bd69-46f6-b31c-6e1e318249f5_3.jpg" alt="">
                           <p>서울 E-sport 축제</p>
                      </a>
                 </div>
                  
              </div>
              <!-- If we need pagination -->
              <div class="swiper-scrollbar"></div>
             
          </div>
           
        </div>
     
  </section>







    <section class="play-slide">
      <div class="inner">
          <div class="title" align="center">놀거리</div>
          <div class="swiper-container">
              <div class="swiper-wrapper">
              	<% for(Play p : playList){ %>
                  <div class="swiper-slide">
                      <a href="<%= contextPath %>/detail.pl?bno=<%= p.getPlaceNo() %>">
                          <img src="<%= p.getTitleImg() %>" alt="">
                      </a>
                      <p><%= p.getPlaceTitle() %></p>
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


    <!--food-->
    <section class="food-slide">
      <div class="inner">
          <div class="title" align="center">먹거리</div>
          <div class="swiper-container">
              <div class="swiper-wrapper">
              <% for(Restaurant restaurant : list) { %>
				    <div class="swiper-slide">
				        <a href="">
				            <img src="<%= restaurant.getTitleImg()%>" alt="">
				        </a>
				        <p><%= restaurant.getPlaceTitle()%></p>
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
   
   
   
    <!-- 명예의전당 -->
 <div class="inner fame-area">
    <span id="title">명예의 전당</span>
   
    <div id="fame-1">
       	<a href="<%= contextPath %>/detail.co?bno=<%= rankList.get(0).getcNO() %>">
            <img src="<%= rankList.get(0).getTitleImg() %>" alt="">
        </a>
    </div>
    <div id="fame-2">
       	<a href="<%= contextPath %>/detail.co?bno=<%= rankList.get(1).getcNO() %>">
            <img src="<%= rankList.get(1).getTitleImg() %>" alt="">
        </a>
    </div>
    <div id="fame-3">
        <a href="<%= contextPath %>/detail.co?bno=<%= rankList.get(2).getcNO() %>">
            <img src="<%= rankList.get(2).getTitleImg() %>" alt="">
        </a>
    </div>
    <%if(rankList.get(0).getNickName() != null) {%>
    <div class="fame-name" id="fame-1-name">
    	<a href="<%= contextPath %>/detail.co?bno=<%= rankList.get(0).getcNO() %>"><%= rankList.get(0).getNickName() %></a>
    </div>
    <%}else{ %>
    <div class="fame-name" id="fame-1-name">
    	<a href="<%= contextPath %>/detail.co?bno=<%= rankList.get(0).getcNO() %>"><%= rankList.get(0).getUserName() %></a>
    </div>
    	
    <%} %>
  	<%if(rankList.get(1).getNickName() != null) {%>
    <div class="fame-name" id="fame-2-name">
    	<a href="<%= contextPath %>/detail.co?bno=<%= rankList.get(1).getcNO() %>"><%= rankList.get(1).getNickName() %></a>
    </div>
    <%}else{ %>
    <div class="fame-name" id="fame-2-name">
    	<a href="<%= contextPath %>/detail.co?bno=<%= rankList.get(1).getcNO() %>"><%= rankList.get(1).getUserName() %></a>
    </div>
    	
    <%} %>
   <%if(rankList.get(2).getNickName() != null) {%>
    <div class="fame-name" id="fame-3-name">
    	<a href="<%= contextPath %>/detail.co?bno=<%= rankList.get(2).getcNO() %>"><%= rankList.get(2).getNickName() %></a>
    </div>
    <%}else{ %>
    <div class="fame-name" id="fame-3-name">
    	<a href="<%= contextPath %>/detail.co?bno=<%= rankList.get(2).getcNO() %>"><%= rankList.get(2).getUserName() %></a>
    </div>
    	
    <%} %>
 </div>
   
   
   
   
   
   
   
   
   
   
   
   <script>
   
    document.addEventListener('DOMContentLoaded', function() {
    let playSwiper = new Swiper('.play-slide .swiper-container',{
          slidesPerView: 4, // 한번에 보여줄 슬라이드 개수
          spaceBetween: 10, // 슬라이드 사이 여백
          // 1번 슬라이드가 가운데 보이기
          loop:false,
          // autoplay: {
          //     delay : 5000,
          // },
          pagination:{
              el : '.play-slide .swiper-pagination', // 페이지 번호 요소 선택자
              clickable : true, // 사용자의 페이지 번호 요소 제어 가능 여부

          },
          navigation : {
              prevEl : '.play-slide .swiper-prev',
              nextEl : '.play-slide .swiper-next',
          }

        });

        let foodSwiper = new Swiper('.food-slide .swiper-container',{
          slidesPerView: 4, // 한번에 보여줄 슬라이드 개수
          spaceBetween: 10, // 슬라이드 사이 여백
          // 1번 슬라이드가 가운데 보이기
          loop:false,
          // autoplay: {
          //     delay : 5000,
          // },
          pagination:{
              el : '.food-slide .swiper-pagination', // 페이지 번호 요소 선택자
              clickable : true, // 사용자의 페이지 번호 요소 제어 가능 여부

          },
          navigation : {
              prevEl : '.food-slide .swiper-prev',
              nextEl : '.food-slide .swiper-next',
          }

        });

        let mainSwiper = new Swiper('.main-slide .swiper-container',{
          slidesPerView: 1, // 한번에 보여줄 슬라이드 개수
          spaceBetween: 20, // 슬라이드 사이 여백
          centeredSlides: true,
          // 1번 슬라이드가 가운데 보이기
          loop:true,
          autoplay: {
              delay: 4000,             // 슬라이드가 3초마다 자동 전환
              disableOnInteraction: false, // 사용자 상호작용 후에도 자동 전환 유지
            },
          // pagination:{
          //     el : '.main-slide .swiper-pagination', // 페이지 번호 요소 선택자
          //     clickable : true, // 사용자의 페이지 번호 요소 제어 가능 여부

          // },
          scrollbar: {
            el: '.main-slide .swiper-scrollbar',
            draggable: true,
            },
        });

      });
   
   </script>
   

<script>
  
</script>
   
   
   
   
   <%@ include file="views/common/footer.jsp" %>
   <%@ include file="views/common/top.jsp" %>
</body>
</html>