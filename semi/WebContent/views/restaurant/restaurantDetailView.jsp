
<%@page import="java.util.List"%>

<%@page import="semi.Review.model.vo.Attachment2"%>

<%@page import="semi.Review.model.vo.Review"%>
<%@page import="semi.play.model.vo.PlayReply"%>
<%@page import="semi.cooking.model.vo.Attachment"%>
<%@page import="java.util.ArrayList"%>
<%@page import="semi.play.model.vo.Play"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%
	Play p = (Play)request.getAttribute("p");
	// 글번호, 글제목, 주소, 전화번호, 별점, 운영시간, 테마카테고리
	ArrayList<Attachment> list = (ArrayList<Attachment>)request.getAttribute("list");
	
	// 파일번호, 원본명, 수정명, 파일경로
	ArrayList<PlayReply> replyList = (ArrayList<PlayReply>)request.getAttribute("replyList");
	ArrayList<Review> r = (ArrayList<Review>)request.getAttribute("r");
	ArrayList<Play> recentRestaurant = (ArrayList<Play>)request.getAttribute("recentRestaurant");

	
	
	 String placeTitle = p.getPlaceTitle();
	    String titleImg = list.get(0).getFilePath() + list.get(0).getOriginName();
	    int placeNo =  p.getPlaceNo();
	    
	    // 새로운 Place 객체 생성
	    Play play = new Play(placeNo, placeTitle, titleImg );
	    
	    List<Play> recentPlaces = (List<Play>) session.getAttribute("recentPlaces");

	    if (recentPlaces == null) {
	        recentPlaces = new ArrayList<>();
	    }

	    // 리스트에 동일한 이름을 가진 장소가 있는지 확인
	    boolean alreadyExists = false;
	    for (Play existingPlay : recentPlaces) {
	        if (existingPlay.getPlaceTitle().equals(play.getPlaceTitle())) {
	            alreadyExists = true;
	            break;
	        }
	    }

	    // 동일한 이름의 장소가 없다면 추가
	    if (!alreadyExists) {
	        // 리스트 크기가 3개 이상이면, 가장 오래된 항목을 제거
	        if (recentPlaces.size() >= 3) {
	            recentPlaces.remove(0);
	        }

	        recentPlaces.add(play);
	    }

	    // 리스트를 세션에 저장
	    session.setAttribute("recentPlaces", recentPlaces);
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>식당</title>
    <style>
      footer .inner {
        display: block;
        height: 100px;
        font-size: 15px;
        padding: 20px 0 20px 0;
        width: 100%;
        height: 80px;
      }

      footer .menu {
        list-style-type: none;
        display: flex;
        justify-content: center;
      }

      footer .menu li {
        position: relative;
      }

      footer .menu li::before {
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
      footer .menu li:last-child::before {
        display: none;
      }

      footer .menu li a {
        font-size: 12px;
        padding: 5px 15px;
        display: block;
      }

      footer .inner .info {
        list-style-type: none;
        padding: 0;
        margin: auto;
        display: flex;
        justify-content: center;
        align-items: center;
      }

      footer .info span {
        margin-right: 20px;
        font-size: 12px;
      }

      footer .info span:last-child {
        margin-right: 0;
      }

      footer .inner .info .copyright {
        display: flex;
        align-items: center;
      }
    </style>

    <link rel="stylesheet" href="/semi/resources/css/restaurant.css?after">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="https://unpkg.com/swiper@6.8.4/swiper-bundle.min.css" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <link rel="stylesheet"href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css"/>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

	<script type="text/javascript" src="https://oapi.map.naver.com/openapi/v3/maps.js?ncpClientId=lm9hxz6gtq&submodules=geocoder"></script>
    <script src="https://unpkg.com/swiper@6.8.4/swiper-bundle.min.js"></script>
    
    <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	
	<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.7.2/kakao.min.js"
		integrity="sha384-TiCUE00h649CAMonG018J2ujOgDKW/kVWlChEuu4jK2vxfAAD0eZxzCKakxg55G4"
		crossorigin="anonymous"></script>
	<script>
		Kakao.init('380af2edeb82dfbf591425877a112ec6'); // 사용하려는 앱의 JavaScript 키 입력
	</script>

</head>
  <body>
    <%@ include file="../common/menubar.jsp" %>

    <%@include file="../common/badge.jsp" %>

    <!-- 상세 -->
    <div class="info-box">
      <div class="swiper">
        <div class="swiper-wrapper">
		<%for (Attachment at : list) {%>
		<div class="swiper-slide">
			<img src="<%=at.getFilePath() + at.getOriginName()%>" alt="">
		</div>
		<% } %>
	</div>
      </div>
      <!-- <div class="swiper-pagination"></div>     -->
	<div class="total-area">	
      <div class="info">
        <div class="info2">
        <div class="info-title">
          <h2><%= p.getPlaceTitle() %></h2>
          <div class="info-btn">
            <div class="material-icons like" onclick="insertLikeList()">thumb_up</div>
            <button type="button" class="modal_btn">
              <div class="material-icons share modal_btn">share</div>
            </button>
          </div>

          <div class="modal">
            <div class="modal_popup">
              <h3>공유하기</h3>
              <div class="share">
                <span>
					<script type="text/javascript" src="https://ssl.pstatic.net/share/js/naver_sharebutton.js"></script>
					<script type="text/javascript">
					new ShareNaver.makeButton({"type": "d"});
					</script>
				</span> 
				<a id="kakaotalk-sharing-btn" href="javascript:;"> <img
					src="https://developers.kakao.com/assets/img/about/logos/kakaotalksharing/kakaotalk_sharing_btn_medium.png"
					alt="카카오톡 공유 보내기 버튼" />
				</a>
			 </div>
              <button type="button" class="close_btn">닫기</button>
            </div>
          </div>
          </div>
        </div>
        <table>
          <tr>
            <th>별점</th>
            <td><div class="material-icons score">star</div><div class="Rscore"><%= p.getScore() %></div></td>
          </tr>
          <tr>
            <th>위치</th>
            <td><%= p.getAddress() %></td>
          </tr>
          <tr>
            <th>영업시간</th>
            <% if(p.getBusinessTime() == null){ %>
            	<td>등록되지 않았습니다.</td>
            <% }else{ %>
            	<td><%= p.getBusinessTime() %></td>
            <% } %>
          </tr>
          <tr>
            <th>전화번호</th>
            <td><%= p.getPlaceCall() %></td>
          </tr>
        </table>
      </div>
      <script type="text/javascript" src="https://oapi.map.naver.com/openapi/v3/maps.js?ncpClientId=lm9hxz6gtq"></script>
	  <div id="map" style="width:380px;height:322px; margin-top: 60px;"></div>
    </div>
	</div>
    <!-- 비슷한 클래스 -->

    <div class="recommend">
      <section class="main-slide">
        <div class="inner">
          <div class="title">최신 음식</div>
          <div class="swiper-container">
            <div class="swiper-wrapper">
            <% for(Play rp : recentRestaurant){ %>
              <div class="swiper-slide">
                <a href="<%= contextPath %>/restaurantDetail.pl?placeNo=<%= rp.getPlaceNo() %>">
                   <img src="<%= rp.getTitleImg() %>" alt="">
                </a>
                <p><%= rp.getPlaceTitle() %></p>
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
    </div>

    <!-- 리뷰 -->

    <div class="review">
      <div class="r-btn">
        <h2>리뷰</h2>
        <% if(loginUser == null) {%>
            <% }else { %>
        <form action="reviewEnroll.pl" method="get">
        <div>
        	<input type="hidden" name="placeNo" value="<%= p.getPlaceNo() %>">
        	<input type="hidden" name="rTitle" value="<%= p.getPlaceTitle() %>">
        	<input type="hidden" name="userNo" value="<%= loginUser.getUserNo() %>">
          	<input type="submit" value="리뷰작성" id="review-btn" />
        </div>
        </form>
        <% } %>
      </div>
		  <%  
            for (int i = 0; i < r.size(); i++) { 
                Review review = r.get(i);
          %>	
      <table align="center" class="review-content">
        <tr>
          <th rowspan="2" style="width: 200px" id="profile">
            <div id="profile-img"><img src="" alt="" /></div>
            <% if(r.get(i).getNickName() != null){ %>
            	<div id="profile-id"><%= r.get(i).getNickName() %></div>
            <% }else{ %>
            	<div id="profile-id"><%= r.get(i).getUserName() %></div>
            <% } %>
	            <div id="profile-score"><div class="material-icons score">star </div><%= r.get(i).getScore() %></div>
	            <div id="profile-date"><%= r.get(i).getrDate() %></div>
            
            <form action="updateForm.re" style="border: none;">
            <% if (loginUser != null && String.valueOf(loginUser.getUserNo()).equals(String.valueOf(r.get(i).getUserNo()))) { %>
            <div id="profile-update">
              <a href="<%= contextPath %>/updateForm.re?rNo=<%= r.get(i).getrNo() %>&placeNo=<%= p.getPlaceNo() %>">수정 </a>/
              <a href="<%= contextPath %>/deleteReview.re?rNo=<%= r.get(i).getrNo() %>&placeNo=<%= p.getPlaceNo() %>">삭제</a>
            </div>
            <% } %>
            </form>
            <input type="submit" onclick='report(<%= r.get(i).getUserNo() %>, <%= r.get(i).getrNo() %>);' value="리뷰신고" id="report-btn" />
          </th>
          <td colspan="2" rowspan="2" style="width: 500px" id="review-img">
            <img src="<%= contextPath %><%= r.get(i).getTitleImg() %>" alt="" />
          </td>
        </tr>
        <tr></tr>
        <tr>
          <td colspan="2" style="height: 300px">
            <p style="width: 95%; height: 290px"><%= r.get(i).getrContent() %></p>
          </td>
        </tr>
      </table>
		<% } %>
      <% if (!r.isEmpty()) { %>
       <button class="add-list">검색 결과 더보기</button>
   	  <% } %>
    </div>

    <button id="top-btn">
      ▲ <br />
      TOP
    </button>
  </body>

  <script>
  
  $(function(){
	  scoreAvg();
  })
  

    const swiper = new Swiper(".swiper", {
      // Optional parameters
      direction: "horizontal",
      loop: true,

      // If we need pagination
      pagination: {
        el: ".swiper-pagination",
      },

      // Navigation arrows
      navigation: {
        nextEl: ".swiper-button-next",
        prevEl: ".swiper-button-prev",
      },

      // And if we need scrollbar
      scrollbar: {
        el: ".swiper-scrollbar",
      },
    });

    var swiper1 = new Swiper(".recommend .mySwiper", {
      slidesPerView: 3,
      spaceBetween: 30,
      loop: true,
      pagination: {
        el: ".swiper-pagination",
        clickable: true,
      },
      navigation: {
        nextEl: ".swiper-button-next",
        prevEl: ".swiper-button-prev",
      },
    });

    // MODAL
    const modal = document.querySelector(".modal");
    const modalOpen = document.querySelector(".modal_btn");
    const modalClose = document.querySelector(".close_btn");

    //열기 버튼을 눌렀을 때 모달팝업이 열림
    modalOpen.addEventListener("click", function () {
      //'on' class 추가
      modal.classList.add("on");
    });
    //닫기 버튼을 눌렀을 때 모달팝업이 닫힘
    modalClose.addEventListener("click", function () {
      //'on' class 제거
      modal.classList.remove("on");
    });

    // 탑버튼
    $(document).ready(function () {
      // Top 버튼 특정 스크롤높이에서만 보이기 / 숨기기
      $(window).scroll(function () {
        if ($(this).scrollTop() > 100) {
          $("#top-btn").fadeIn();
        } else {
          $("#top-btn").fadeOut();
        }
      });

      // Top 버튼 클릭시 페이지 상단으로 이동
      $("#top-btn").click(function () {
        $("html, body").animate({ scrollTop: 0 }, 800);
        return false;
      });
    });

    new Swiper(".main-slide .swiper-container", {
      slidesPerView: 4, // 한번에 보여줄 슬라이드 개수
      spaceBetween: 10, // 슬라이드 사이 여백
      // 1번 슬라이드가 가운데 보이기
      loop: true,
      // autoplay: {
      //     delay : 5000,
      // },
      pagination: {
        el: ".main-slide .swiper-pagination", // 페이지 번호 요소 선택자
        clickable: true, // 사용자의 페이지 번호 요소 제어 가능 여부
      },
      navigation: {
        prevEl: ".main-slide .swiper-prev",
        nextEl: ".main-slide .swiper-next",
      },
    });

    // 더보기 버튼
    $(function () {
      $(".review .review-content").slice(0, 4).show(); // select the first 4
      $(".add-list").click(function (e) {
        // click event for load more
        e.preventDefault();
        $(".review .review-content:hidden").slice(0, 4).show(); // select next 4 hidden divs and show them
        if ($(".review .review-content:hidden").length == 0) {
          // check if any hidden divs still exist
          // alert("No more divs"); // alert if there are none left
          $(".add-list").hide();
        }
      });
    });
    
    function insertReview(){
        location.href = "<%= contextPath %>/reviewEnroll.pl";
    }
    
    // 카카오 공유
    Kakao.Share.createDefaultButton({
    container: '#kakaotalk-sharing-btn',
    objectType: 'feed',
    content: {
      title: '<%= p.getPlaceTitle() %>',
      description: '<%= p.getAddress() %>',
      imageUrl:
        '<%= p.getTitleImg() %>',
      link: {
        // [내 애플리케이션] > [플랫폼] 에서 등록한 사이트 도메인과 일치해야 함
        mobileWebUrl: 'http://localhost:8002',
        webUrl: 'http://localhost:8002',
      },
    },
    social: {
      likeCount: 286,
      commentCount: 45,
      sharedCount: 845,
    },
    buttons: [
      {
        title: '웹으로 보기',
        link: {
          mobileWebUrl: 'https://developers.kakao.com',
          webUrl: 'https://developers.kakao.com',
        },
      },
      {
        title: '앱으로 보기',
        link: {
          mobileWebUrl: 'https://developers.kakao.com',
          webUrl: 'https://developers.kakao.com',
        },
      },
    ],
  });
    
    
 // 네이버 지도
    function initMap(lat, lng) {
     var mapOptions = {
       center: new naver.maps.LatLng(lat, lng), // Center the map on the user's location
       zoom: 17, // Zoom level
       minZoom: 10, // Minimum zoom level
       zoomControl: false, // Display zoom control
       mapTypeControl: false // Display map type control
     };
  
     // Create the map
     var map = new naver.maps.Map('map', mapOptions);
    

     // Add a marker at the user's location
      var marker = new naver.maps.Marker({
         position: new naver.maps.LatLng(lat, lng),
         map: map,
         icon:{
            content:"<div style='border: 3px solid #8b7dbe;min-width:150px;height:32px; color:#333; text-align:center; border-radius:25px; background:#e4d4fa;padding:3px;line-height:35px;' >"+ '<%= p.getPlaceTitle() %>' +"<div style='border: 1px solid #8b7dbe;width: .1px;height: 45px;margin:auto;background:#8b7dbe'></div></div>",
           size: new naver.maps.Size(155, 95),
         }

       
     });
     
      }
 
   // Function to get the user's current location
   function showCurrentLocation() {
     if (navigator.geolocation) {
       // Get the current position
              naver.maps.Service.geocode({
         query: '<%= p.getAddress() %>'
     }, function(status, response) {
         if (status !== naver.maps.Service.Status.OK) {
             return alert('Something wrong!');
         }

         var result = response.v2, // 검색 결과의 컨테이너
             items = result.addresses; // 검색 결과의 배열

         // do Something
         var lat = items[0].y; // User's latitude
         var lng = items[0].x; // User's longitude
         
         // Initialize the map with the user's current location
         initMap(lat, lng);
     }, function(error) {
         // Handle errors, such as location access denial
         console.error("Error getting location: ", error);
 
         // Use a default location if the user denies location access
         initMap(37.3595704, 127.105399); // Default coordinates (e.g., Pangyo Techno Valley)
       });
     } else {
       // Geolocation is not supported by the browser
       alert("Geolocation is not supported by your browser.");
       // Initialize the map with a default location
       initMap(37.3595704, 127.105399);
     }
   }
 
   // Call the function to show the user's current location when the page loads
   showCurrentLocation();
   
   function scoreAvg(){
   	$.ajax({
   		url:"ajaxScore.re",
   		data:{placeNo:"<%= p.getPlaceNo() %>"},
   		success:function(result){
   			console.log(result);
   			if(result !== null){
   				$(".Rscore").text(result);
   			}
   		},
   		error:function(){
   			
   		},
   	})
   }
   
   // 신고하기
   <% if(loginUser != null){ %>
    function report(reviewerUserNo, reviewNo) {
        if (confirm("정말로 신고하시겠습니까?")) {
            $.ajax({
                url: "report.re",
                type: "POST",
                data: { userNo: reviewerUserNo,
                		reviewNo: reviewNo},
                success: function(response) {
                    if (response.trim() === "success") {
                        alert("신고가 접수되었습니다.");
                    } else {
                        alert("신고 접수에 실패했습니다. 다시 시도해주세요.");
                    }
                },
                error: function() {
                    alert("오류가 발생했습니다. 다시 시도해주세요.");
                }
            });
        }
	    }
	<% } else { %>
	    function report() {
	        alert("로그인 후 이용 가능합니다.");
	    }
	<% } %>
	
	// 좋아요 버튼
	function likeStatus(){
            	$.ajax({
            		url:"likeStatus.pl",
            		data:{
            			bno:"<%= p.getPlaceNo() %>",
            			userNo:$("#userNo").val(),
            		},
            		success:function(result){
            			if(result > 0){
            				$(".like").css("color", "#8b7dbe");
            			}else{
            				$(".like").css("color", "#e4d4fa");
            			}
            		},
            		error:function(){
            			console.log("실패")
            		}
            	})
            }
	
	function insertLikeList(){
    	$.ajax({
    		 url : "changeLike.pl",
         data:{bno:<%= p.getPlaceNo() %>,
             	  userNo : $("input[type=hidden]").val()},
             success:function(){
 					$(".like").css("color","#8b7dbe");
 					likeStatus();                		 
             },
             error:function(){
             	console.log("통신 실패");
             },
    	})
    }
  </script>
</html>
