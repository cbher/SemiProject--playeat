<%@page import="java.util.List"%>
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
	ArrayList<Play> sList = (ArrayList<Play>)request.getAttribute("sList");
	ArrayList<PlayReply> replyList = (ArrayList<PlayReply>)request.getAttribute("replyList");
	
	
	

    // 예시로 사용자가 방문한 장소 정보를 세션에 저장
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
<meta charset="UTF-8">
<title>Insert title here</title>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="https://unpkg.com/swiper@6.8.4/swiper-bundle.min.css" />
    <script src="https://unpkg.com/swiper@6.8.4/swiper-bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script type="text/javascript" src="https://oapi.map.naver.com/openapi/v3/maps.js?ncpClientId=lm9hxz6gtq"></script>
	<script type="text/javascript" src="https://oapi.map.naver.com/openapi/v3/maps.js?ncpClientId=lm9hxz6gtq&submodules=geocoder"></script>
	<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.7.2/kakao.min.js"
		integrity="sha384-TiCUE00h649CAMonG018J2ujOgDKW/kVWlChEuu4jK2vxfAAD0eZxzCKakxg55G4"
		crossorigin="anonymous"></script>
	<script>
		Kakao.init('380af2edeb82dfbf591425877a112ec6'); // 사용하려는 앱의 JavaScript 키 입력
	</script>

<style>

/* BADGE */
.badge {
    position:absolute;
    top: 0;
    left: 70%;
    width: 180px;
    height: 520px;
    margin: 5% 0 0 320px;
    background-color:#f6f5f0;
    border: 2px solid #8B7DBE;
    border-radius: 10px;
    display: flex;
    align-items: center;
    flex-direction: column;
    z-index: 8;
}

@media (max-width:870px) {
    .badge {width:15%; left: auto; right:0; margin-left: 0;}
    div.info {width:80%; margin: 100px 0;}
}

.badge .text{
    font-size: 20px;
    text-align: center;
    border-bottom: 1px solid #8B7DBE;
    color: #8B7DBE;
    background-color: #e4d4fa;
    border-radius: 10px 10px 0px 0;
    width: 100%;
    height: 30px;
    line-height: 1.5;
}

.badge a{
    display: flex;
    justify-content: center;
    align-items: center;
    border: 1px solid #8B7DBE;
    border-radius: 5px;
    margin: auto;
    width: 140px;
    height: 130px;
}

.badge img{
    width: 100%;
    height: 100%;
}

.badge .place .badge-title{
    background: rgba(0,0,0,0.5);
    position: absolute;
    border-radius: 5px;
    margin: auto;
    width: 140px;
    height: 130px;
    color: #fff;
    padding: 20px;
    box-sizing: border-box;
    opacity: 0;
    transition: 0.5s;
}

.badge .place .badge-title h2{
    text-align: center;
    line-height: 5;
    font-size: 20px;
    /* margin-left: 9px; */
    display: inline;
}

.place:hover .badge-title {
    opacity: 1;
  }



/* main info */

.detail-info .inner .main-box{
    /* border: 1px solid black; */
    position: absolute;
    top: 220px;
    height: 900px;
    width: 100%;
    background-color: #f6f5f0;
    border-radius: 10px;
}

.detail-info .inner .main-img img{
    width: 90%;
    height: 350px;
    margin: auto;
    margin-top: 30px;
}

.detail-info .inner .main-box .swiper-pagination {
    position: absolute;
    right: 0;
    left: 0;
    color: #8b7dbe;
    z-index: 8;
}

.detail-info .inner .main-box .swiper-pagination .swiper-pagination-bullet{
    background-color: #8b7dbe;
    width: 10px;
    height: 10px;
    margin-right: 6px;
    outline: none;
}

.detail-info .inner .main-box .detail{
    display: flex;
    justify-content: center;
}


.detail-info .inner .main-box .info{
    border: 1px solid #e4d4fa;
    height: 350px;
    margin: 40px 40px;
    width: 600px;
    padding: 20px;
    box-sizing: border-box;
    position: relative;
}

