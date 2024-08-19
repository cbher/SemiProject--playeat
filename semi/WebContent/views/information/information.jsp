<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%


String contextPath = request.getContextPath();

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>information</title>

 <style>
        body,  h1, h2, h3,  h4, h5, h6,  p,  ul, li, div, a {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
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
            background-color: #f4f4f4;
            padding-bottom: 50px;
        }

        #account_management {
            margin-top: 20px;
            padding: 20px;
            background-color: #e2e2e2;
            width: 600px;
            margin: 0 auto;
        }

        #account_management h2 {
            text-align: center;
        }

        form {
            display: flex;
            flex-direction: column;
            gap: 10px;
        }

        label {
            font-weight: bold;
            display: inline-block;
            margin-bottom: 5px;
        }

        input[type="text"],
        input[type="password"],
        input[type="email"],
        select {
            width: calc(100% - 120px);
            padding: 10px;
            margin: 5px 0;
            border: 1px solid #ccc;
            display: inline-block;
            vertical-align: middle;
        }

        button {
            width: 100px;
            padding: 10px;
            margin-left: 10px;
            display: inline-block;
            vertical-align: middle;
            cursor: pointer;
        }

        #actions {
            display: flex;
            justify-content: space-between;
        }

        #withdrawal {
            text-align: right;
            margin-top: -40px;
        }

        #withdrawal button {
            cursor: pointer;
        }

        /* Footer */
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
                    <li><a href="<%=contextPath%>">마이페이지</a></li>
                    <li><a href="">찜 리스트</a></li>
                    <li><a href="">캘린더</a></li>
                    <li><a href="">프로필 수정</a></li>
                    <li><a href="">회원정보 수정</a></li>
                </ul>
            </div>
        </section>
    </header>

    <div id="wrap">
        <div id="account_management">
            <h2>내 계정</h2>
            <div id="withdrawal">
                <button onclick="withdrawAccount()">회원탈퇴</button>
            </div>
            <form id="account_form">
                <div>
                    <label for="nickname">* 닉네임 변경</label><br>
                    <input type="text" id="nickname" required>
                    <button type="button" onclick="checkNickname()">중복 확인</button>
                </div>
                <div>
                    <label for="name">* 이름</label><br>
                    <input type="text" id="name" required>
                </div>
                <div>
                    <label for="password">* 비밀번호 변경</label><br>
                    <input type="password" id="password" required>
                </div>
                <div>
                    <label for="password_confirm">* 비밀번호 일치 확인</label><br>
                    <input type="password" id="password_confirm" required>
                </div>
                <div>
                    <label for="phone">* 전화번호</label><br>
                    <input type="text" id="phone" required>
                </div>
                <div>
                    <label for="email">* 이메일 변경</label><br>
                    <input type="email" id="email" required>
                    <button type="button" onclick="requestEmailVerification()">인증 요청</button>
                </div>
                <div>
                    <label for="email_code">이메일 인증 코드</label><br>
                    <input type="text" id="email_code">
                </div>
                <div>
                    <label for="address">* 주소 변경</label><br>
                    <select id="address">
                        <option value="서울" id="">서울</option>
                        <option value="경기" id="">경기</option>
                        <option value="인천">인천</option>
                        <option value="대전">대전</option>
                        <option value="부산">부산</option>
                    </select>
                </div>
                <div id="actions">
                    <button type="button" onclick="applyChanges()">적용</button>
                    <input type="reset" value="취소">
                </div>
            </form>
        </div>

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
</html>