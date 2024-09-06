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

        <div class="main" align="center">
          <br />
          <h2>원클래스 상세정보</h2>
            <table>
              <tr>
                <th width="120" height="30">글번호</th>
                <td width="260"><%=list.getOneNo() %></td>
                <th width="90">평점</th>
                <td width="300"><%=list.getScore() %></td>
              </tr>
              <tr>
                <th height="35">삭제여부</th>
                <td ><%if(list.getOneStatus().equals("Y")){ %>정상 <%}else {%>삭제 <%} %></td>
                <th height="35">지역</th>
                <td ><%=list.getLocationName()%></td>
              </tr>
              <tr>
                <th height="30">제목</th>
                <td colspan="3"><%=list.getOneTitle() %></td>
             
              </tr>
              <tr>
                <th>최대인원</th>
                <td>
                <%=list.getEntPeople() %>
                </td>
                <th>테마</th>
                <td>
                <%=list.getTemCateName() %>
               
                </td>
              </tr>
               <tr>
                <th>카테고리</th>
                <td>
                <%=list.getOnecategoryName() %>
                </td>
                <th>가격</th>
                <td>
                <%=list.getPrice() %>
               
                </td>
              </tr>
              
               <tr>
                <th>장소</th>
                <td colspan="3" >
                <%=list.getOnePlace() %>
                </td>
            
              </tr>
               <tr>
                <th>시작시간</th>
                <td>
                <%=list.getStartTime() %>
                </td>
                <th>종료시간</th>
                <td>
                <%=list.getEndTime() %>
               
                </td>
              </tr>
              
             
              <tr>
                <th>메인사진</th>
                <td height=" 300px " colspan="3">
                  <div>
                    <img
                      height="300px"
                          <%if(at.size()>0){ %>
                      src="<%=contextPath %>/<%=at.get(0).getFilePath()+at.get(0).getChangeName() %>"
                      <%}else {%>src=""
                      <%} %>
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
                    <%if(at.size()<2){ %>
                    <div style="height: 100%; width: 100%; border: 0px">
                      <h2 align="center" style="border: 0px">
                        서브 사진이 없습니다
                      </h2>
                    </div>
                    <%}else{ %>
                    <%for(int i = 1;i<at.size() ;i++){ %>
                    <img
                      src="<%=contextPath %>/<%=at.get(i).getFilePath()+at.get(i).getChangeName() %>"
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
                    <%}} %>
                  </div>
                </td>
              </tr>
            </table>
            <br />
            
               <form
            action="adOneUpdate.au"
            method="post"
        	  >
		
         	<input type="hidden" name="ono" value="<%=list.getOneNo()%>">
           
 		    <button >수정하기</button> 
 		    <button onclick=adOneDelete() type="button">삭제하기</button> 
            <a href="adoneclass.ac">
              <button type="button">목록으로</button>
            </a>
            <br /><br />

            <script>
              function adOneDelete(){
                if (confirm("정말 삭제하시겠습니까?")) {
                var value = "<%=list.getOneNo()%>"
                location.href = "<%=contextPath%>/adOnedelete.dt?ono="+value
              }
            }
             
             
            </script>
          </form>
        </div>
      </body>
    </html> 