.detail-info .inner .main-box .info h2{
    color: #8b7dbe;
    display: inline;
}

.detail-info .inner .main-box .info .material-icons{
    position: absolute;
    color: #e4d4fa;
    font-size: 32px;
    cursor: pointer;
}
.detail-info .inner .main-box .info .material-icons.like{
    right: 70px;
}

.detail-info .inner .main-box .info .material-icons.like:hover{
    color: #8b7dbe;
}

.detail-info .inner .main-box .info .material-icons.share{
    right: 20px;
}

.detail-info .inner .main-box .info .material-icons.share:hover{
    color: #8b7dbe;
}

h2 {
  text-align: center;
  display: inline;
}
.info .modal_btn {
  background-color: #f6f5f0;
  border: none;
  border-radius: 5px;
  color: #8b7dbe;
  cursor: pointer;
}

/*모달 팝업 영역 스타일링*/
.info .modal {
  /*팝업 배경*/
  display: none; /*평소에는 보이지 않도록*/
  /* position: absolute;
    top:0;
    left: 0; */
  position: fixed;
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
  margin: auto;
  width: 100%;
  height: 100%;
  overflow: hidden;
  background: rgba(0, 0, 0, 0.5);
  z-index: 10;
}

.info .modal .modal_popup {
  /*팝업*/
  display: flex;
  flex-direction: column;
  flex-wrap: nowrap;
  position: absolute;
  text-align: center;
  width: 200px;
  height: 150px;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  padding: 20px;
  background: #f6f5f0;
  border-radius: 20px;
  z-index: 11;
}
.info .modal .modal_popup .close_btn {
  display: block;
  padding: 10px 20px;
  background-color: #e4d4fa;
  border: none;
  border-radius: 5px;
  color: #8b7dbe;
  cursor: pointer;
  transition: box-shadow 0.2s;
  position: relative;
  top: 30px;
}

.info .modal.on {
  display: block;
}

h3 {
  margin: 10px 0 10px 0;
  color: #8b7dbe;
}

.info .modal .modal_popup img {
  width: 30px;
  height: 30px;
}

.info .modal .modal_popup a {
  width: 30px;
  position: relative;
  margin: 10px;
}

.info .modal .modal_popup .share {
  display: flex;
  align-items: center;
  justify-content: space-evenly;
  height:50px;
}


.detail-info .inner .main-box .info table{
    width: 500px;
    height: 250px;
    margin-top:15px;
}

.detail-info .inner .main-box .info table th{
    width: 110px;
    font-size: 20px;
    color: #8b7dbe;
}

.detail-info .inner .main-box .info table td{
    font-size: 20px;
    line-height: 48px;
}

.detail-info .inner .main-box .info .material-icons.star{
    cursor: default;
    position: relative;
    top:6px;
    margin-right:5px;
}


.detail-info .inner .main-box .info button:hover{
    background-color: #8b7dbe;
    color:white;
}

 

.detail-info .inner .main-box #map{
    border: 1px solid #e4d4fa;
    width: 400px;
    height: 350px;
    margin: 40px;
    margin-left: 10px;
}

/* sample slide */
.main-slide{

    position: absolute;
    top: 1250px;
    left: 0;
    right: 0;
    box-sizing: border-box;
    
}

.main-slide .inner{
    border: 3px solid #e4d4fa;
    border-radius: 25px;
    box-sizing: border-box;
}

