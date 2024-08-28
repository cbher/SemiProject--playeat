<%@page import="semi.oneday.model.vo.Comment"%>
<%@page import="semi.cooking.model.vo.Attachment"%> <%@page
import="semi.oneday.model.vo.Oneday"%> <%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 
<% 
Oneday o = (Oneday)request.getAttribute("o");
ArrayList<Attachment> list = (ArrayList<Attachment>)request.getAttribute("list"); 
ArrayList<Comment> c = (ArrayList<Comment>)request.getAttribute("c");
%>
    <!DOCTYPE html>
    <html>
      <head>
        <meta charset="UTF-8" />
        <title>원데이클래스 상세페이지</title>
        <link rel="stylesheet" href="/semi/resources/css/oneday2.css?after" />
        <link
          href="https://fonts.googleapis.com/icon?family=Material+Icons"
          rel="stylesheet"
        />
        <link
          rel="stylesheet"
          href="https://unpkg.com/swiper@6.8.4/swiper-bundle.min.css"
        />
        <link
          rel="stylesheet"
          href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200"
        />
        <link
          rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css"
        />
        <link
          href="https://fonts.googleapis.com/icon?family=Material+Icons"
          rel="stylesheet"
        />

        <script src="https://unpkg.com/swiper@6.8.4/swiper-bundle.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
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

        <!-- 원데이클래스 상세 -->
        <div class="info-box">
          <div class="swiper">
            <div class="swiper-wrapper">
              <div class="swiper-slide">
                <img src="<%= o.getTitleImg() %>" alt="" />
              </div>
              <div class="swiper-slide">
                <img src="<%= o.getTitleImg() %>" alt="" />
              </div>
              <div class="swiper-slide">
                <img src="<%= o.getTitleImg() %>" alt="" />
              </div>
              <div class="swiper-slide">
                <img src="<%= o.getTitleImg() %>" alt="" />
              </div>
              <div class="swiper-slide">
                <img src="<%= o.getTitleImg() %>" alt="" />
              </div>
            </div>
            <div class="swiper-pagination"></div>
            <div class="swiper-button-prev"></div>
            <div class="swiper-button-next"></div>
            <div class="swiper-scrollbar"></div>
          </div>

          <div class="info">
            <div class="info2">
              <h2><%= o.getOneTitle() %></h2>
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
            <table>
              <tr>
                <th>별점</th>
                <td><%= o.getScore() %></td>
              </tr>
              <tr>
                <th>위치</th>
                <td><%= o.getAddress() %></td>
              </tr>
              <tr>
                <th>영업시간</th>
                <td><%= o.getStartTime() %> ~ <%= o.getEndTime() %></td>
              </tr>
              <tr>
                <th>전화번호</th>
                <td><%= o.getPhone() %></td>
              </tr>
              <tr>
                <th>가격</th>
                <td><%= o.getPrice() %>원</td>
              </tr>
            </table>
          </div>
        </div>

        <!-- 비슷한 클래스 -->

        <div class="recommend">
          <section class="main-slide">
            <div class="inner">
              <div class="title">최신 음식</div>
              <div class="swiper-container">
                <div class="swiper-wrapper">
                  <div class="swiper-slide">
                    <a href="">
                      <img
                        src="./resourse/AdobeStock_600875580-1024x683.jpg"
                        alt=""
                      />
                    </a>
                    <p>플레이잇1</p>
                  </div>
                  <div class="swiper-slide">
                    <a href="">
                      <img
                        src="./resourse/shutterstock_2006673803-scaled.jpg"
                        alt=""
                      />
                    </a>
                    <p>플레이잇2</p>
                  </div>
                  <div class="swiper-slide">
                    <a href="">
                      <img src="./resourse/play&eat.png" alt="" />
                    </a>
                    <p>플레이잇3</p>
                  </div>
                  <div class="swiper-slide">
                    <a href="">
                      <img src="./resourse/play&eat.png" alt="" />
                    </a>
                    <p>플레이잇4</p>
                  </div>
                  <div class="swiper-slide">
                    <a href="">
                      <img src="./resourse/play&eat.png" alt="" />
                    </a>
                    <p>플레이잇5</p>
                  </div>
                  <div class="swiper-slide">
                    <a href="">
                      <img src="./resourse/play&eat.png" alt="" />
                    </a>
                    <p>플레이잇6</p>
                  </div>
                  <div class="swiper-slide">
                    <a href="">
                      <img src="./resourse/play&eat.png" alt="" />
                    </a>
                    <p>플레이잇7</p>
                  </div>
                  <div class="swiper-slide">
                    <a href="">
                      <img src="./resourse/play&eat.png" alt="" />
                    </a>
                    <p>플레이잇7</p>
                  </div>
                  <div class="swiper-slide">
                    <a href="">
                      <img src="./resourse/play&eat.png" alt="" />
                    </a>
                    <p>플레이잇7</p>
                  </div>
                  <div class="swiper-slide">
                    <a href="">
                      <img src="./resourse/play&eat.png" alt="" />
                    </a>
                    <p>플레이잇7</p>
                  </div>
                  <div class="swiper-slide">
                    <a href="">
                      <img src="./resourse/play&eat.png" alt="" />
                    </a>
                    <p>플레이잇7</p>
                  </div>
                  <div class="swiper-slide">
                    <a href="">
                      <img src="./resourse/play&eat.png" alt="" />
                    </a>
                    <p>플레이잇7</p>
                  </div>
                  <div class="swiper-slide">
                    <a href="">
                      <img src="./resourse/play&eat.png" alt="" />
                    </a>
                    <p>플레이잇7</p>
                  </div>
                  <div class="swiper-slide">
                    <a href="">
                      <img src="./resourse/play&eat.png" alt="" />
                    </a>
                    <p>플레이잇7</p>
                  </div>
                  <div class="swiper-slide">
                    <a href="">
                      <img src="./resourse/play&eat.png" alt="" />
                    </a>
                    <p>플레이잇7</p>
                  </div>
                  <div class="swiper-slide">
                    <a href="">
                      <img src="./resourse/덮밥.jpg" alt="" />
                    </a>
                    <p>플레이잇7</p>
                  </div>
                  <div class="swiper-slide">
                    <a href="">
                      <img src="./resourse/play&eat.png" alt="" />
                    </a>
                    <p>플레이잇7</p>
                  </div>
                  <div class="swiper-slide">
                    <a href="">
                      <img src="./resourse/play&eat.png" alt="" />
                    </a>
                    <p>플레이잇7</p>
                  </div>
                  <div class="swiper-slide">
                    <a href="">
                      <img src="./resourse/play&eat.png" alt="" />
                    </a>
                    <p>플레이잇7</p>
                  </div>
                  <div class="swiper-slide">
                    <a href="">
                      <img src="./resourse/play&eat.png" alt="" />
                      <p>플레이잇7</p>
                    </a>
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
        </div>

        <!-- 한줄평 -->
        <div class="comment">
          <div class="comment-title">
            <h2>한줄평</h2>

            <!-- 모달 들어갈곳 -->
            <!-- 모달 버튼 -->
            <button id="modalBtn">작성하기</button>
          </div>
          <!-- 모달 창 -->
          <div id="myModal" class="comment-modal">
            <div class="modal-content">
              <span class="close" id="closeBtn">&times;</span>
              <form>
                <p class="star">
                  별점 1<input type="radio" id="star1" name="score" value="1" checked />
                  	  2<input type="radio" id="star2" name="score" value="2" /> 
                  	  3<input type="radio" id="star3" name="score" value="3"/>
                  	  4<input type="radio" id="star4" name="score" value="4"/> 
                  	  5<input type="radio" id="star5" name="score" value="5"/>
                </p>
                <input type="submit" value="등록" class="star-btn" />
                <br />
                <textarea id="reviewContent" class="star-content" style="resize: none" placeholder="입력하세요."></textarea>
              </form>
            </div>
          </div>
          <div class="comment-area">
          <%  
            for (int i = 0; i < c.size(); i++) { 
                Comment comment = c.get(i);
          %>
            <div class="profile">
              <div id="nickname"><%= comment.getUserName() %></div>
              <div id="date"><%= comment.getCreateDate() %></div>
              <div id="edit">
                <a href="">수정</a> /
                <a href="">삭제</a>
              </div>
              <div id="score"><%= comment.getScore() %></div>
            </div>
            <div class="text-area">
              <div id="review"><%= comment.getComContent() %></div>
            </div>
          <% } %>
          </div>
        </div>

        <button id="top-btn">
          ▲ <br />
          TOP
        </button>

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
                &copy; <span id="this-year"></span> kh정보교육원 H반 4조
                세미프로젝트
              </p>
            </div>
          </div>
        </footer>

        <script>
          // footer this-year (현재년도 표시)
          const thisYear = document.querySelector("#this-year");
          thisYear.textContent = new Date().getFullYear();

          let quickMenu = $(".badge");
          const DURATION = 900; // 이동 애니메이션 시간

          function positionQuickMenu() {
            let windowHeight = $(window).height();
            let quickMenuHeight = quickMenu.height();

            // 화면의 중앙 위치를 계산
            let point =
              $(window).scrollTop() + windowHeight / 2 - quickMenuHeight / 2;

            point -= 50;

            quickMenu.stop().animate({ top: point }, DURATION);
          }

          $(window).scroll(function () {
            positionQuickMenu(); // 스크롤할 때마다 중앙에 맞춰 이동
          });

          $(window).resize(function () {
            positionQuickMenu(); // 창 크기가 변경될 때도 중앙에 재배치
          });

          $(document).ready(function () {
            positionQuickMenu(); // 페이지 로드 시 중앙에 배치
          });

          const swiper = new Swiper(".swiper", {
            // Optional parameters
            direction: "horizontal",
            loop: true,
            slidesPerView: 1,

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

            direction: "horizontal",
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

          // 한줄평 MODAL

          document.addEventListener("DOMContentLoaded", function () {
            // elements
            var modalBtn = document.getElementById("modalBtn");
            var modal = document.getElementById("myModal");
            var closeBtn = document.getElementById("closeBtn");

            // functions
            function toggleModal() {
              modal.classList.toggle("show");
            }

            // events
            modalBtn.addEventListener("click", toggleModal);
            closeBtn.addEventListener("click", toggleModal);

            window.addEventListener("click", function (event) {
              // 모달의 검은색 배경 부분이 클릭된 경우 닫히도록 하는 코드
              if (event.target === modal) {
                toggleModal();
              }
            });
          });

          jQuery.fn.center = function () {
            this.css(
              "top",
              Math.max(
                0,
                ($(window).height() - $(this).outerHeight()) / 2 +
                  $(window).scrollTop()
              ) + "px"
            );
            this.css(
              "left",
              Math.max(
                0,
                ($(window).width() - $(this).outerWidth()) / 2 +
                  $(window).scrollLeft()
              ) + "px"
            );
            return this;
          };

          function wrapWindowByMask() {
            var maskHeight = $(document).height();
            var maskWidth = $(window).width();

            $("#mask").css({
              width: maskWidth,
              height: maskHeight,
            });
            $("#mask").fadeTo(10, 0.8);

            $(".ModalPopup").show();
            $(".ModalPopup").center();
          }

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
          
        </script>
      </body>
    </html></Attachment
  ></Attachment
>
