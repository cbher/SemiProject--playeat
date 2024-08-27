<%@page import="semi.ranking.model.vo.Ranking"%> <%@page
import="semi.cooking.model.vo.Attachment"%> <%@page
import="java.util.ArrayList"%> <%@page
import="semi.cooking.model.vo.CookingBoard"%> <%@ page language="java"
contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%
ArrayList<Ranking>
  list = (ArrayList<Ranking
    >)request.getAttribute("list"); %>
    <!DOCTYPE html>
    <html>
      <head>
        <meta charset="UTF-8" />
        <title>명예의 전당</title>
        <link rel="stylesheet" href="/semi/resources/css/rank.css?ver=220610" />
        <link
          href="https://fonts.googleapis.com/icon?family=Material+Icons"
          rel="stylesheet"
        />
        <script
          defer
          src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"
        ></script>
        <script defer src="/semi/resources/js/rank.js?after"></script>
      </head>
      <body>
        <%@ include file="../common/menubar.jsp" %>

        <div class="badge">
          <div class="text">최근 본 장소</div>
          <a href="javascript:void(0)" class="place">
            <img src="" alt="" />
            <div class="badge-title">
              <h2>여긴어디야</h2>
            </div>
          </a>
          <a href="javascript:void(0)" class="place">
            <img src="" alt="" />
            <div class="badge-title">
              <h2>여긴어디야</h2>
            </div>
          </a>
          <a href="javascript:void(0)" class="place">
            <img src="" alt="" />
            <div class="badge-title">
              <h2>여긴어디야</h2>
            </div>
          </a>
        </div>

        <div class="rank-area">
          <div class="rank-no">
            <select name="rank-no" id="">
              <option value="">1차 명예의 전당</option>
            </select>
          </div>
          <div class="ranking-top">
            <div class="gold">
              <img src="/semi/resources/backGroundImg/gold.png" alt="" />
              <a
                href="<%= contextPath %>/detail.co?bno=<%= list.get(0).getcNO() %>"
                ><img
                  src="<%= list.get(0).getTitleImg() %>"
                  class="rank-img"
                  alt=""
              /></a>
              <div class="nickname"><%= list.get(0).getNickName() %></div>
            </div>
            <div class="bronze">
              <img src="/semi/resources/backGroundImg/bronze.png" alt="" />
              <a
                href="<%= contextPath %>/detail.co?bno=<%= list.get(2).getcNO() %>"
                ><img
                  src="<%= list.get(2).getTitleImg() %>"
                  class="rank-img"
                  alt=""
              /></a>
              <div class="nickname"><%= list.get(2).getNickName() %></div>
            </div>
            <div class="silver">
              <img src="/semi/resources/backGroundImg/silver.png" alt="" />
              <a
                href="<%= contextPath %>/detail.co?bno=<%= list.get(1).getcNO() %>"
                ><img
                  src="<%= list.get(1).getTitleImg() %>"
                  class="rank-img"
                  alt=""
              /></a>
              <div class="nickname"><%= list.get(1).getNickName() %></div>
            </div>
          </div>
        </div>

        <div class="rank-area2">
          <h2>아깝상</h2>
          <% for(int i = 3; i < list.size(); i++) { Ranking ranking =
          list.get(i); %>
          <div class="rank-list">
            <table>
              <tr>
                <th rowspan="2" style="width: 100px" align="center">
                  <h1 id="ranking"><%= i + 1 %></h1>
                </th>
                <td rowspan="2" style="width: 200px" align="center">
                  <a href="<%= contextPath %>/detail.co?bno=<%= ranking.getcNO() %>"
                    ><img src="<%= contextPath + "/" %><%= ranking.getTitleImg()
                    %>" alt="" id="rank-list-img"></a
                  >
                </td>
                <td rowspan="2" style="width: 10px"></td>
                <td style="height: 50px" id="cook-title">
                  <span><%= ranking.getcTitle() %></span>
                </td>
                <td id="cook-nickname">
                  <span><%= ranking.getNickName() %></span>
                </td>
              </tr>
              <tr>
                <td colspan="2" id="cook-content">
                  <textarea name="" id="content">
<%= ranking.getcContents() %></textarea
                  >
                </td>
              </tr>
            </table>
          </div>
          <% } %>

          <button class="add-list">더보기</button>
        </div>

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
        </script>

        <button id="top-btn">
          ▲ <br />
          TOP
        </button>
      </body>
    </html></Ranking
  ></Ranking
>