.main-slide .inner .title{
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


.main-slide .inner .swiper-container{
    background-color: #f6f5f0;
    border-radius: 0 0 25px 25px;
}

.main-slide .inner .swiper-pigination{

}

.main-slide .inner .swiper-prev{
    cursor: pointer;
    position: absolute;
    left: -50px;
    top: 180px;
    border: 3px solid #e4d4fa;
    display: flex;
    border-radius: 100%;
    
}

.main-slide .inner .swiper-prev .material-icons,
.main-slide .inner .swiper-next .material-icons{
    
    font-size: 35px;
    color: #e4d4fa;
}


.main-slide .inner .swiper-next{
    cursor: pointer;
    position: absolute;
    right: -50px;
    top: 180px;
    border: 3px solid #e4d4fa;
    display: flex;
    border-radius: 100%;
}



.main-slide .inner .swiper-container .swiper-wrapper{
    display: flex;
    
    
    border-bottom-left-radius: 25px;
    border-bottom-right-radius: 25px;

}

.main-slide .inner .swiper-container .swiper-wrapper .swiper-slide{
    
    
    border-radius: 25px;
    
}

.main-slide .inner .swiper-container .swiper-wrapper .swiper-slide a{
    
}

.main-slide .inner .swiper-container .swiper-wrapper .swiper-slide p{
    text-align: left;
    font-weight: 700;
    padding-left: 20px;
    color: #333;
    
}


.main-slide .inner .swiper-container .swiper-wrapper .swiper-slide img{
    width: 250px;
    height: 250px;
    margin: 10px;
    border-radius: 25px;
    
}

/* INTRODUCE */

.introduce{

}

.introduce .inner{
    height: auto;
    top: 1620px;
    border-radius: 10px;
    background-color: #f6f5f0;
}

.introduce .inner .title{
    height: 150px;
    box-sizing: border-box;
    padding-left: 50px;
    padding-top: 20px;
    font-size: 45px;
    color: #8b7dbe;
}

.introduce .inner .content{

}

.introduce .inner .content img{
    width: 900px;
    height: 500px;
    margin: auto;
    margin-bottom: 40px;
}

.introduce .inner .explanation{
    height: 500px;
    
}

.introduce .inner .explanation textarea{
    width: 900px;
    height: 400px;
    font-size: 18px;
    margin-left: 98px;
    text-align: left;
    border: none;
    background-color: transparent;
    outline: none;
    text-align: left;
    resize: none;
}





/* REPLYS */
.comment{
    /* display: block; */
    width:1100px;
    margin: 50px auto;
    border-radius: 20px;
    background-color: #f6f5f0;
    position: relative;
    top:1650px;
}

.comment .comment-title{
    background-color: #e4d4fa;
    border-radius: 20px 20px 0 0;
    height: 61px;
}

.comment h2{
    display: inline;
    width: 100px;
    padding-top: 40px;
    padding-left: 50px;
    text-align: left;
    line-height: 3;
}

.comment .load{
	position:absolute;
	bottom:30px;
	left:450px;
	width:200px;
	height:50px;
}

.comment #modalBtn{
    margin-left: 72%;
}

.comment-area{
    background-color: #e4d4fa;
    width: 80%;
    height: 150px;
    margin-left: 10%;
    margin-top: 20px;
    position: relative;
    border-radius: 5px;
    display:none;
}

.comment-area .profile{
    /* background-color: yellow; */
    width: 100%;
    height: 50px;
}

.comment-area .profile-top{
    line-height: 3;
}

.comment-area .profile #nickname, #date{
    display: inline;
    margin-left: 20px;
    line-height: 3;
}

.comment-area #edit{
    display: inline;
    margin-left: 70%;
    
}

.comment-area #edit span{
    color: black;
    text-decoration: none;
    cursor:pointer;
}

.comment-area #edit span:hover{
	color:#fff;
}

.comment-area #score{
    margin-left: 20px;
}

.comment-area #review{
    margin-top: 5%;
    width: 90%;
    margin-left: 5%;
}

.comment .text-area{
    background-color: #fff;
    width: 800px;
    height: 50px;
    margin: auto;
    border-radius: 5px;
    line-height: 3;
}

.load{
	background-color:#e4d4fa;
	border:none;
	color:#333;
	border-radius:15px;
	font-family:'TTLaundryGothicB';
	cursor:pointer;
}

