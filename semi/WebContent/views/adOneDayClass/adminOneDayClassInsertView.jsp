<%@page import="db.com.semi.adOneDay.model.vo.adOneDayClass"%>
<%@page import="db.com.semi.adOneDay.model.vo.Attechment"%>

<%@page import="db.com.semi.adBoard.model.vo.AdBoard"%>
 <%@page
import="db.com.semi.adminPlace.model.vo.Place"%> <%@page
import="java.util.ArrayList"%> <%@page
import="db.com.semi.Questions.model.vo.Questions"%> <%@ page language="java"
contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%
ArrayList<Attechment> at = (ArrayList<Attechment>)request.getAttribute("at");
adOneDayClass list = (adOneDayClass)request.getAttribute("list");
    %>
    <!DOCTYPE html>
    <html>
      <head>
        <meta charset="UTF-8" />
        <title>Insert title here</title>
        <style>
          .main {
            background-color: #f6f5f0;

            width: 1000px;
            margin: auto;
            margin-top: 250px;
          }
          table * {
            border: 1px solid black;
            box-sizing: border-box;
          }
          button {
            width: 200px;
            height: 50px;
            margin-left: 10px;
            margin-right: 10px;
            border: 1px solid black;
          }
          button:hover {
            background-color: #e4d4fa;
            cursor: pointer;
          }
          input {
            width: 100%;
            height: 36px;
            box-sizing: border-box;
          }
        </style>
      </head>
      <body>
        <%@ include file = "/../views/common/adminMenubar.jsp" %>
      <form
            action="adOneinsert.ai"
            method="post"
             enctype="multipart/form-data"
        	  >
        <div class="main" align="center">
          <br />
          <h2>원클래스 등록하기</h2>
            <table>
              <tr>
              
                <th height="35" colspan="">지역</th>
                <td  colspan="">
                <select name="areaSelect" id="areaSelect">
                <option value="1">서울</option>
                <option value="2">경기도</option>
                <option value="3">인천</option>
                <option value="4">대구</option>
                <option value="5">광주</option>
                <option value="6">부산</option>
                <option value="7">대전</option>
                <option value="8">울산</option>
                <option value="9">세종</option>
                <option value="10">강원도</option>
                <option value="11">충청북도</option>
                <option value="12">충청남도</option>
                <option value="13">전라북도</option>
                <option value="14">전라남도</option>
                <option value="15">경상북도</option>
                <option value="16">경상남도</option>
                <option value="17">제주도</option>
                </select>
               </td>
               <th>전화번호</th>
               <td>      <input type="text"  name="phone"></td>
              </tr>
             
           
             
              <tr>
                <th height="30">제목</th>
                <td colspan="3"> <input name="onetitle" > </td>
             
              </tr>
              <tr>
                <th>최대인원</th>
                <td>
                <input type="number"  name="entpeople">
                
                </td>
                <th>테마</th>
                <td>
                <select id="temCateSelect" name="temcateSelect">
                   <option value="1">전체</option>
                <option value="2">카페</option>
                <option value="3">데이트</option>
                <option value="4">전시/관람</option>
                <option value="5">엑티비티</option>
                <option value="6">음식점</option>
                </select>
               
              
               
                </td>
              </tr>
               <tr>
                <th>카테고리</th>
                <td>
                  <select id="oneCateSelect" name="oneCateSelect">
                 <option value="1">전체</option>
                <option value="2">스포츠</option>
                <option value="3">드로잉</option>
                <option value="4">쿠킹</option>
                <option value="5">핸드메이드</option>
                <option value="6">음악</option>
                <option value="7">반려동물</option>
                <option value="8">플라워</option>
                </select>
              
             
                </td>
                <th>가격</th>
                <td>
                   <input type="number" name="price">
              
               
                </td>
              </tr>
              
               <tr>
                <th>장소</th>
                <td colspan="3" >
                  <input type="text"  name="onePlace" />
             
                </td>
            
              </tr>
               <tr>
                <th>시작시간</th>
                <td>
                <input type="time" name="startTime">
              
                </td>
                <th>종료시간</th>
                <td>
                   <input type="time" name="endTime">

               
                </td>
              </tr>
              
             
              <tr>
                <th>메인사진</th>
                <td height=" 300px " colspan="3">
                  <div>
                    <img
                      height="300px"
                      src=""
                      alt=""
                      id="titleImg"
                      onclick="chooseFile(1)"
                    />
                  </div>
                </td>
              </tr>
              <tr>
                <th height="30">서브사진</th>
                <td height="300px" colspan="5">
                  <div
                    style="
                      height: 300px;
                      float: left;
                      width: 100%;
                      box-sizing: border-box;
                    "
                  >
                
           
          
                       <img
             			 src="

                      alt=""
                      style="
                        border: 1px solid black;
                        width: 33%;
                        float: left;
                        height: 100%;
                      "
                      id="contentImg1"
                      onclick="chooseFile(2)"
                    />
                         <img
						 src="
	                       alt=""
                      style="
                        border: 1px solid black;
                        width: 33%;
                        float: left;
                        height: 100%;
                      "
                      id="contentImg2"
                      onclick="chooseFile(3)"
                    />
                         <img
                     	 src="
                      alt=""
                      style="
                        border: 1px solid black;
                        width: 33%;
                        float: left;
                        height: 100%;
                      "
                      id="contentImg3"
                      onclick="chooseFile(4)"
                          />
                    
                  
                  </div>
                </td>
              </tr>
            </table>
            <br />
            
            
        <div id="file-area" style="display: none">
          <input
            type="file"
            name="file1"
            id="file1"
        
            onchange="loadImg(this,1)"
          />
          <input
            type="file"
            name="file2"
            id="file2"
            onchange="loadImg(this,2)"
          />
          <input
            type="file"
            name="file3"
            id="file3"
            onchange="loadImg(this,3)"
          />
          <input
            type="file"
            name="file4"
            id="file4"
            onchange="loadImg(this,4)"
          />
        </div>
            
            
         
		
      
           
 		    <button >추가하기</button> 
 		
            <a href="adBoard.bl">
              <button type="button">목록으로</button>
            </a>
            <br /><br />

            <script>
         


        function chooseFile(num) {

          $("#file" + num).click();
      
        }
        function loadImg(inputFile, num) {
          // inputFile : 현재 변화가 생긴 input type="file" 요소 객체 생성
          // num : 몇 번째 input 요소인지 확인 후 해당 영역에 미리보기 하기 위해 전달받는 숫자

          //선택된 파일이 있다면 inputFile.files[0] 에 선택된 파일이 담겨 있음
          //  inputFile.files.length 또한 1이 될거다
          //  0이면 안들어있는거고

          if (inputFile.files.length == 1) {
            // 파일이 선택된 경우 => 파일을 읽어들여서 미리보기

            //파일을 읽어들이는 객체 FileReader 객체 생성하기
            const reader = new FileReader();

            //파일을 읽어들이는 메소드
            reader.readAsDataURL(inputFile.files[0]);
            //해당 파일을 읽어들이는 순간 해당 이 파일만의 고유한 url 부여

            //파일 다 읽어들였을 경우 실행할 함수 정의하기

            reader.onload = function (e) {
              // e.target.result => 읽어들인 파일의 고유한 url
              switch (num) {
                case 1:
                  $("#titleImg").attr("src", e.target.result);
                  break;

                case 2:
                  $("#contentImg1").attr("src", e.target.result);
                  break;

                case 3:
                  $("#contentImg2").attr("src", e.target.result);
                  break;

                case 4:
                  $("#contentImg3").attr("src", e.target.result);
                  break;
              }
            };
          } else {
            // 선택된 파일이 취소된 경우 => 미리보기 된 것도 사라지게-----------------------------

            switch (num) {
              case 1:
                $("#titleImg").attr("src", null);
                break;

              case 2:
                $("#contentImg1").attr("src", null);
                break;

              case 3:
                $("#contentImg2").attr("src", null);
                break;

              case 4:
                $("#contentImg3").attr("src", null);
                break;
            }
          }
        }
      </script>
          </form>
        </div>
      </body>
    </html> 
