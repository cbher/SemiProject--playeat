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
          <div class="question" onclick="toggleAnswer(1)">문의사항 확인은 어떻게 하나요?</div>
          <div class="answer" id="answer1">문의사항 확인하는 방법은 로그인 후 공지/문의 메뉴에서 문의사항 클릭, 본인이 작성한 문의사항을 이메일로 인증하고 확인할수 있습니다. </div>
        </div>
        <div class="faq">
          <div class="question" onclick="toggleAnswer(2)">놀거리, 먹거리 메인페이지는 어떻게들어가나요?</div>
          <div class="answer" id="answer2">메뉴에서 놀거리, 먹거리를 누르면 들어가실수 있습니다.</div>
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

   
<%@include file="../common/footer.jsp" %>

    <script>
      // footer this-year (현재년도 표시)
      const thisYear = document.querySelector("#this-year");
      thisYear.textContent = new Date().getFullYear();
    </script>
  </body>
</html>
