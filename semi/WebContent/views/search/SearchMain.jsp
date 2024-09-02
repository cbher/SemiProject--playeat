<%@page import="semi.play.model.vo.Play"%>
<%@page import="java.util.ArrayList"%>
<%@page import="semi.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   String contextPath = request.getContextPath();
   Member loginUser = (Member)session.getAttribute("loginUser");
   String alertMsg = (String)session.getAttribute("alertMsg");
   ArrayList<Play> list = (ArrayList<Play>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
	<link rel="stylesheet" href="/semi/resources/css/detail_search.css?after">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <script defer src="/semi/resources/js/detail_search.js?after"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript" src="https://oapi.map.naver.com/openapi/v3/maps.js?ncpClientId=lm9hxz6gtq"></script>
</head>
<body>

    <header>
        <div class="inner">
            <a href="<%= contextPath %>" class="logo">
                <img src="resources/backGroundImg/play_eat-removebg-preview.png" alt="">
            </a>
            <div class="search">
                <form action="<%= contextPath %>/searchMain.sc">
                    
                        <input type="text" name="search" placeholder="검색어를 입력하세요">
                        <button class="material-icons" type="submit" >search</button>
                    
                </form>
            </div>
            <div class="login">
            <% if(loginUser == null) {%>
                <ul>
                    <li><a href="<%= contextPath %>/login.me">로그인</a></li>
                    <li><a href="<%= contextPath %>/enrollForm.me">회원가입</a></li>
                </ul>
            <% }else { %>
            <div class="login2">
            <br>
            <b><%= loginUser.getUserName() %>님</b>의 방문을 환영합니다. <br><br>
                <a href="<%= contextPath %>/myPage.me">마이페이지</a>
                <a href="<%= contextPath %>/logout.me">로그아웃</a>
            </div>
        </div>
            <% } %>
        </div>
    </header>

<div class="badge">

        <div class="text">최근 본 장소</div>
        <a href="javascript:void(0)" class="place">
          <img src="./resourse/음식.jpg" alt="">
          <div class="badge-title">
            <h2>여긴어디야</h2>
          </div>
        </a>
        <a href="javascript:void(0)" class="place">
          <img src="./resourse/음식2.jpg" alt="">
          <div class="badge-title">
            <h2>여긴어디야</h2>
          </div>
        </a>
        <a href="javascript:void(0)" class="place">
          <img src="./resourse/음식2.jpg" alt="">
          <div class="badge-title">
            <h2>여긴어디야</h2>
          </div>
        </a>
    </div>

    <div class="main-content">

    <div class="category">

        <div class="subject">
            <div class="category-title">
                <h4>테마별</h4>
            </div>
            <ul class="subject-list" onchange="searchPlay();">
                <li><input type="radio" name="subject-list" value="1">전체</li>
                <li><input type="radio" name="subject-list" value="2">카페</li>
                <li><input type="radio" name="subject-list" value="3">데이트</li>
                <li><input type="radio" name="subject-list" value="4">전시/관람</li>
                <li><input type="radio" name="subject-list" value="5">액티비티</li>
                <li><input type="radio" name="subject-list" value="6">음식점</li>
            </ul>
        </div>

        <hr>

        <div class="oneday">
            <div class="oneday-title">
                <h4>원데이 클래스</h4>
            </div>
            <ul class="oneday-list" onchange="searchOneday();">
                <li><input type="radio" name="oneday-list" value="1">전체</li>
                <li><input type="radio" name="oneday-list" value="2">스포츠</li>
                <li><input type="radio" name="oneday-list" value="3">드로잉</li>
                <li><input type="radio" name="oneday-list" value="4">쿠킹</li>
                <li><input type="radio" name="oneday-list" value="5">핸드메이드</li>
                <li><input type="radio" name="oneday-list" value="6">음악</li>
                <li><input type="radio" name="oneday-list" value="7">반려동물</li>
                <li><input type="radio" name="oneday-list" value="8">플라워</li>
            </ul>
        </div>

        <hr>

        <div class="r-category">
            <div class="r-category-title">
                <h4>식당 카테고리</h4>
            </div>
            <ul class="r-category-list" onchange="searchRestaurant()">
                <li><input type="radio" name="r-category-list" value="1">전체</li>
                <li><input type="radio" name="r-category-list" value="2">밥집</li>
                <li><input type="radio" name="r-category-list" value="3">고깃집</li>
                <li><input type="radio" name="r-category-list" value="4">술집</li>
                <li><input type="radio" name="r-category-list" value="5">한식</li>
                <li><input type="radio" name="r-category-list" value="6">일식</li>
                <li><input type="radio" name="r-category-list" value="7">양식</li>
                <li><input type="radio" name="r-category-list" value="8">중식</li>
                <li><input type="radio" name="r-category-list" value="9">브런치</li>
                <li><input type="radio" name="r-category-list" value="10">패스트푸드</li>
                <li><input type="radio" name="r-category-list" value="11">뷔페</li>
                <li><input type="radio" name="r-category-list" value="12">분식</li>
            </ul>
        </div>

        <hr>

        <div class="location">
            <div class="location-title">
                <h4>지역별</h4>
            </div>
            <ul class="location-list">
                <li>
                    <select name="location" id="" onchange="selectLocationList()">
                        <option value="1">서울</option>
                        <option value="2">경기도</option>
                        <option value="3">인천</option>
                        <option value="4">대구</option>
                        <option value="5">광주</option>
                        <option value="6">부산</option>
                        <option value="7">대전</option>
                        <option value="8">울산</option>
                        <option value="9">세종</option>
                        <option value="10">강원도</option>
                        <option value="11">충청북도</option>
                        <option value="12">충청남도</option>
                        <option value="13">전라북도</option>
                        <option value="14">전라남도</option>
                        <option value="15">경상북도</option>
                        <option value="16">경상남도</option>
                        <option value="17">제주도</option>
                    </select>
                </li>
            </ul>
        </div>
    </div>
    

    <div class="search-area">

        <script type="text/javascript" src="https://oapi.map.naver.com/openapi/v3/maps.js?ncpClientId=i61mpeml1v"></script>
		<div id="map" style="width:90%;height:400px; margin: 20px auto;"></div>
		
		
        <br><br>
        <div class="searchWrap">
	        <% for(Play p :list){ %>
		        <div class="search-list">
		            <table>
		                <tr>
		                    <td rowspan="3" style="width: 150px; height: 150px;">
		                        <a href="<%= contextPath %>/detail.pl?bno=<%= p.getPlaceNo() %>"><img src="<%= p.getTitleImg() %>" alt=""></a>
		                    </td>
		                    <td rowspan="3" style="width: 15px;"></td>
		                    <td colspan="2" style="height: 40px;" id="search-title"><h2><%= p.getPlaceTitle() %></h2></td>
		                </tr>
		                <tr>
		                    <td colspan="2" id="search-content">매장 번호 : <%= p.getPlaceCall() %><br><br>영업시간 : <%= p.getBusinessTime() %></td>
		                </tr>
		                <tr>
		                    <td style="width: 150px; height: 35px;" id="search-score"><div class="material-icons" style="position:relative;top:6px;color:#e4d4fa">star</div> <%= p.getScore() %></td>
		                    <td style="height: 35px;" id="search-location"><%= p.getAddress() %></td>
		                </tr>
		            </table>
		        </div>
		    <% } %>
		</div>
        <button class="add-list">검색 결과 더보기</button>
    </div>
    </div>
    
    <button id="top-btn"> ▲ <br/> TOP </button >

        <footer class="footer">
            <div class="inner">
              <ul class="menu">
                <li><a href="">개인정보처리방침</a></li>
                <li><a href=""> 이용약관 </a></li>
                <li><a href="">위치정보이용약관</a></li>
                <li><a href="">원클래스약관</a></li>            
              </ul>
          
              <div class="info3">
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
        $(function(){
        	showSearchList();
        })
		function selectLocationList(){
			$.ajax({
				url:"searchList.sl",
				data:{category:$("option:selected").val()},
				success:function(result){
					let value = "";
					for(let i = 0; i < result.length;i++){
						value += "<div class='search-list'>"+
						            "<table>"+
						                "<tr>"+
						                    "<td rowspan='3' style='width: 150px; height: 150px;'>"+
						                        "<a href='"+"<%= contextPath %>"+"/detail.pl?bno=" + result[i].placeNo+ "'><img src='"+result[i].titleImg+"'></a>"+
						                    "</td>"+
						                    "<td rowspan='3' style='width: 15px;'></td>"+
						                    "<td colspan='2' style='height: 40px;' id='search-title'><h2>"+result[i].placeTitle+"</h2></td>"+
						                "</tr>"+
						                "<tr>"+
						                    "<td colspan='2' id='search-content'> 매장 번호 : "+ result[i].placeCall +" <br><br> 영업시간 : "+ result[i].businessTime +"</td>"+
						                "</tr>"+
						                "<tr>"+
						                    "<td style='width: 150px; height: 35px;' id='search-score'><div class='material-icons' style='position:relative;top:6px;color:#e4d4fa'>star</div> "+ result[i].score+"</td>"+
						                    "<td style='height: 35px;' id='search-location'>"+result[i].address+"</td>"+
						                "</tr>"+
						            "</table>"+
						        "</div>";
					
					}
					$(".searchWrap").html(value);
					showSearchList();
					if($(".search-list:hidden").length == 0){
						$(".add-list").hide();
					}else{
						$(".add-list").show();						
					}
				},
				error:function(){
					console.log("실패");
				}
			})
		}
		
		function searchRestaurant(){
			
			$.ajax({
				url:"selectRestaurant.sr",
				data:{
					category:$("input[name=r-category-list]:checked").val()
				},
				success:function(result){
					let value = "";
					for(let i = 0; i < result.length;i++){
						value += "<div class='search-list'>"+
						            "<table>"+
						                "<tr>"+
						                    "<td rowspan='3' style='width: 150px; height: 150px;'>"+
						                        "<a href='"+"<%= contextPath %>"+"/detail.pl?bno=" + result[i].placeNo+ "'><img src='"+result[i].titleImg+"'></a>"+
						                    "</td>"+
						                    "<td rowspan='3' style='width: 15px;'></td>"+
						                    "<td colspan='2' style='height: 40px;' id='search-title'><h2>"+result[i].placeTitle+"</h2></td>"+
						                "</tr>"+
						                "<tr>"+
						                    "<td colspan='2' id='search-content'> 매장 번호 : "+ result[i].placeCall +" <br><br> 영업시간 : "+ result[i].businessTime +"</td>"+
						                "</tr>"+
						                "<tr>"+
						                    "<td style='width: 150px; height: 35px;' id='search-score'><div class='material-icons' style='position:relative;top:6px;color:#e4d4fa'>star</div> "+ result[i].score+"</td>"+
						                    "<td style='height: 35px;' id='search-location'>"+result[i].address+"</td>"+
						                "</tr>"+
						            "</table>"+
						        "</div>";
					}
					$(".searchWrap").html(value);
					showSearchList();
					if($(".search-list:hidden").length == 0){
						$(".add-list").hide();
					}else{
						$(".add-list").show();						
					}
				},
				error:function(){
					console.log("실패")
				}
			})
			
		}
		
		function searchPlay(){
			$.ajax({
				url:"searchPlay.sp",
				data:{
					category:$("input[name=subject-list]:checked").val()
				},
				success:function(result){
					let value = "";
					for(let i = 0;i<result.length;i++){
						value += "<div class='search-list'>"+
			            "<table>"+
			                "<tr>"+
			                    "<td rowspan='3' style='width: 150px; height: 150px;'>"+
			                        "<a href='"+"<%= contextPath %>"+"/detail.pl?bno=" + result[i].placeNo+ "'><img src='"+result[i].titleImg+"'></a>"+
			                    "</td>"+
			                    "<td rowspan='3' style='width: 15px;'></td>"+
			                    "<td colspan='2' style='height: 40px;' id='search-title'><h2>"+result[i].placeTitle+"</h2></td>"+
			                "</tr>"+
			                "<tr>"+
			                    "<td colspan='2' id='search-content'> 매장 번호 : "+ result[i].placeCall +" <br><br> 영업시간 : "+ result[i].businessTime +"</td>"+
			                "</tr>"+
			                "<tr>"+
			                    "<td style='width: 150px; height: 35px;' id='search-score'><div class='material-icons' style='position:relative;top:6px;color:#e4d4fa'>star</div> "+ result[i].score+"</td>"+
			                    "<td style='height: 35px;' id='search-location'>"+result[i].address+"</td>"+
			                "</tr>"+
			            "</table>"+
			        "</div>";
					}
					$(".searchWrap").html(value);
					showSearchList();
					if($(".search-list:hidden").length == 0){
						$(".add-list").hide();
					}else{
						$(".add-list").show();						
					}
				},
				error:function(){
					
				},
			})
		}
		
		function searchOneday(){
			$.ajax({
				url:"searchOneday.so",
				data:{
					category:$("input[name=oneday-list]:checked").val()
				},
				success:function (result){
					console.log($("input[name=oneday-list]:checked").val())
					let value = "";
					for(let i = 0; i<result.length;i++){
						value += "<div class='search-list'>"+
			            "<table>"+
			                "<tr>"+
			                    "<td rowspan='3' style='width: 150px; height: 150px;'>"+
			                        "<a href='"+"<%= contextPath %>"+"/detail.pl?bno=" + result[i].oneNo+ "'><img src='"+result[i].titleImg+"'></a>"+
			                    "</td>"+
			                    "<td rowspan='3' style='width: 15px;'></td>"+
			                    "<td colspan='2' style='height: 40px;' id='search-title'><h2>"+result[i].oneTitle+"</h2></td>"+
			                "</tr>"+
			                "<tr>"+
			                    "<td colspan='2' id='search-content'> 매장 번호 : "+ result[i].phone +" <br><br>  가격 : "+ result[i].price +" <br> 참여인원 : "+ result[i].entPeople +" </td>"+
			                "</tr>"+
			                "<tr>"+
			                    "<td style='width: 150px; height: 35px;' id='search-score'><div class='material-icons' style='position:relative;top:6px;color:#e4d4fa'>star</div> "+ result[i].score+"</td>"+
			                    "<td style='height: 35px;' id='search-location'>"+result[i].address+"</td>"+
			                "</tr>"+
			            "</table>"+
			        "</div>";
					}
					$(".searchWrap").html(value);
					showSearchList();
					if($(".search-list:hidden").length == 0){
						$(".add-list").hide();
					}else{
						$(".add-list").show();						
					}
				},
				error:function(){
					console.log("Something Wrong!");
				}
			})
		}
        
        // 네이버 지도
        function initMap(lat, lng) {
	    	var mapOptions = {
		      center: new naver.maps.LatLng(lat, lng), // Center the map on the user's location
		      zoom: 15, // Zoom level
		      minZoom: 10, // Minimum zoom level
		      zoomControl: false, // Display zoom control
		      mapTypeControl: false // Display map type control
		    };
	    
		    // Create the map
		    var map = new naver.maps.Map('map', mapOptions);
		
		    // Add a marker at the user's location
		    var marker = new naver.maps.Marker({
		      position: new naver.maps.LatLng(lat, lng),
		      map: map
		    });
	  	}
	
	  // Function to get the user's current location
	  function showCurrentLocation() {
	    if (navigator.geolocation) {
	      // Get the current position
	      navigator.geolocation.getCurrentPosition(function(position) {
	        var lat = position.coords.latitude; // User's latitude
	        var lng = position.coords.longitude; // User's longitude
	        
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
	  
	  // 네이버 지도 마커
	  const clientId = 'lm9hxz6gtq'; // Your Naver Client ID
	  const clientSecret = 'SvlPlgdU8fDQyttkl2C0MUBgygvMB3wMsQEqAjWU'; // Your Naver Client Secret

	  const categoryData = {
			    // 전체
			    "1": [
			        "서울특별시 마포구 양화로18안길 8", // 니뽕내뽕 홍대점
			        "제주특별자치도 서귀포시 동문로 2", // 나원회포차
			        "서울특별시 마포구 양화로6길 73 4층", // 피자 네버슬립스 합정점
			        "서울특별시 마포구 홍익로3길 36 3층", // 미트컷터 김춘배 홍대본점
			        "서울특별시 마포구 와우산로21길 20-11 1층", // 호요 홍대점
			        "서울특별시 마포구 동교로30길 16", // 빌라더다이닝 연남본점
			        "제주특별자치도 제주시 서사로 11", // 우진해장국 제주점
			        "제주특별자치도 제주시 한림읍 일주서로 5083 1층", // 오만정성 제주협재점
			        "제주특별자치도 제주시 애월읍 애월해안로 929 2층", // 애월삼육공 흑돼지 제주점
			        "부산광역시 해운대구 구남로24번길 8", // 해목 해운대점
			        "부산광역시 해운대구 해운대해변로 333", // 해운대 소갈비집
			        "부산광역시 중구 광복중앙로 31", // 재모리 피자 본점
			        "대구광역시 달서구 조암로 90 1층", // 문어물갈비 대구본점
			        "울산광역시 남구 대공원로 231-3 1층", // 윤우 나기
			        "전라북도 군산시 개정면 금강로 470", // 계곡가든 게장
			        "전라남도 순천시 남신월3길 5", // 폼
			        "전라남도 여수시 도정영5길 10-4 1층", // 바다김밥 중앙본점
			        "전라북도 전주시 완산구 어진길 119", // 한국의 집
			        "전라북도 전주시 완산구 홍산북로 59-8", // 화원 석갈비 전주점
			        "세종특별자치시 조치원읍 효만석1로 32 2층", // 장원갑 칼국수 세종본점
			        "대전광역시 중구 대종로480번길 15", // 성심당 본점
			        "충청북도 청주시 청원구 오창읍 중심산업로 31-4 1층", // 바운스 무드 오창점
			        "경기도 수원시 팔달구 향교로 4 2층 #201", // 백소정 수원역점
			        "경기도 가평군 가평읍 북한강변로 1078-8", // 남이금강막국수
			        "경기도 수원시 팔달구 권광로180번길 53-8 #101, #102", // 포크너 인계점
			        "경기도 가평군 청평면 북한강로 2040", // 청평돌짜장
			        "경기도 성남시 분당구 분당로53번길 21 산호프라자 2층 205호", // 마미떡 본점
			        "인천광역시 강화군 화도면 해안남로 1147", // 먹골촌
			        "인천광역시 남동구 인주대로 600-1 HS빌딩", // 비스트로 제이
			        "인천광역시 중구 을왕로13번길 9 1층", // 버닝 조개구이 을왕리점
			        "인천광역시 서구 바리미로5번길 26 1층", // 팔각도
			        "인천광역시 연수구 하모니로 158 송도타임스페이스 D-121호, D-122호", // 매케집 송도점
			        "강원도 강릉시 초당순두부길77번길 15 동화가든", // 강릉짬뽕순두부 동화가든 본점
			        "강원도 강릉시 창해로350번길 25 1층", // 고신해물막국수 강문본점
			        "강원도 강릉시 창해로 491", // 경포대 울진 대게횟집
			        "강원도 춘천시 삭주로80번길 21 1층", // 늦은밤
			        "강원도 속초시 관광로 430", // 대청마루
			        "충청북도 단양군 단양읍 단양로 510", // 마늘 석갈비 막국수
			        "충청북도 청주시 상당구 단재로 439-25" // 제이브로
			    ],
			    // 카페
			    "2": [
			        "서울특별시 양천구 목동로11길 2 1층", // 라샤린 파츠
			        "서울특별시 성동구 아차산로13길 3 3층", // 코트사이드 2
			        "서울특별시 영등포구 여의대로 108 더 현대 서울 지하 1층", // 카페 레이어드 더현대서울점
			        "서울특별시 중구 을지로 29 1층", // 어프로프리엇
			        "서울특별시 종로구 북촌로4길 20" // 런던베이글뮤지엄 안국점
			    ],
			    // 데이트
			    "3": [
			        "서울특별시 송파구 올림픽로 300 롯데월드몰 지하 1층", // 롯데월드 아쿠아리움
			        "서울특별시 영등포구 여의도동로 330 한강사업본부 여의도 안내센터", // 여의도 한강공원
			        "서울특별시 양천구 남부순환로64길 26 신월야구장", // 서서울호수공원
			        "서울특별시 영등포구 영중로 15 타임스퀘어 4~5층" // 주 양대문점
			    ],
			    // 전시/관람
			    "4": [
			        "서울특별시 광진구 워커힐로 177 워커힐호텔 지하 1층", // 빛의 전당
			        "서울특별시 서대문구 연희로11가길 48-10 파크먼트 연희빌딩 B 지하층", // 뉴스박물관 연희점
			        "서울특별시 서초구 남부순환로 2460 서울예술의전당 한가람미술관" // 한가람미술관
			    ],
			    // 액티비티
			    "5": [
			        "서울특별시 서초구 서초대로77길 39 4층", // 점핑배틀 강남 1호점
			        "서울특별시 종로구 인사동길 44 쌈지길 지하 2층", // 숨바꼭질 쌈지길점
			        "서울특별시 마포구 와우산로 111 테화프라자 5층", // 레이저아레나 홍대점
			        "서울특별시 강남구 강남대로152길 5 지하 1층" // 양궁센터
			    ],
			    // 음식점
			    "6": [
			        "서울특별시 성동구 연무장길 50 2층 #201",// 초다이닝 성수점
			        "서울 강남구 강남대로96길 22 2층" // 을지다락 강남
			    ]
			};
		
		let map; let markers = []; // Array to hold map markers
		
		function initMap(lat, lng) {
		    const mapOptions = {
		        center: new naver.maps.LatLng(lat, lng),
		        zoom: 15,
		        minZoom: 10,
		        zoomControl: false,
		        mapTypeControl: false
		    };
		    map = new naver.maps.Map('map', mapOptions);
		}
		
		async function addMarkersForCategory(category) {
		    // Clear existing markers
		    markers.forEach(marker => marker.setMap(null));
		    markers = [];
		
		    // Fetch addresses for the selected category
		    const addresses = categoryData[category];
		
		    for (const address of addresses) {
		        const coords = await getCoordinates(address); // Fetch coordinates
		        if (coords) {
		            const marker = new naver.maps.Marker({
		                position: new naver.maps.LatLng(coords.lat, coords.lng),
		                map: map,
		                title: address
		            });
		            markers.push(marker);
		        }
		    }
		}
		
		async function getCoordinates(address) {
		    try {
		        const response = await fetch('https://naveropenapi.apigw.ntruss.com/map-geocode/v2/geocode?query=' + encodeURIComponent(address), {
		            method: 'GET',
		            headers: {
		                'X-NCP-APIGW-API-KEY-ID': lm9hxz6gtq,
		                'X-NCP-APIGW-API-KEY': SvlPlgdU8fDQyttkl2C0MUBgygvMB3wMsQEqAjWU
		            }
		        });
		        const data = await response.json();
		        if (data.addresses && data.addresses.length > 0) {
		            return {
		                lat: data.addresses[0].y,
		                lng: data.addresses[0].x
		            };
		        } else {
		            console.error(`No coordinates found for address: ${address}`);
		            return null;
		        }
		    } catch (error) {
		        console.error(`Error fetching coordinates: ${error}`);
		        return null;
		    }
		}
		
		document.querySelectorAll('input[name="subject-list"]').forEach(radio => {
		    radio.addEventListener('change', function () {
		        const selectedCategory = this.value; // Get selected category
		        addMarkersForCategory(selectedCategory); // Update markers
		    });
		});
		
		function showCurrentLocation() {
		    if (navigator.geolocation) {
		        navigator.geolocation.getCurrentPosition(function (position) {
		            const lat = position.coords.latitude;
		            const lng = position.coords.longitude;
		            initMap(lat, lng);
		        }, function (error) {
		            console.error("Error getting location: ", error);
		            initMap(37.3595704, 127.105399); // Default coordinates
		        });
		    } else {
		        alert("Geolocation is not supported by your browser.");
		        initMap(37.3595704, 127.105399);
		    }
		}
		
		showCurrentLocation();
			

		</script>

</body>
</html>