.load:hover{
	background-color:#8b7dbe;
	color:#fff;
}

/* * {
    box-sizing: border-box;
  } */
  
.comment-modal {
    /* 스타일 - customize */
    background-color: rgba(0, 0, 0, 0.7);
    pointer-events: none;
    padding: 20px;
    /* 트랜지션 효과 */
    transition: opacity 0.3s ease-in-out;
    opacity: 0;
    /* 화면 전체를 덮게하는 코드 */
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    /* 중앙에 오게하는 코드 */
    display: flex;
    justify-content: center;
    align-items: center;
    z-index: 9;
}

.modal-content {
    /* 스타일 - customize */
    max-width: 500px;
    width: 100%;
    height: 150px;
    background-color: white;
    padding: 20px;
    border-radius: 5px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
/* 트랜지션 효과 */
    opacity: 0;
    transition: opacity 0.3s ease-in-out, transform 0.3s ease-in-out;
    transform: scale(0.8);
}

.comment-modal.show {
    /* 모달이 열렸을 때 보여지게 하는 코드 */
    opacity: 1;
    pointer-events: auto;
}

.comment-modal.show .modal-content {
    /* 모달이 열렸을 때 보여지게 하는 코드 */
    opacity: 1;
    transform: scale(1);
    z-index: 10;
}

.close{
    color: #aaa;
    float: right;
    font-size: 28px;
    font-weight: bold;
    cursor: pointer;;
}

.close:hover {
    color: black;
}

.comment-modal .modal-content .star-content{
    border: 1px solid black;
    width: 490px;
    height: 100px;
    margin-top: 10px;
    font-size:18px;
    font-family:'TTLaundryGothicB';
}

.textLimit{
	text-align:right;
}

.textCount, .textTotal{
	display:inline;
	margin: 2px auto;
}

.comment-modal .modal-content .star{
    width: 250px;
    display: inline;
}

.comment-modal .modal-content .star-btn{
    display: inline;
}

.score{
	color:yellow;
	position:relative;
	top:6px;
}

#modalBtn{
    background-color: #e4d4fa;
    border: 1px solid #8B7DBE;
    border-radius: 5px;
    width: 80px;
    height: 25px;
    cursor: pointer;
}
.comment .waste{
    height: 100px;
    background-color: #f6f5f0;
    border-radius: 10px;
}

footer .inner{
    display: block;
    color: #8b7dbe;
    height: 100px;
    font-size: 15px;
    padding: 20px 0 20px 0;
    top: 1700px;
    width: 100%;
    height: 80px;
}   


footer .menu{
    list-style-type: none;
    display: flex;
    justify-content: center;
}

footer .menu li{
    position: relative;
}

