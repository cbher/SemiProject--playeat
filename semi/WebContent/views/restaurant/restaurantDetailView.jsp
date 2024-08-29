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

    <link rel="stylesheet" href="/semi/resources/css/restaurant.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="https://unpkg.com/swiper@6.8.4/swiper-bundle.min.css" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <link rel="stylesheet"href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css"/>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

	<script type="text/javascript" src="https://oapi.map.naver.com/openapi/v3/maps.js?ncpClientId=i61mpeml1v&submodules=geocoder"></script>
    <script src="https://unpkg.com/swiper@6.8.4/swiper-bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>

  </head>
  <body>
    <%@ include file="../common/menubar.jsp" %>

    <div class="badge">
      <div class="text">최근 본 장소</div>
      <a href="javascript:void(0)" class="place">
        <img src="./resourse/음식.jpg" alt="" />
        <div class="badge-title">
          <h2>여긴어디야</h2>
        </div>
      </a>
      <a href="javascript:void(0)" class="place">
        <img src="./resourse/음식2.jpg" alt="" />
        <div class="badge-title">
          <h2>여긴어디야</h2>
        </div>
      </a>
      <a href="javascript:void(0)" class="place">
        <img src="./resourse/음식2.jpg" alt="" />
        <div class="badge-title">
          <h2>여긴어디야</h2>
        </div>
      </a>
    </div>

    <!-- 상세 -->
    <div class="info-box">
      <div class="swiper">
        <div class="swiper-wrapper">
          <div class="swiper-slide">
            <img src="<%=p.getTitleImg() %>" alt="" />
          </div>
          <div class="swiper-slide">
            <img src="<%=p.getTitleImg() %>" alt="" />
          </div>
          <div class="swiper-slide">
            <img src="<%=p.getTitleImg() %>" alt="" />
          </div>
          <div class="swiper-slide">
            <img src="<%=p.getTitleImg() %>" alt="" />
          </div>
          <div class="swiper-slide">
            <img src="<%=p.getTitleImg() %>" alt="" />
          </div>
        </div>
      </div>
      <!-- <div class="swiper-pagination"></div>     -->
	<div class="total-area">	
      <div class="info">
        <div class="info2">
        <div class="info-title">
          <h2><%= p.getPlaceTitle() %></h2>
          <div class="info-btn">
            <a href="" id="like">
              <svg
                xmlns="http://www.w3.org/2000/svg"
                width="30"
                height="30"
                fill="#e4d4fa"
                class="bi bi-hand-thumbs-up-fill"
                viewBox="0 0 16 16"
              >
                <path
                  d="M6.956 1.745C7.021.81 7.908.087 8.864.325l.261.066c.463.116.874.456 1.012.965.22.816.533 2.511.062 4.51a10 10 0 0 1 .443-.051c.713-.065 1.669-.072 2.516.21.518.173.994.681 1.2 1.273.184.532.16 1.162-.234 1.733q.086.18.138.363c.077.27.113.567.113.856s-.036.586-.113.856c-.039.135-.09.273-.16.404.169.387.107.819-.003 1.148a3.2 3.2 0 0 1-.488.901c.054.152.076.312.076.465 0 .305-.089.625-.253.912C13.1 15.522 12.437 16 11.5 16H8c-.605 0-1.07-.081-1.466-.218a4.8 4.8 0 0 1-.97-.484l-.048-.03c-.504-.307-.999-.609-2.068-.722C2.682 14.464 2 13.846 2 13V9c0-.85.685-1.432 1.357-1.615.849-.232 1.574-.787 2.132-1.41.56-.627.914-1.28 1.039-1.639.199-.575.356-1.539.428-2.59z"
                />
              </svg>
            </a>
            <button type="button" class="modal_btn">
              <svg
                xmlns="http://www.w3.org/2000/svg"
                width="30"
                height="30"
                fill="#e4d4fa"
                class="bi bi-share-fill"
                viewBox="0 0 16 16"
              >
                <path
                  d="M11 2.5a2.5 2.5 0 1 1 .603 1.628l-6.718 3.12a2.5 2.5 0 0 1 0 1.504l6.718 3.12a2.5 2.5 0 1 1-.488.876l-6.718-3.12a2.5 2.5 0 1 1 0-3.256l6.718-3.12A2.5 2.5 0 0 1 11 2.5"
                />
              </svg>
            </button>
          </div>

          <div class="modal">
            <div class="modal_popup">
              <h3>공유하기</h3>
              <div>
                <a href=""><img src="./resourse/네이버.png" alt="" /></a>
                <a href=""
                  ><img src="./resourse/kakao-talk_3991999.png" alt=""
                /></a>
              </div>
              <button type="button" class="close_btn">닫기</button>
            </div>
          </div>
          </div>
        </div>
        <table>
          <tr>
            <th>별점</th>
            <td><div><%= p.getScore() %></td>
          </tr>
          <tr>
            <th>위치</th>
            <td><%= p.getAddress() %></td>
          </tr>
          <tr>
            <th>영업시간</th>
            <td><%= p.getBusinessTime() %></td>
          </tr>
          <tr>
            <th>전화번호</th>
            <td><%= p.getPlaceCall() %></td>
          </tr>
        </table>
      </div>
      <script type="text/javascript" src="https://oapi.map.naver.com/openapi/v3/maps.js?ncpClientId=i61mpeml1v"></script>
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
                <a href="<%= contextPath %>/restaurantDetail.pl?placeNo=<%= rp.getPlaceNo()  %>">
                  <img
                    src="<%= rp.getTitleImg() %>"
                    alt=""
                  />
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
        <div>
          <input type="submit" value="리뷰작성" id="review-btn" />
        </div>
        <% } %>
      </div>
		  <%  
            for (int i = 0; i < r.size(); i++) { 
                Review review = r.get(i);
          %>	
      <table align="center" class="review-content">
        <tr>
          <th rowspan="2" style="width: 200px" id="profile">
            <div id="profile-img"><img src="./resourse/조이.jpg" alt="" /></div>
            <div id="profile-id"><%= r.get(i).getNickName() %></div>
            <div id="profile-score"><%= r.get(i).getScore() %></div>
            <div id="profile-date"><%= r.get(i).getrDate() %></div>
            <div id="profile-update">
              <a href="">수정</a>
              <a href="">삭제</a>
            </div>
            <input type="submit" value="리뷰신고" id="report-btn" />
          </th>
          <td colspan="2" rowspan="2" style="width: 500px" id="review-img">
            <img src="<%= r.get(i).getTitleImg() %>" alt="" />
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

      <button class="add-list">검색 결과 더보기</button>
    </div>

    <button id="top-btn">
      ▲ <br />
      TOP
    </button>
  </body>

  <script>
    let box = $("body");
    let boxHeight = box.height();
    let boxOffsetTop = box.offset().top;
    let quickMenu = $(".badge");
    let quickMenuHeight = quickMenu.height();
    const DURATION = 900;

    $(window).resize(function () {
      boxHeight = box.height();
      boxOffsetTop = box.offset().top;
      quickMenuHeight = quickMenu.height();
    });

    $(window).scroll(function () {
      let scrollTop = $(this).scrollTop();
      let point;
      let endPoint = boxHeight - quickMenuHeight;
      if (scrollTop < boxOffsetTop) {
        point = 0;
      } else if (scrollTop > endPoint) {
        point = endPoint;
      } else {
        point = scrollTop - 50;
      }
      quickMenu.stop().animate({ top: point }, DURATION);
    });

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

    $(function () {
      $(".review .review-content").slice(0, 4).show(); // select the first 4
      $(".add-list").click(function (e) {
        // click event for load more
        e.preventDefault();
        $(".review .review-content:hidden").slice(0, 4).show(); // select next 4 hidden divs and show them
        if ($(".review-content:hidden").length == 0) {
          // check if any hidden divs still exist
          // alert("No more divs"); // alert if there are none left
          $(".add-list").hide();
        }
      });
    });
  </script>
</html>
