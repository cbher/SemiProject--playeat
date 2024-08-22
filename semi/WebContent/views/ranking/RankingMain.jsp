<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>명예의 전당</title>
<link rel="stylesheet" href="/semi/resources/css/rank.css?after">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<script defer src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script defer src="/semi/resources/js/rank.js?after"></script>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	
	<div class="badge">
        <div class="text">최근 본 장소</div>
        <a href="javascript:void(0)" class="place">
          <img src="" alt="">
          <div class="badge-title">
            <h2>여긴어디야</h2>
          </div>
        </a>
        <a href="javascript:void(0)" class="place">
          <img src="" alt="">
          <div class="badge-title">
            <h2>여긴어디야</h2>
          </div>
        </a>
        <a href="javascript:void(0)" class="place">
          <img src="" alt="">
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
                <img src="/semi/resources/backGroundImg/금.png" alt="">
                <a href=""><img src="./resourse/덮밥.jpg" class="rank-img" alt=""></a>
                <div class="nickname">닉네임자리</div>
            </div>
            <div class="bronze">
                <img src="/semi/resources/backGroundImg/동.png" alt="">
                <a href=""><img src="./resourse/음식.jpg" class="rank-img" alt=""></a>
                <div class="nickname">닉네임자리</div>
            </div>
            <div class="silver">
                <img src="/semi/resources/backGroundImg/은.png" alt="">
                <a href=""><img src="./resourse/음식2.jpg" class="rank-img" alt=""></a>
                <div class="nickname">닉네임자리</div>
            </div>
        </div>
    </div>

    <div class="rank-area2">
            <h2>아깝상</h2>
            
                <div class="rank-list">
                    <table>                     
                        <tr>
                            <th rowspan="2" style="width: 100px;" align="center">
                                <h1 id="ranking">4</h1>
                            </th>
                            <td rowspan="2" style="width: 200px;" align="center">
                                <img src="./resourse/리뷰음식.jpg" alt="" id="rank-list-img">
                            </td>
                            <td rowspan="2" style="width: 10px;"></td>
                            <td style="height: 50px;" id="cook-title"><span>요리명자리</span></td>
                            <td id="cook-nickname">
                                <span>닉네임자리</span>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" id="cook-content">
                                <textarea name="" id="content">요리설명자리</textarea>
                            </td>
                        </tr>
                    </table>
                </div>

                <div class="rank-list">
                    <table>                     
                        <tr>
                            <th rowspan="2" style="width: 100px;" align="center">
                                <h1 id="ranking">4</h1>
                            </th>
                            <td rowspan="2" style="width: 200px;" align="center">
                                <img src="./resourse/리뷰음식.jpg" alt="" id="rank-list-img">
                            </td>
                            <td rowspan="2" style="width: 10px;"></td>
                            <td style="height: 50px;" id="cook-title"><span>요리명자리</span></td>
                            <td id="cook-nickname">
                                <span>닉네임자리</span>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" id="cook-content">
                                <textarea name="" id="content">요리설명자리</textarea>
                            </td>
                        </tr>
                    </table>
                </div>

                <div class="rank-list">
                    <table>                     
                        <tr>
                            <th rowspan="2" style="width: 100px;" align="center">
                                <h1 id="ranking">4</h1>
                            </th>
                            <td rowspan="2" style="width: 200px;" align="center">
                                <img src="./resourse/리뷰음식.jpg" alt="" id="rank-list-img">
                            </td>
                            <td rowspan="2" style="width: 10px;"></td>
                            <td style="height: 50px;" id="cook-title"><span>요리명자리</span></td>
                            <td id="cook-nickname">
                                <span>닉네임자리</span>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" id="cook-content">
                                <textarea name="" id="content">요리설명자리</textarea>
                            </td>
                        </tr>
                    </table>
                </div>

                <div class="rank-list">
                    <table>                     
                        <tr>
                            <th rowspan="2" style="width: 100px;" align="center">
                                <h1 id="ranking">4</h1>
                            </th>
                            <td rowspan="2" style="width: 200px;" align="center">
                                <img src="./resourse/리뷰음식.jpg" alt="" id="rank-list-img">
                            </td>
                            <td rowspan="2" style="width: 10px;"></td>
                            <td style="height: 50px;" id="cook-title"><span>요리명자리</span></td>
                            <td id="cook-nickname">
                                <span>닉네임자리</span>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" id="cook-content">
                                <textarea name="" id="content">요리설명자리</textarea>
                            </td>
                        </tr>
                    </table>
                </div>

                <div class="rank-list">
                    <table>                     
                        <tr>
                            <th rowspan="2" style="width: 100px;" align="center">
                                <h1 id="ranking">4</h1>
                            </th>
                            <td rowspan="2" style="width: 200px;" align="center">
                                <img src="./resourse/리뷰음식.jpg" alt="" id="rank-list-img">
                            </td>
                            <td rowspan="2" style="width: 10px;"></td>
                            <td style="height: 50px;" id="cook-title"><span>요리명자리</span></td>
                            <td id="cook-nickname">
                                <span>닉네임자리</span>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" id="cook-content">
                                <textarea name="" id="content">요리설명자리</textarea>
                            </td>
                        </tr>
                    </table>
                </div>

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
              &copy; <span id="this-year"></span> kh정보교육원 H반 4조 세미프로젝트
            </p>
          </div>
        </div>
      </footer>
      

      <script>
        // footer this-year (현재년도 표시)
        const thisYear = document.querySelector("#this-year");
        thisYear.textContent = new Date().getFullYear();
      </script>s

    <button id="top-btn"> ▲ <br/> TOP </button>

</body>
</html>