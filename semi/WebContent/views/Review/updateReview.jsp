<%@page import="java.io.Console"%>
<%@page import="semi.Review.model.vo.Attachment2"%>
<%@page import="semi.Review.model.vo.Review"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 
<% 
String placeNo = request.getParameter("placeNo");
String rTitle = request.getParameter("rTitle"); 
Review r = (Review)request.getAttribute("r");
Attachment2 at = (Attachment2)request.getAttribute("at");
%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>리뷰 작성</title>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
    />
    <link
      href="https://fonts.googleapis.com/icon?family=Material+Icons"
      rel="stylesheet"
    />
    <link rel="stylesheet" href="/semi/resources/css/review_form.css" />
  </head>
  <body>
    <%@ include file="../common/menubar.jsp" %>

    <!-- 리뷰 폼 -->

    <div class="review-form">
      <br />
      <h2 align="center">리뷰 수정하기</h2>
      <br />

      <form action="updateReview.re" id="enroll-form" method="post" enctype="multipart/form-data">
        <input type="hidden" name="placeNo" value="<%= placeNo %>" />
        <input type="hidden" name="rTitle" value="<%= rTitle %>" />
        <input type="hidden" name="userNo" value="<%= loginUser.getUserNo() %>"/>
        <input type="hidden" name="rNo" value="<%= r.getrNo() %>"/>
        <input type="hidden" name="score" value="<%= r.getScore() %>"/>
        <table align="center" class="review-area">
          <tr>
            <th>내용</th>
            <td colspan="3">
              <textarea name="rContent" rows="5" style="resize: none; height: 300px" required>
              	<%= r.getrContent() %>
              </textarea>
            </td>
          </tr>
          <tr>
            <th>별점</th>
            <td colspan="3">
              <div class="score">
                1<input type="radio" id="star1" name="score" value="1" checked/>
                2<input type="radio" id="star2" name="score" value="2" />
                3<input type="radio" id="star3" name="score" value="3" />
                4<input type="radio" id="star4" name="score" value="4" />
                5<input type="radio" id="star5" name="score" value="5" />
              </div>
            </td>
          </tr>
          <tr>
            <th>상세이미지</th>
            <td align="center">
              <img id="contentImg1" width="150" height="120" onclick="chooseFile(1)" src="<%= at != null ? at.getFilePath() + at.getChangeName() : "" %>"/>
            </td>
            <td align="center">
              <img id="contentImg2" width="150" height="120" onclick="chooseFile(2)"/>
            </td>
            <td align="center">
              <img id="contentImg3" width="150" height="120" onclick="chooseFile(3)"/>
            </td>
          </tr>
        </table>

        <div id="file-area" style="display: none">
          <!-- 버튼 있지만 안보임 -->
          <input type="file" name="file1" id="file1" onchange="loadImg(this, 1)" required/>
          <input type="file" name="file2" id="file2" onchange="loadImg(this, 2)"/>
          <input type="file" name="file3" id="file3" onchange="loadImg(this, 3)"/>
          <input type="hidden" name="originFileNo" value="<%= at.getFileNo() %>">
        </div>
        <br />
        <div align="center">
          <button type="submit" id="enter-btn">수정하기</button>
        </div>
      </form>
    </div>

    <footer class="footer">
      <div class="inner">
        <ul class="menu">
          <li><a href="">개인정보처리방침</a></li>
          <li><a href=""> 이용약관 </a></li>
          <li><a href="">위치정보이용약관</a></li>
          <li><a href="">원클래스약관</a></li>
        </ul>

        <div class="info3">
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
      function chooseFile(num) {
        $("#file" + num).click();
      }

      function loadImg(inputFile, num) {
        // inputFile : 현재 변화가 생긴 input type="file" 요소 객체
        // num : 몇 번째 input 요소인지 확인 후 해당 영역에 미리보기 하기 위해 전달받는 숫자

        // 선택된 파일이 있다면 inputFile.files[0] 에 선택된 파일이 담겨있음
        //                  => inputFile.files.length 또한 1이 될꺼임
        if (inputFile.files.length == 1) {
          // 파일이 선택된 경우 => 파일 읽어들여서 미리보기

          // 파일을 읽어들일 FileReader 객체 생성
          const reader = new FileReader();

          // 파일을 읽어들이는 메소드
          reader.readAsDataURL(inputFile.files[0]);
          // 해당 파일을 읽어들이는 순간 해당 이 파일만의 고유한 url 부여

          // 파일 읽어들이기가 완료 됐을 때 실행할 함수를 정의해두기
          reader.onload = function (e) {
            // e.target.result => 읽어들인 파일의 고유한 url
            switch (num) {
              case 1:
                $("#contentImg1").attr("src", e.target.result);
                break;
              case 2:
                $("#contentImg2").attr("src", e.target.result);
                break;
              case 3:
                $("#contentImg3").attr("src", e.target.result);
                break;
            }
          };
        } else {
          // 선택된 파일이 취소된 경우 => 미리보기 된 것도 사라지게
          switch (num) {
            case 1:
              $("#contentImg1").attr("src", null);
              break;
            case 2:
              $("#contentImg2").attr("src", null);
              break;
            case 3:
              $("#contentImg3").attr("src", null);
              break;
          }
        }
      }
    </script>
  </body>
</html>
