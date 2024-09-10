<%@page import="semi.mypage.mylist.model.vo.MyList"%>
<%@page import="semi.common.PageInfo"%>
<%@page import="java.util.ArrayList"%>
<%@page import = "semi.member.model.vo.Member" %>
<%@page import = "semi.mypage.myReview.model.vo.Review" %> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    PageInfo pi = (PageInfo)request.getAttribute("pi");   
	ArrayList<MyList> list = (ArrayList<MyList>)request.getAttribute("list");

	int currentPage = pi.getCurrentPage();
 	int startPage = pi.getStartPage();
 	int endPage = pi.getEndPage();
 	int maxPage = pi.getMaxPage();

 	String selectedCategory = request.getParameter("category");
 	String sortCriteria = request.getParameter("sort");

 	
	// 서비스 요청 전 : member.jsp 로딩시 : null
	// 서비스 성공 후 : member.jsp 로딩시 : alert로 띄워줄 메시지 문구
		
%>     
 
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이페이지_1</title>
    <style>
        #wrap {
            width: 1100px;
            margin: 30px auto 0;
            background-color: #f6f5f0;
            padding-bottom: 50px;
        }

        #content {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 10px;
            margin-bottom: 50px;
            height: 1000px;
        }

        #pgnum {
            text-align: center;
            padding: 20px 0;
        }

        #sort {
            position: absolute;
            right: 20px;
            top: 20px;
        }

        #sort_box {
            display: none;
            position: absolute;
            top: 40px;
            right: 20px;
            background-color: white;
            border: 1px solid #ddd;
            padding: 10px;
            border-radius: 5px;
        }
    </style>
</head>

<body>

    <%@ include file="../mypage/mypageMenubar.jsp" %>
    <%@ include file="../common/footer.jsp" %>

    <div id="wrap">
        <div>찜 리스트</div>
        <div id="content">
            <div class="category_filter">
                <form action="<%=contextPath%>/mylist.mo" method="get">
                    <label><input type="radio" name="category" value="all" <% if ("all".equals(selectedCategory)) { out.print("checked"); } %>> 전체</label>
                    <label><input type="radio" name="category" value="카페" <% if ("카페".equals(selectedCategory)) { out.print("checked"); } %>> 카페</label>
                    <label><input type="radio" name="category" value="데이트" <% if ("데이트".equals(selectedCategory)) { out.print("checked"); } %>> 데이트</label>
                    <label><input type="radio" name="category" value="전시/관람" <% if ("전시/관람".equals(selectedCategory)) { out.print("checked"); } %>> 전시/관람</label>
                    <label><input type="radio" name="category" value="액티비티" <% if ("액티비티".equals(selectedCategory)) { out.print("checked"); } %>> 액티비티</label>

                    <div id="sort">
                        <label><input type="radio" name="sort" value="인기순" <% if ("인기순".equals(sortCriteria)) { out.print("checked"); } %>> 인기순</label>
                        <label><input type="radio" name="sort" value="최신순" <% if ("최신순".equals(sortCriteria)) { out.print("checked"); } %>> 최신순</label>
                        <label><input type="radio" name="sort" value="평점순" <% if ("평점순".equals(sortCriteria)) { out.print("checked"); } %>> 평점순</label>
                    </div>

                    <button type="submit">필터 및 정렬 적용</button>
                </form>
            </div>

            <% if (list.isEmpty()) { %>
                <div>비었다</div>
            <% } else { %>
                <% for (MyList m : list) { %>
                    <div class="rvbox">
                        <div class="rvbox_1">
                            <a href=""><img src="<% %>" alt="가게 이미지"></a>
                        </div>
                        <div class="rvbox_2">
                            <div class="rvbox_header">
                                <div id="place_name"><%= m.getListTitle() %></div>
                            </div>
                            <div class="rvbox_3"><%= m.getCategory() %></div>
                            <div><%= m.getPhone() %></div>
                            <div class="rvbox_4">
                                <div class="rvbox_score">평점: <%= m.getScore() %></div>
                                <div class="rvbox_address">주소: <%= m.getAddress() %></div>
                                <div class="rvbox_delete"><a href="<%= contextPath %>/MyListDelete?listNo=<%= m.getListNo() %>">삭제</a></div>
                            </div>
                        </div>
                    </div>
                <% } %>
            <% } %>

            <div id="pgnum">
                <% if (currentPage != 1) { %>
                    <button onclick="location.href='<%= contextPath %>/mylist.mo?cpage=<%= currentPage - 1 %>'">&lt;</button>
                <% } %>

                <% for (int p = startPage; p <= endPage; p++) { %>
                    <% if (p == currentPage) { %>
                        <button disabled><%= p %></button>
                    <% } else { %>
                        <button onclick="location.href='<%= contextPath %>/mylist.mo?cpage=<%= p %>'"><%= p %></button>
                    <% } %>
                <% } %>

                <% if (currentPage != maxPage) { %>
                    <button onclick="location.href='<%= contextPath %>/mylist.mo?cpage=<%= currentPage + 1 %>'">&gt;</button>
                <% } %>
            </div>
        </div>
    </div>
</body>
</html>
