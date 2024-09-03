<%@page import="db.com.semi.adminPlace.model.vo.Attechment"%> <%@page
import="db.com.semi.adminPlace.model.vo.Place"%> <%@page
import="java.util.ArrayList"%> <%@page
import="db.com.semi.Questions.model.vo.Questions"%> <%@ page language="java"
contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%
ArrayList<Attechment> at = (ArrayList<Attechment>)session.getAttribute("placeDetailat");
Place list = (Place)session.getAttribute("placeDetaillist"); %>
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
          <h2>장소 상세정보</h2>
       
            <table>
              <tr>
                <th width="120" height="30">가게명</th>
                <td width="260"><%=list.getpTitle() %></td>
                <th width="90">가게번호</th>
                <td width="300"><%=list.getpCall() %></td>
              </tr>
              <tr>
                <th height="35">가게주소</th>
                <td colspan="3"><%=list.getAddress() %></td>
              </tr>
              <tr>
                <th height="30">테마</th>
                <td><%=list.getTemCateName() %></td>
                <th>지역</th>
                <td><%=list.getLocationName() %></td>
              </tr>
              <tr>
                <th>분류</th>
                <td>
                  <%if(list.getpSelectNum()==1){ %>식당 <% }else{%>놀거리 <%} %>
                </td>
                <th>카테고리</th>
                <td>
                  <%if(list.getRcategoryName()==null){ %> 카테고리 번호 오류
                  <%}else{ %> <%=list.getRcategoryName() %> <%} %>
                </td>
              </tr>
              <tr>
                <th width="90" height="30">영업시간</th>

                <td colspan="3"><%=list.getBusinesstime() %></td>
              </tr>
              <tr>
                <th>메인사진</th>
                <td height=" 300px " colspan="3">
                  <div><%if(at == null || at.size()<1){}else {%>
                    <img
                      height="300px"
                      src="<%=contextPath %>/<%=at.get(0).getFilePath()+at.get(0).getChangeName() %>"
                      alt=""
                      id="titleImg"
                      onclick="chooseFile(1)"
                    />
                  </div>
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
                    <%if(at.size()<2 || at==null){ %>
                    <div style="height: 100%; width: 100%; border: 0px">
                      <h2 align="center" style="border: 0px">
                        서브 사진이 없습니다
                      </h2>
                    </div>
                    <%}else{ %>
                  
                    <img
                      src="<%if(at.size()>1){ %>
                      <%=contextPath %>/<%=at.get(1).getFilePath()+at.get(1).getChangeName() %><%}else{} %>"
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
                      src="<%if(at.size()>2){ %>
                      <%=contextPath %>/<%=at.get(2).getFilePath()+at.get(2).getChangeName() %><%}else{} %>"
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
                      src="<%if(at.size()>3){ %>
                      <%=contextPath %>/<%=at.get(3).getFilePath()+at.get(3).getChangeName() %><%}else{} %>"
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
                    <%} %>
                  </div>
                </td>
              </tr>
            </table>
            <br />
            
               <form
            action="AdPlaceupdate.au"
            method="post"
        	  >
			<input type="hidden" name="pno" value="<%=list.getpNo()%>">
		
            <button>수정하기</button>
           
 		    <button onclick=pldelect() type="button">삭제하기</button>
 		    <button onclick=placestop() type="button">폐업처리</button>    
            <a href="adPlace.pl">
              <button type="button">목록으로</button>
            </a>
            <br /><br />

            <script>
              function pldelect(){
                if (confirm("정말 삭제하시겠습니까?")) {
                var value = "<%=list.getpNo()%>"
                location.href = "<%=contextPath%>/adPlace.de?pno="+value
              }
            }
               function placestop(){
                	if(confirm("폐업처리하시겠습니까?")){
                		 var value = "<%=list.getpNo()%>"
                             location.href = "<%=contextPath%>/adPlace.st?pno="+value
                	}
                }
            </script>
          </form>
        </div>
      </body>
    </html> </Attechment
></Attechment>
