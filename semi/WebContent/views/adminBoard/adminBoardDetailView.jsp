<%@page import="db.com.semi.adBoard.model.vo.Attechment"%>
<%@page import="db.com.semi.adBoard.model.vo.AdBoard"%>
 <%@page
import="db.com.semi.adminPlace.model.vo.Place"%> <%@page
import="java.util.ArrayList"%> <%@page
import="db.com.semi.Questions.model.vo.Questions"%> <%@ page language="java"
contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%
AdBoard list = (AdBoard)session.getAttribute("adBoardDetaillist");
ArrayList<Attechment> at = (ArrayList<Attechment>)session.getAttribute("adBoardDetaiatllist");
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
          <h2>게시판 상세정보</h2>
            <table>
              <tr>
                <th width="120" height="30">글번호</th>
                <td width="260"><%=list.getcNo() %></td>
                <th width="90">제목</th>
                <td width="300"><%=list.getcTitle() %></td>
              </tr>
              <tr>
                <th height="35">삭제여부</th>
                <td ><%if(list.getStatus().equals("Y")){ %>정상 <%}else {%>삭제 <%} %></td>
                <th height="35">등록일</th>
                <td ><%=list.getcDate() %></td>
              </tr>
              <tr>
                <th height="30">작성자</th>
                <td><%=list.getUserName() %></td>
                <th>조회수</th>
                <td><%=list.getCount() %></td>
              </tr>
              <tr>
                <th>분류</th>
                <td>
                  <%if(list.getcCategory()==1){ %>음식게시판 <% }else{%>명예의전당 <%} %>
                </td>
                <th>평점</th>
                <td>
                <%=list.getcStar() %>
               
                </td>
              </tr>
              <tr>
                <th width="90" height="300">내용</th>

                <td colspan="3"><%=list.getcContents() %></td>
              </tr>
              <tr>
                <th>메인사진</th>
                <td height=" 300px " colspan="3">
                  <div>
                    <img
                    src="<%if(at==null || at.size()<1){}else{ %><%=contextPath %>/<%=at.get(0).getFilePath()+at.get(0).getChangeName() %><%} %>"
                    alt="  "
                    id="titleImg"
                    onclick="chooseFile(1)"
                    height="300px"
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
            action="AdBoardupdate.ad"
            method="post"
        	  >
		
         
           
 		    <button onclick=pldelect() type="button">삭제하기</button> 
            <a href="adBoard.bl">
              <button type="button">목록으로</button>
            </a>
            <br /><br />

            <script>
              function pldelect(){
                if (confirm("정말 삭제하시겠습니까?")) {
                var value = "<%=list.getcNo()%>"
                location.href = "<%=contextPath%>/adBoard.de?bno="+value
              }
            }
             
            </script>
          </form>
        </div>
      </body>
    </html> 
