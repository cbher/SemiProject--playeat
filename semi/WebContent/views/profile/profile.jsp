<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <style>
        body, h1, h2, h3, h4, h5, h6, p, ul, li, div, a {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            font-family: Arial, sans-serif;
            background-color: #f6f5f0;
        }
        .inner {
            width: 1100px;
            margin: 0 auto;
            position: relative;
        }
        img {
            display: block;
        }
        a {
            text-decoration: none;
            color: inherit;
        }

        /* Header */
        header {
            width: 100%;
            top: 0;
            z-index: 9;
            background-color: #f6f5f0;
            padding-bottom: 20px;
        }
        header > .inner {
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
            margin: 50px auto 0;
            background-color: #f6f5f0;
            padding-bottom: 50px;
        }
        #content {
            background-color: #ffffff;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
            margin-bottom: 50px;
        }
        #content_title {
            text-align: center;
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 20px;
        }
        #profile_picture {
            display: flex;
            flex-direction: column;
            align-items: center;
            margin-bottom: 30px;
        }
        #profile_picture img {
            width: 200px;
            height: 200px;
            border-radius: 50%;
            background-color: #e2e2e2;
            margin-bottom: 10px;
        }
        #profile_picture button {
            background-color: transparent;
            border: none;
            cursor: pointer;
        }
        #profile_picture button img {
            width: 50px;
            height: 50px;
        }
        form {
            display: flex;
            flex-direction: column;
            gap: 20px;
        }
        label {
            font-weight: bold;
            margin-bottom: 5px;
        }
        input[type="text"], input[type="file"], textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        textarea {
            resize: none;
            height: 100px;
            
        }
        #nickname_section {
            display: flex;
            align-items: center;
            width: 300px;
            
        }
        #nickname_section input {
            flex-grow: 1;
            
        }
        button {
            padding: 10px 20px;
            background-color: #ff7f50;
            border: none;
            color: white;
            font-weight: bold;
            cursor: pointer;
            border-radius: 5px;
        }
        button:hover {
            background-color: #e67350;
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
            <a href="#" class="logo">
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
                    <li><a href="#">마이페이지</a></li>
                    <li><a href="#">찜 리스트</a></li>
                    <li><a href="#">캘린더</a></li>
                    <li><a href="#">프로필 수정</a></li>
                    <li><a href="#">회원정보 수정</a></li>
                </ul>
            </div>
        </section>
    </header>

    <div id="wrap">
        <div id="content">
            <div id="content_title">프로필 수정</div>

            <div id="profile_picture">
                <img src="" >
                <button>
                    <img src="./resourse/camera_icon.png" >
                    <input type="file">
                </button>
            </div>

            <form>
                <div id="nickname_section">
                    <label for="nickname">닉네임 변경</label>
                    <input type="text" id="nickname" required>
                    <button type="button">중복확인</button>
                </div>

                <div>
                    <label for="intro">자기소개</label>
                    <textarea id="intro" maxlength="35"></textarea>
                </div>

                <button type="submit">변경 내용 저장</button>
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