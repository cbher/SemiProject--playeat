<%@page import="semi.common.PageInfo"%>
<%@page import="semi.cooking.model.vo.CookingBoard"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<CookingBoard> list = (ArrayList<CookingBoard>)request.getAttribute("list");
	// 글번호, 글 제목, 글 내용, 대표이미지 (파일 경로 + 수정명)
	
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link rel="stylesheet" href="https://unpkg.com/swiper@6.8.4/swiper-bundle.min.css" />
    <script src="https://unpkg.com/swiper@6.8.4/swiper-bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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
.post .inner .cooking li a .title{
    text-align: center;
    marging-top:10px;
}

.post .inner .cooking li a .count{
    text-align: right;
}

.post .inner .paging-area{
	margin-top:50px;
}

.footer .inner{
	top:1000px;
}
</style>

</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	<%@ include file="../common/badge.jsp" %>
	        <section class="main-slide">
            <div class="inner">
                <div class="title">최신 게시글</div>
                <div class="swiper-container">
                    <div class="swiper-wrapper">
                        <% for (int i = 0 ; i<list.size();i++){ %>
	                         <div class="swiper-slide">
	                            <a href="<%= contextPath %>/detail.co?bno=<%= list.get(i).getcBoardNo()%>">
	                                <img src="<%= list.get(i).getTitleImg() %>" alt="">
	                            </a>
	                            <p><%= list.get(i).getcBoardTitle() %></p>
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
                
                <div class="swiper-prev">
                    <div class="material-icons">arrow_back</div>
                </div>
                <div class="swiper-next">
                    <div class="material-icons">arrow_forward</div>
                </div>
            </div>
			<script defer>
				new Swiper('.main-slide .swiper-container',{
				    slidesPerView: 4, // 한번에 보여줄 슬라이드 개수
				    spaceBetween: 10, // 슬라이드 사이 여백
				     // 1번 슬라이드가 가운데 보이기
				    loop:true,
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
        </section>

        <section class="post">
            <div class="inner">
                <h2>요리게시판</h2>
                <div>
                	<button class="button" onclick="enrollForm()">작성하기</button>
                </div>
                <ul class="cooking">
                	<% for(int i = 0; i < list.size(); i++){ %>
	                    <li>
	                        <a href="<%= contextPath %>/detail.co?bno=<%= list.get(i).getcBoardNo()%>">
	                            <img src="<%= list.get(i).getTitleImg() %>" alt="">
	                            <div class="title"><b style="font-size: 18px;"><%= list.get(i).getcBoardTitle() %></b></div>
	                            <div class="count">조회수 : <%= list.get(i).getCount() %></div>
	                        </a>
	                    </li>
	                <% } %>
                </ul>
                <div class="paging-area" align="center">
                	<% if(currentPage != 1){ %>
            			<button onclick="location.href='<%= contextPath %>/list.bo?cpage=<%= currentPage - 1 %>'">&lt;</button>
            		<%} %>
            		<% for(int p = startPage; p<=endPage;p++){ %>
            			<% if(p == currentPage){ %>
            				<button disabled><%= p %></button>
            			<% } else{ %>
            				<button onclick="location.href='<%= contextPath %>/list.bo?cpage=<%= p %>'"><%= p %></button>
            		<% } %>
				<% } %>
            
            <% if(currentPage != maxPage) {%>
            	<button onclick="location.href='<%= contextPath %>/list.bo?cpage=<%= currentPage + 1 %>'">&gt;</button>
        	<% } %>
                </div>
            </div>
        </section>
        <script>
            function enrollForm(){
                location.href = "<%= contextPath %>/cookingEnrollForm.co";
            }
        </script>
    </div>
    <%@ include file="../common/footer.jsp" %>
</body>
</html>