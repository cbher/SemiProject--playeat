<%@page import="java.util.ArrayList"%>
<%@page import="semi.play.model.vo.Play"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%

	
	


%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>badge</title>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    

<style>
   
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
    
    display: inline;
}

.place:hover .badge-title {
    opacity: 1;
  }


</style>

</head>
<body>

     <div class="badge">
        <div class="text">최근 본 장소</div>
	       <c:forEach var="play" items="${sessionScope.recentPlaces}">
	        <a href="/semi/detail.pl?bno=${play.placeNo}" class="place">
	          <img src="${pageContext.request.contextPath}/${play.titleImg}" alt="${play.placeTitle} 이미지">
	            <div class="badge-title">
	                <h4>${play.placeTitle}</h4>
	            </div>
	        </a>
	    </c:forEach>
	    
    </div>

	<script>
	let quickMenu = $('.badge');
	const DURATION = 900; // 이동 애니메이션 시간

	function positionQuickMenu() {
	    let windowHeight = $(window).height();
	    let quickMenuHeight = quickMenu.height();
	    
	    // 화면의 중앙 위치를 계산
	    let point = ($(window).scrollTop() + (windowHeight / 2)) - (quickMenuHeight / 2);

	    point -= 30;

	    quickMenu.stop().animate({ top: point }, DURATION);
	}

	$(window).scroll(function() {
	    positionQuickMenu(); // 스크롤할 때마다 중앙에 맞춰 이동
	});

	$(window).resize(function() {
	    positionQuickMenu(); // 창 크기가 변경될 때도 중앙에 재배치
	});

	$(document).ready(function() {
	    positionQuickMenu(); // 페이지 로드 시 중앙에 배치
	});
	</script>
	

	
	
</body>
</html>