footer .menu li::before{
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
footer .menu li:last-child::before{
    display: none;
}

footer .menu li a{
    font-size: 12px;
    padding: 5px 15px; 
    display: block;
}


footer .inner .info{
    list-style-type: none;
    padding: 0;
    margin: auto;
    display: flex;
    justify-content: center;
    align-items: center;
}

footer .info span{
    margin-right: 20px;
    font-size: 12px;
}

footer .info span:last-child{
    margin-right: 0;
}

footer .inner .info .copyright{
    display: flex;
    align-items: center;
}

</style>
</head>
<body>

	<%@ include file="../common/menubar.jsp" %>
	<%@ include file="../common/badge.jsp" %>
	<%@ include file="../common/top.jsp" %>
    <section class="detail-info">
        <div class="inner">
            <div class="main-box">
                <div class="main-img">
                    <div class="swiper-container">
                        <div class="swiper-wrapper">
                        	<% for(Attachment at : list){ %>
	                            <div class="swiper-slide">
	                                    <img src="<%= at.getFilePath() + at.getOriginName() %>" alt="">
	                            </div>
	                        <% } %>
                        </div>
                    </div>
                    <div class="swiper-pagination"></div>
                    <div class="detail">
                        <div class="info">
                            <h2><%= p.getPlaceTitle() %></h2>
                            <div class="material-icons like" onclick="insertLikeList()">thumb_up</div>
                            <div class="material-icons share modal_btn">share</div>

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
          					
          					<script>
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
	          				    
	          				    
          					</script>

							<table>
                                <tr>
                                    <th>별점</th>
                                    <td style="display:flex"><div class="material-icons star">star</div> <div><%= p.getScore() %></div></td>
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
                        <script type="text/javascript" src="https://oapi.map.naver.com/openapi/v3/maps.js?ncpClientId=lm9hxz6gtq"></script>
                        <div id="map">
                            지도
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
<!-- 비슷한 가게 슬라이드 -->
<section class="main-slide">
    <div class="inner">
        <div class="title">비슷한 놀거리</div>
        <div class="swiper-container">
            <div class="swiper-wrapper">
            	<% for(Play pl : sList){ %>
	                <div class="swiper-slide">
	                    <a href="<%= contextPath %>/detail.pl?bno=<%= pl.getPlaceNo() %>">
	                        <img src="<%= pl.getTitleImg() %>" alt="">
	                    </a>
	                    <p><%= pl.getPlaceTitle() %></p>
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


   <div class="comment">
        <div class="comment-title">
        <h2>한줄평</h2>
  
        <!-- 모달 들어갈곳 -->
        <!-- 모달 버튼 -->
        <% if(loginUser != null){ %> 
        	<button id="modalBtn">작성하기</button>
        	<input type="hidden" id="userNo" value="<%= loginUser.getUserNo() %>">
        <% } %>
        </div>  
        <!-- 모달 창 -->
        <div id="myModal" class="comment-modal">
          <div class="modal-content">
            <span class="close" id="closeBtn">&times;</span>
            <p class="star">
              별점
              1<input type="radio" name="score" value="1" checked>
              2<input type="radio" name="score" value="2">
              3<input type="radio" name="score" value="3">
              4<input type="radio" name="score" value="4">
              5<input type="radio" name="score" value="5">
            </p>
            	<input type="button" value="등록" class="star-btn" onclick="insertReply()">
            <br>
            <textarea name="replyContent" id="" class="star-content" style="resize: none;" placeholder="입력하세요." required maxlength='35'></textarea>
            <div class="textLimit">
            <p class="textCount">0자</p> / <p class="textTotal">35자</p>
            </div>
          </div>
        </div>
  
  		<div class="replys">
        
        </div>
        <button class='load'>더보기</button>
	     <div class="waste"></div>
	     </div>

            <script>
            
            $('.star-content').keyup(function(e){
            	let content = $(this).val();
            	
            	if(content.length === 0 || content === ""){
            		$(".textCount").text("0자");
            	}else{
            		$(".textCount").text(content.length + "자");
            	}
            })
            

            
            $(function(){
            	selectReply();
            	selectScore();
            	likeStatus();
            	setInterval(selectReply,100000);
            })
            
            function showReply(){
                $(".comment .comment-area").slice(0,3).show();
                $(".load").click(function(e){
                    e.preventDefault();
                    $(".comment .comment-area:hidden").slice(0,3).show();
                    if($(".comment .comment-area:hidden").length == 0){
                        $(".load").hide();
                    }else{
                        $(".load").show();
                    }
                })
            }
	        
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
            
            function selectScore(){
            	$.ajax({
            		url:"ajaxScore.as",
            		data:{bno:"<%= p.getPlaceNo() %>"},
            		success:function(result){
            			if(result !== null){
            				$(".info table tbody tr:first-child td *").eq(1).text(result)
            			}
            		},
            		error:function(){
            			
            		},
            	})
            }
            <% if(loginUser != null){ %>
	            function test(event){
	            	if(confirm("정말로 신고하시겠습니까?")){
	            		$.ajax({
	            			url:"reportComment.rc",
	            			data:{
	            				bno:"<%= p.getPlaceNo() %>",
	            				comNo:$(event).next().val(),
	            				userId:$(event).parent().prev().prev().text(),
	            				
	            			},
	            			success:function(result){
	            				if(result > 0){
	            					alert("신고가 접수되었습니다.");
	            				}else{
	            					alert("신고에 실패하였습니다. 다시 시도해주세요.");
	            				}
	            			},
	            			error:function(){
	            				console.log("실패");
	            			},
	            		})
	            	}
		            		            		
	            }
            <% }else{ %>
            	function test(){
            		alert("로그인 후 이용가능합니다.");
            	}
            <% } %>
            
	            
            function selectReply(){
            	$.ajax({
            		url:"ajaxReply.ar",
            		data:{
            			placeNo : "<%= p.getPlaceNo() %>",
            		},
            		success:function(result){
            			let value = "";
            			for(let i = 0; i<result.length;i++){
            				value += "<div class='comment-area'><div class='profile'><div id='nickname'>"
            				+  result[i].userId + 
            				"</div><div id='date'>" 
            				+  result[i].createDate +
            				"</div><div id='edit'><span onclick='test(this);'>신고</span><input type='hidden' value='"+result[i].commentNo+"'> </div><div id='score'><div class='material-icons score'>star</div> " 
            				+ result[i].score + 
            				"</div></div><div class='text-area'><div id='review'>" 
            				+ result[i].comment + 
            				"</div></div></div>";
            			}
            			$(".replys").html(value);
            			showReply();
            			 if($(".comment .comment-area:hidden").length == 0){
                             $(".load").hide();
                         }else{
                             $(".load").show();
                         }
            		},
            		error:function(){
            			console.log("통신 실패");
            		}
            	})
            }
	            
	            
	            function insertReply(){           	
	            	$.ajax({
	            		url:"insertReply.ar",
	            		data:{
	            			userNo:$("input[type=hidden]").val(),
	            			star:$("input[type=radio]:checked").val(),
	            			content: $(".star-content").val(),
	            			placeNo: "<%= p.getPlaceNo() %>"
	            		},
	            		success:function(result){
	            			if(result > 0){
	            				var modal = document.getElementById("myModal");
	            				selectReply();
	            				selectScore();
	            				alert("댓글 등록이 완료되었습니다.");
	            				modal.classList.toggle("show");
	            				$(".star-content").val("");
	            			}
	            		},
	            		error:function(){
	            			console.log("통신 실패")
	            		},
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
                
				    new Swiper('.main-box .main-img .swiper-container',{
				    slidesPerView: 1, // 한번에 보여줄 슬라이드 개수
				    spaceBetween: 10, // 슬라이드 사이 여백
				     // 1번 슬라이드가 가운데 보이기
				    loop:false,
				    // autoplay: {
				    //     delay : 5000,
				    // },
				    pagination:{
				        el : '.main-box .main-img .swiper-pagination', // 페이지 번호 요소 선택자
				        clickable : true, // 사용자의 페이지 번호 요소 제어 가능 여부
				
				    },
				
				
				});
				
				new Swiper('.main-slide .swiper-container',{
				    slidesPerView: 4, // 한번에 보여줄 슬라이드 개수
				    spaceBetween: 10, // 슬라이드 사이 여백
				     // 1번 슬라이드가 가운데 보이기
				    loop:false,
				    // autoplay: {
				    //     delay : 5000,
				    // },
				    pagination:{
				        el : '.main-slide .swiper-pagination', // 페이지 번호 요소 선택자
				        clickable : true, // 사용자의 페이지 번호 요소 제어 가능 여부
				
				    },
				    navigation : {
				        prevEl : '.main-slide .swiper-prev',
				        nextEl : '.main-slide .swiper-next',
				    }
				
				});
				
            </script>
            <div class="waste"></div>
        </div>
    </section>
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
      </script>
      <script>
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
	  
	  

	
	  
	   

		</script>
</body>
</html> 