<%@page import="db.com.semi.adminPlace.model.vo.Attechment"%>
<%@page import="java.util.ArrayList"%>
<%@page import="db.com.semi.adminPlace.model.vo.Place"%>
<%@page import="db.com.semi.Questions.model.vo.Attatment"%> <%@page
import="db.com.semi.Questions.model.vo.Questions"%> <%@ page language="java"
contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
ArrayList<Attechment> at = (ArrayList<Attechment>)session.getAttribute("placeDetailat");
Place list = (Place)session.getAttribute("placeDetaillist"); 
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

    <div class="main" align="center">
      <br />
      <h2>장소 수정</h2>
      <form action="AdPlaceupdatec.up" method="post" enctype="multipart/form-data">
      <input type="hidden" name="pno"value="<%=list.getpNo() %>">

        <table>
          <tr>
            <th width="120" height="30">가게명</th>
            <td width="260">
              <input type="text" name="ptitle" value="<%=list.getpTitle()%>"/>
            </td>
            <th width="90">가게번호</th>
            <td width="300">
              <input type="text" name="pcall" value= "<%=list.getpCall()%>"/>
            </td>
          </tr>
          <tr>
            <th height="35">가게주소</th>
            <td colspan="3">
              <input type="text" name="address" value="<%=list.getAddress() %>" />
            </td>
          </tr>
          <tr>
            <th height="30">테마</th>
            <td>
              <select name="tCate" id="tcate">
                <option value="1">전체</option>
                <option value="2">카페</option>
                <option value="3">데이트</option>
                <option value="4">전시/관람</option>
                <option value="5">액티비티</option>
                <option value="6">음식</option>
              </select>
            </td>
            <th>지역</th>

            <td>
              <select name="lCate" id="lcate">
                <option value="1">서울</option>
                <option value="2">경기도</option>
                <option value="3">인천</option>
                <option value="4">대구</option>
                <option value="5">광주</option>
                <option value="6">부산</option>
                <option value="7">대전</option>
                <option value="8">울산</option>
                <option value="9">세송</option>
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
          </tr>
          <tr>
            <th>분류</th>
            <td>
              <select name="psNum" id="psnum">
                <option value="1">식당</option>
                <option value="2">놀거리</option>
              </select>
            </td>
            <th>카테고리</th>
            <td>
              <select name="rCate" id="rcate">
                <option value="1">전체</option>
                <option value="2">밥집</option>
                <option value="3">고깃집</option>
                <option value="4">술집</option>
                <option value="5">한식</option>
                <option value="6">일식</option>
                <option value="7">양식</option>
                <option value="8">중식</option>
                <option value="9">브런치</option>
                <option value="10">패스트푸드</option>
                <option value="11">뷔페</option>
                <option value="12">분식</option>
              </select>
            </td>
          </tr>

          <tr>
            <th width="90" height="30">영업시작시간</th>
            <td width="260">
              <input type="time" name="startTime" value="<%=list.getBusinesstime().substring(0,5)%>" />
            </td>
            <th width="90">영업종료시간</th>
            <td width="300">
              <input type="time" name="endTime" value="<%=list.getBusinesstime().substring(6,11)%>" />
            </td>
          </tr>
          <tr>
            <th>메인사진 </th>
            <td height=" 300px " colspan="3">
              <div>
                <img
                  height="300px"
                  src="<%if(at == null || at.size()<1){}else{ %>
                  <%=contextPath%>/<%=at.get(0).getFilePath()+at.get(0).getChangeName() %>
                <%} %>  "
                  alt="  "
                  id="titleImg"
                  onclick="chooseFile(1)"
                />
              </div>
           <%if(at != null && at.size()>0){ %>
                    <input type="hidden" name="fno1" value="<%=at.get(0).getFileNo() %>">
               
                 	<%} %>
        
                 <% if(at.size() > 1 && at.get(1) != null) { %>
             
                     <input type="hidden" name="fno2" value="<%=at.get(1).getFileNo() %>">
    
 				  <% }if(at.size() > 2 && at.get(2) != null) { %>      
 				
                   <input type="hidden" name="fno3" value="<%=at.get(2).getFileNo() %>">
           
                <% }if(at.size() > 3 && at.get(3) != null) { %>  
               
                     <input type="hidden" name="fno4" value="<%=at.get(3).getFileNo() %>">

                 <%} %>
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
                 <%if(at.size() > 1 && at.get(1) != null) { %>
                  src="<%=contextPath%>/<%= at.get(1).getFilePath()+at.get(1).getChangeName() %>"
                  <%}else{ %>
                  src=""
                  <%} %>
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
                 <%if(at.size() > 2 && at.get(2) != null) { %>
                  src="<%=contextPath%>/<%= at.get(2).getFilePath()+at.get(2).getChangeName() %>"
                      <%}else{ %>
                  src=""
                  <%} %>
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
                 <%if(at.size() > 3 && at.get(3) != null) { %>
                  src="<%=contextPath%>/<%= at.get(3).getFilePath()+at.get(3).getChangeName() %>"
                      <%}else{ %>
                  src=""
                 <%} %>
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

        <button>수정하기</button>

        <a href="Detail.apo?pno=<%=list.getpNo()%>">
          <button type="button">돌아가기</button>
        </a>
        <br /><br />
      </form>
      <script>
      document.getElementById("tcate").value = "<%=list.getTemCateNo()%>"; 
      document.getElementById("lcate").value = "<%=list.getLocationNo()%>"
      document.getElementById("psnum").value = "<%=list.getpSelectNum()%>"
      document.getElementById("rcate").value = "<%=list.getRcategoryNo()%>"
      
      
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
    </div>
  </body>
</html>
