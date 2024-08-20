<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import = "com.member.model.vo.Member" %>
<%@page import = "com.mypage.myInquire.model.vo.Inquire" %>

<% 
	ArrayList<Inquire> list = (ArrayList<Inquire>)request.getAttribute("inquireList");
	String contextPath = request.getContextPath();
	String alertMsg = (String)session.getAttribute("alertMsg");
%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <style>
        body,h1,h2,h3, h4, h5, h6, p, ul,li, div, a {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            background-color: #f6f5f0;
        }

        img {
            display: block;
        }

        a {
            text-decoration: none;
            color: inherit;
        }

        .inner {
            width: 1100px;
            margin: 0 auto;
            position: relative;
        }

        /* --------------------------헤더 부분 ----------*/
        header {
            width: 100%;
            background-color: #f6f5f0;
            padding-bottom: 20px;
        }

        header>.inner {
            height: 120px;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        header .inner a img {
            height: 80px;
        }

        header .inner .login ul {
            display: flex;
            gap: 15px;
            list-style: none;
        }

        header .inner .login ul li {
            font-size: 11px;
            font-weight: 700;
        }

        /* Menubar */
        .menubar {
            background-color: #f6f5f0;
            padding: 10px 0;
        }

        .menubar .menu .inner {
            display: flex;
            justify-content: space-between;
        }

        .menubar .menu .inner li {
            list-style: none;
            position: relative;
        }

        .menubar .menu .inner li a {
            font-size: 18px;
            font-weight: 700;
            color: #8b7dbe;
            padding: 15px 20px;
            display: block;
        }

        .menubar .menu .inner li a:hover {
            color: purple;
        }

        /* Content */
        #wrap {
            width: 1100px;
            margin: 150px auto 0;
            background-color: #f6f5f0;
            padding-bottom: 50px;
        }

        #content {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
            margin-bottom: 50px;
        }

        #content_title {
            display: flex;
            justify-content: space-around;
            margin-bottom: 20px;
            font-size: 24px;
            font-weight: bold;
        }

        #content_title a {
            padding: 10px 20px;
            background-color: #8b7dbe;
            color: #fff;
            border-radius: 5px;
        }

        #content_title a:hover {
            background-color: #6a5cba;
        }

        .rvbox {
            background-color: #f9f9f9;
            margin-bottom: 20px;
            padding: 15px;
            display: flex;
            border: 1px solid #ddd;
            border-radius: 10px;
        }

        .rvbox_1 img {
            width: 60px;
            height: 60px;
            border-radius: 10px;
            margin-right: 20px;
        }

        .rvbox_2 {
            flex-grow: 1;
        }

        .rvbox_2 div {
            margin-bottom: 5px;
        }

        .rvbox_3 {
            text-align: right;
            color: #777;
        }

        #pgnum {
            text-align: center;
            padding: 20px 0;
        }

        #sort {
            position: absolute;
            right: 20px;
            top: 20px;
        }

        #sort_box {
            display: none;
            position: absolute;
            top: 40px;
            right: 20px;
            background-color: white;
            border: 1px solid #ddd;
            padding: 10px;
            border-radius: 5px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
        }

        #sort_button img {
            width: 20px;
            height: 20px;
        }
        
		.inquire-list{
            border: 1px solid black;
            text-align: center;

        }
        
        footer {
            background-color: #f6f5f0;
            padding: 20px 0;
            text-align: center;
            border-top: 1px solid #ddd;
        }

        footer .inner {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        footer .menu {
            list-style: none;
            display: flex;
            justify-content: center;
            gap: 10px;
            margin-bottom: 10px;
        }

        footer .menu li a {
            font-size: 12px;
        }

        footer .info span {
            font-size: 12px;
            margin: 0 10px;
        }
    </style>

</head>
<body>
	<header>
        <div class="inner">
            <a href="" class="logo">
                <img src="./resourse/play_eat-removebg-preview.png" alt="header_logo">
            </a>
            <div class="profile">
                <div id="picture">
                    프로필 사진이 위치할 예정
                </div>
            </div>
            <div class="login">
                <ul>
                    <li><a href="">로그인</a></li>
                    <li><a href="">회원가입</a></li>
                </ul>
            </div>
        </div>
        <section class="menubar">
            <div class="menu">
                <ul class="inner">
                    <li><a href="">마이페이지</a></li>
                    <li><a href="">찜 리스트</a></li>
                    <li><a href="">캘린더</a></li>
                    <li><a href="">프로필 수정</a></li>
                    <li><a href="">회원정보 수정</a></li>
                </ul>
            </div>
        </section>
    </header>

    <div id="wrap">
        <div id="content">
            <div id="content_title">
                <a href="#">내 문의내역</a>
               

            </div>
            <div id="sort">
                <button id="sort_button">
                    <img src="/마이페이지/resource/프로젝트 로고.png" alt="정렬 버튼">
                </button>
                <div id="sort_box">
                    <button>정렬 기준</button><br>
                    <button>날짜 순</button><br>
                    <button>좋아요 순</button><br>
                    <button>댓글 순</button>
                </div>
            </div>
            
            
            
             <table class="inquire-list">
            <thead>
                <tr>
                    <th width="70">번호</th>
                    <th width="80">제목</th>
                    <th width="100">작성자</th>
                    <th width="50">작성일</th>
                    <th width="100">답변여부</th>
                </tr>
            </thead>

            <tbody>
                <!--
                <tr>
                    <td colspan="5">조회된 게시글이 없습니다.</td>
                </tr>
                -->
				
				<% for(Inquire i : list)  {%>
                <tr>
                    <td><%=i.getInquireNo()%></td>
                    <td><%=i.getInquireTitle()%></td>
                    <td><%=i.getInquireWriter() %></td>
                    <td><%=i.getCreateDate() %></td> 
                    <td><%=i.getStatus() %></td>

                </tr>
                <% }%>
            </tbody>
        </table>
            
        

        <footer>
            <div class="inner">
                <ul class="menu">
                    <li><a href="">개인정보처리방침</a></li>
                    <li><a href="">이용약관</a></li>
                    <li><a href="">위치정보이용약관</a></li>
                    <li><a href="">원클래스약관</a></li>
                </ul>
                <div class="info">
                    <span>kh H반 4조</span>
                    <span>semi4jyo@gmail.com</span>
                    <span>개인정보 책임자 4조</span>
                </div>
                <p class="copyright">
                    &copy; <span id="this-year"></span> kh정보교육원 H반 4조 세미프로젝트
                </p>
            </div>
        </footer>
    </div>
</body>


<!--스크립트들--------------------------->
<script>
    document.addEventListener("DOMContentLoaded", function () {
        const sortButton = document.getElementById("sort_button");
        const sortBox = document.getElementById("sort_box");

        sortButton.addEventListener("click", function () {
            sortBox.style.display = sortBox.style.display === "none" ? "block" : "none";
        });
    });
</script>
	
</body>
</html>