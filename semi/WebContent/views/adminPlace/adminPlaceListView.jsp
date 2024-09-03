<%@page import="db.com.semi.common.model.vo.PageInfo"%>
<%@page import="db.com.semi.adminPlace.model.vo.Place"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    ArrayList<Place> list = (ArrayList<Place>)request.getAttribute("list");
    String select = (String)request.getAttribute("select");
    String search = (String)request.getAttribute("search");
    
    PageInfo pi = (PageInfo)session.getAttribute("adPlacepi");
    int startRow = (pi.getCurrentPage()-1)*pi.getBoardLimit()+1;
    int endRow = startRow + pi.getBoardLimit() - 1;
    
    if (list != null && endRow > list.size()) {
        endRow = list.size();
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
    .mainlist {
        background-color: #F6F5F0;
        width: 1400px;
        margin: auto;
        margin-top: 250px;
    }
    table tr {
        border: 1px solid black;
        box-sizing: border-box;
        background-color: white;
        border-radius: 50px;
    }
    table tr > td {
        border-radius: 50px;
    }
    table tr > th {
        border-radius: 50px;
    }
    tbody > tr:hover {
        background-color: #E4D4FA;
        cursor: pointer;
        text-decoration: underline;
    }
    table td {
        text-align: center;
    }
    .insert>button:hover{
        background-color: #E4D4FA;
        cursor: pointer;
    }
</style>
</head>
<body>
    <%@ include file = "/../views/common/adminMenubar.jsp" %>
    <div class="mainlist">
        <div class="adPlaceTitle">
            <br>
            <h2 align="center">장소 관리</h2>
            <br>
            <form id="selectForm" action="adPlace.pl?search=<%=search%>&select=">
                <div style="float: right; height: 50px; display: flex; align-items: center;">
                    <select name="select" id="" style=" margin-right: 15px;" onchange="submitForm()">
                        <option value="all" <% if (select.equals("all")) { %>selected="selected"<% } %>>전체</option>
                        <option value="rest" <% if (select.equals("rest")) { %>selected="selected"<% } %>>식당</option>
                        <option value="place" <% if (select.equals("place")) { %>selected="selected"<% } %>>놀거리</option>   
                    </select>
                    <input style="margin-right: 15px; height: 20px; width: 200px; border-radius: 90px; border: 1px solid black;" type="text" placeholder="  검색할 장소명을 입력해주세요" name="Pname">
                    <button type="submit" style="margin-right: 15px;">검색하기</button> 
                </div>
            </form> 
            <br>
            <script>
                function submitForm() {
                    document.getElementById("selectForm").submit();
                }
            </script>
        </div>
        <br>
        <br>
        <div class="adPlacelist" align="center">
            <table>
                <thead>
                    <tr>
                        <th width="90" height="40">장소번호</th>
                        <th width="300">장소명</th>
                        <th width="100">폐업여부</th>
                        <th width="400">장소 주소</th>
                        <th width="180">전화번호</th>
                        <th width="90">분류</th>
                        <th width="90">별점</th>
                    </tr>    
             
                    <% if (list == null || list.size() == 0) { %>
                        <tr>
                            <th height="40" colspan="7">값이 존재하지 않습니다</th>
                        </tr>   </thead>
                <tbody>
                    <% } else { %>
                       </thead>
                <tbody>
                        <% for (int a = startRow - 1; a < endRow; a++) { %>
                            <tr>
                                <td height="40"><%= list.get(a).getpNo() %></td>
                                <td><%= list.get(a).getpTitle() %></td>
                                
                                <td><%if(list.get(a).getpStatus().equals("Y")){%>
                              영업중 <%}else{ %>폐업<%} %></td>
                              
                              <td><%= list.get(a).getAddress() %></td>
                                
                                <td><%= list.get(a).getpCall() %></td>
                                <% if (list.get(a).getpSelectNum() == 1) { %>
                                    <td>식당</td>
                                <% } else if (list.get(a).getpSelectNum() == 2) { %>
                                    <td>놀거리</td>
                                <% }else{ %>
                                   <td>잘못된 코드</td>
                                <%} %>
                                <td><%= list.get(a).getpScore() %></td>
                            </tr>
                        <% } %>
                    <% } %>
                </tbody>
            </table>
            <br><br>
            		<a class="insert" href="adPlaceenroll.ap">
            		<button style="width: 200px; height: 50px; border-radius: 20px; ">추가하기</button>
            		</a>
                <br><br>
            <div class="paging" align="center">
                <% if (pi.getCurrentPage() != 1) { %>
                    <button onclick="location.href='<%=contextPath%>/adPlace.pl?cpage=<%=pi.getCurrentPage() - 1 %>&select=<%=select%>&Pname=<%=search%>'">&lt;</button>
                <% } %>
                <% for (int p = pi.getStartPage(); p <= pi.getEndPage(); p++) { %>
                    <% if (p == pi.getCurrentPage()) { %>
                        <button disabled><%= p %></button>
                    <% } else { %>
                        <button onclick="location.href='<%=contextPath%>/adPlace.pl?cpage=<%=p%>&select=<%=select%>&Pname=<%=search%>'"><%= p %></button>
                    <% } %>
                <% } %>
                <% if (pi.getCurrentPage() != pi.getMaxPage()) { %>
                    <% if (list != null && list.size() != 0) { %>
                        <button onclick="location.href='<%=contextPath%>/adPlace.pl?cpage=<%= pi.getCurrentPage() + 1 %>&select=<%=select%>&Pname=<%=search%>'">&gt;</button>
                    <% } %>
                <% } %>
            </div>
            <br> <br>
        </div>
    </div>
    <script>
        $(function() {
            $(".adPlacelist tbody>tr").click(function() {
                location.href = '<%=request.getContextPath()%>/Detail.apo?pno=' + $(this).children().eq(0).text();
            });
        });
    </script>
</body>
</html>
