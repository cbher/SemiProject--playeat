<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
  </head>

  <style>
    footer .inner {
      display: block;
      color: #8b7dbe;
      height: 100px;
      font-size: 15px;
      padding: 20px 0 20px 0;
      top: 100%;
      width: 100%;
      height: 80px;
      margin:auto;
    }

    footer .menu {
      list-style-type: none;
      display: flex;
      justify-content: center;
    }

    footer .menu li {
      position: relative;
    }

    footer .menu li::before {
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
    footer .menu li:last-child::before {
      display: none;
    }

    footer .menu li a {
      font-size: 12px;
      padding: 5px 15px;
      display: block;
    }

    footer .inner .info {
      list-style-type: none;
      padding: 0;
      margin: auto;
      display: flex;
      justify-content: center;
      align-items: center;
    }

    footer .info span {
      margin-right: 20px;
      font-size: 12px;
    }

    footer .info span:last-child {
      margin-right: 0;
    }

    footer .inner .info .copyright {
      display: flex;
      align-items: center;
    }
  </style>
  <body>
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
            &copy; <span id="this-year"></span> kh정보교육원 H반 4조
            세미프로젝트
          </p>
        </div>
      </div>
    </footer>

    <script>
      // footer this-year (현재년도 표시)
      const thisYear = document.querySelector("#this-year");
      thisYear.textContent = new Date().getFullYear();
    </script>
  </body>
</html>
