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
    <script type="text/javascript" src="https://oapi.map.naver.com/openapi/v3/maps.js?ncpClientId=i61mpeml1v"></script>
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
			                    "<td colspan='2' id='search-content'> 매장 번호 : "+ result[i].phone +" <br><br>  가격 : "+ result[i].price +" <br> 참여인원 : "+ result.entPeople +" </td>"+
			                "</tr>"+
			                "<tr>"+
			                    "<td style='width: 150px; height: 35px;' id='search-score'><div class='material-icons' style='position:relative;top:6px;color:#e4d4fa'>star</div> "+ result[i].score+"</td>"+
			                    "<td style='height: 35px;' id='search-location'>"+result[i].address+"</td>"+
			                "</tr>"+
			            "</table>"+
			        "</div>";
					}
					console.log(result)
					$(".searchWrap").html(value);
					showSearchList();
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
	

		</script>

</body>
</html>