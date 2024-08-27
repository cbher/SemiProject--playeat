<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
    <style>
      .manyAsked {
        margin: auto;
        margin-top: 240px;
        text-align: center;
        align-items: center;
      }

      .manyAsked .faq {
        margin: auto;
        margin-bottom: 10px;
        width: 600px;
        margin-left: 250px;
      }

      .manyAsked .question {
        border-radius: 15px 15px 0 0;
      }

      .manyAsked .answer {
        border-radius: 0 0 15px 15px;
      }

      .manyAsked .question {
        background-color: #f1f1f1;
        padding: 10px;
        cursor: pointer;
        border: 1px solid #ccc;
      }

      .manyAsked .answer {
        display: none;
        padding: 10px;
        border: 1px solid #ccc;
        border-top: none;
        animation: box-ani 2s linear;
      }

      .answer {
        display: none;
        opacity: 0;
        max-height: 0;
        overflow: hidden;
        transition: opacity 0.5s ease-in-out, max-height 0.5s ease-in-out;
      }

      footer .inner {
        display: block;
        color: #8b7dbe;
        height: 100px;
        font-size: 15px;
        padding: 20px 0 20px 0;
        top: 200px;
        width: 100%;
        height: 80px;
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
  </head>
  <body>
    <%@include file="../common/menubar.jsp" %>

    <div class="inner">
      <div class="manyAsked">
        <h2>자주하는 질문</h2>
        <div class="faq">
          <div class="question" onclick="toggleAnswer(1)">1: 질문입니다?</div>
          <div class="answer" id="answer1">답변입니다.</div>
        </div>
        <div class="faq">
          <div class="question" onclick="toggleAnswer(2)">2: 질문입니다?</div>
          <div class="answer" id="answer2">답변입니다</div>
        </div>
        <div class="faq">
          <div class="question" onclick="toggleAnswer(3)">3: 질문입니다?</div>
          <div class="answer" id="answer3">답변입니다</div>
        </div>
        <div class="faq">
          <div class="question" onclick="toggleAnswer(4)">4: 질문입니다?</div>
          <div class="answer" id="answer4">답변입니다.</div>
        </div>
        <div class="faq">
          <div class="question" onclick="toggleAnswer(5)">5: 질문입니다?</div>
          <div class="answer" id="answer5">답변입니다</div>
        </div>
        <div class="faq">
          <div class="question" onclick="toggleAnswer(6)">6: 질문입니다?</div>
          <div class="answer" id="answer6">답변입니다</div>
        </div>
      </div>
    </div>
    <script src="script.js"></script>

    <script>
      function toggleAnswer(answerId) {
        const answers = document.querySelectorAll(".answer");

        // 모든 답변 요소를 숨깁니다
        answers.forEach((answer) => {
          answer.style.display = "none";
          answer.style.opacity = 0;
          answer.style.maxHeight = "0px";
        });

        // 클릭된 답변만 표시합니다
        const answer = document.getElementById("answer" + answerId);
        answer.style.display = "block";
        setTimeout(() => {
          answer.style.opacity = 1;
          answer.style.maxHeight = "600px"; // 적절한 max-height 값을 설정
        }, 10);
      }
    </script>

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
