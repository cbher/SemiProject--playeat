<%@page import="semi.cooking.model.vo.Attachment"%>
<%@page import="semi.common.PageInfo"%>
<%@page import="semi.oneday.model.vo.Oneday"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<Oneday> list = (ArrayList<Oneday>)request.getAttribute("list");
	// 글번호, 글제목, 주소, 참여정원, 별점, 가격, 대표이미지경로
	ArrayList<Oneday> popularList = (ArrayList<Oneday>)request.getAttribute("popularList");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
%>  
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>원데이클래스</title>
<style>
	.main-slide{

    position: absolute;
    top: 220px;
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
    width: 250px;
    text-overflow: ellipsis;
    height: 17.5px;
    overflow: hidden;
    white-space: nowrap;
}


.main-slide .inner .swiper-container .swiper-wrapper .swiper-slide a img{
    width: 250px;
    height: 250px;
    margin: 10px;
    border-radius: 25px;
    
}

/* POST */

.post{

}

.post .inner{
	top:600px
}

.post h2{
    padding-left: 20px;
}

select{
    width: 130px;
    height: 30px;
    margin-left: 20px;
    font-family: 'TTLaundryGothicB';
    border: 1px solid #8d7bde;
    outline: none;
}
.post .inner .button{
	position:absolute;
	top:0;
    right: 0;
    background-color: #e4d4fa;
    cursor: pointer;
    border: 1px solid #8b7dbe;
    width: 100px;
    border-radius: 25px;
    font-size: 18px;
    color: #333;
    font-weight: 700;
}

.post .inner .button:hover{
    background-color: #8b7dbe;
}



.post .inner .cooking{
    padding-left: 0;
    display: flex;
    flex-wrap: wrap;
    justify-content: flex-start;
    margin:40px;
}

.post .inner .cooking li{
    list-style: none;
    margin: 20px;
}

.post .inner .cooking li:hover {
    transform: scale(1.1);
    transition: all .4s;
}


.post .inner .cooking li a{
	color: #333;
}

.post .inner .cooking li a img{
    width: 300px;
    height: 250px;
    left: 0;
    border-radius: 25px;
}


.post .inner .cooking li a .count{
    text-align: right;
}

.post .inner .cooking li a .title{
	width: 300px;
    text-overflow: ellipsis;
    height: 21px;
    overflow: hidden;
    white-space: nowrap;	
    margin-top:10px;
}

.post .inner .cooking li a .material-icons{
	color:#e4d4fa;
	font-size:20px;
	padding-top: 10px;
}

.post .inner .paging-area{
	margin-top:50px;
}

.footer .inner{
	top:1000px;
}
</style>
    <link rel="stylesheet" href="https://unpkg.com/swiper@6.8.4/swiper-bundle.min.css" />
    <script src="https://unpkg.com/swiper@6.8.4/swiper-bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
    <section class="main-slide">
        <div class="inner">
            <div class="title">인기있는 클래스</div>
            <div class="swiper-container">
                <div class="swiper-wrapper">
                	<% for(Oneday o : popularList){ %>
	                    <div class="swiper-slide">
	                        <a href="<%= contextPath %>/onedayDetail.on?oneNo=<%= o.getOneNo() %>">
	                            <img src="<%= o.getTitleImg() %>" alt="">
	                        </a>
	                        <p><%= o.getOneTitle() %></p>
	                        
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
	<script defer>
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
    <section class="post">
        <div class="inner">
            <h2>원데이 클래스</h2>
            <ul class="cooking">
            	<% for(Oneday o : list){ %>
	                <li>
	                    <a href="<%= contextPath %>/onedayDetail.on?oneNo=<%= o.getOneNo() %>">
	                        <img src="<%= o.getTitleImg() %>" alt="">
	                        <div class="title"><b style="font-size: 18px;"><%= o.getOneTitle() %></b></div>
	                        <span><div class="material-icons">star</div> <%= o.getScore() %></span>
	                    </a>
	                </li>
	            <% } %>
            </ul>
                            <div class="paging-area" align="center">
                	<% if(currentPage != 1){ %>
            			<button onclick="location.href='<%= contextPath %>/onedayMain.on?cpage=<%= currentPage - 1 %>'">&lt;</button>
            		<%} %>
            		<% for(int p = startPage; p<=endPage;p++){ %>
            			<% if(p == currentPage){ %>
            				<button disabled><%= p %></button>
            			<% } else{ %>
            				<button onclick="location.href='<%= contextPath %>/onedayMain.on?cpage=<%= p %>'"><%= p %></button>
            		<% } %>
				<% } %>
            
            <% if(currentPage != maxPage) {%>
            	<button onclick="location.href='<%= contextPath %>/onedayMain.on?cpage=<%= currentPage + 1 %>'">&gt;</button>
        	<% } %>
                </div>
        </div>
        
        
    </section>
</div>

</body>
</html>