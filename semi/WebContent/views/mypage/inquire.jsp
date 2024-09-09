<%@page import="semi.common.PageInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import = "semi.member.model.vo.Member" %>
<%@page import = "semi.mypage.myInquire.model.vo.Inquire" %>

<% 
	ArrayList<Inquire> list = (ArrayList<Inquire>)request.getAttribute("inquireList");
	PageInfo pi = (PageInfo)request.getAttribute("pi");   

	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
	
%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <style>
  
  #wrap {
    width: 1100px;
    margin: 150px auto 0;
    background-color: #f6f5f0;
    padding-bottom: 50px;
}

#content {
    background-color: #ffffff;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
    margin-bottom: 50px;
    position: relative; 
    
    min-height: 600px;
}

#content_title {
    display: flex;
    justify-content: space-around;
    margin-bottom: 20px;
    font-size: 24px;
    font-weight: bold;
}

#content_title a {
    padding: 10px 20px;
    background-color: #8b7dbe;
    color: #fff;
    border-radius: 5px;
}

#content_title a:hover {
    background-color: #6a5cba;
}




.rvbox {
    background-color: #f9f9f9;
    margin-bottom: 20px;
    padding: 15px;
    display: flex;
    border: 1px solid #ddd;
    border-radius: 10px;
}

.rvbox_1 img {
    width: 60px;
    height: 60px;
    border-radius: 10px;
    margin-right: 20px;
}

.rvbox_2 {
    flex-grow: 1;
}

.rvbox_2 div {
    margin-bottom: 5px;
}

.rvbox_3 {
    text-align: right;
    color: #777;
}



#pgnum {
    text-align: center;
    padding: 20px 0;
    position: absolute; 
    bottom: 20px; 
}

#sort {
    position: absolute;
    right: 20px;
    top: 20px;
}

#sort_box {
	background-color: white;
    border: 1px solid #ddd;
    border-radius: 5px;
    
	position: absolute;
    display: none;
    top: 40px;
    right: 20px;
    padding: 10px;
    
}

#sort_button img {
    width: 20px;
    height: 20px;
}

.inquire-list {
    border: 1px solid black;
    text-align: center;
    justify-content: center;
    font-size : 16px;
    margin: 0 auto;
}  
</style>

</head>
<body>

 		<%@ include file="../mypage/mypageMenubar.jsp" %>
         <%@ include file="../common/footer.jsp" %>
	
    <div id="wrap">
        <div id="content">
            <div id="content_title">
                <a href="<%=contextPath%>">나의 리뷰</a>
                <a href="<%=contextPath %>/myonecomment">한줄평</a>
                <a href="<%=contextPath%>/myinquire">내 문의사항</a>
            </div>
            
            
             <table class="inquire-list">
            <thead>
                <tr>
                    <th width="70" height="40">번호</th>
                    <th width="400">제목</th>
                    <th width="120">작성일</th>
                    <th width="90">답변여부</th>
                </tr>
            </thead>

            <tbody>
                
                <%if(list.isEmpty()){ %>
                <tr>
                    <td colspan="5">작성한 문의사항이 없습니다.</td>
                </tr>
                <%}else{ %>
				<% for(Inquire i : list)  {%>
                <tr style="cursor: pointer;" onclick="location.href='<%=contextPath %>/inquire.vo?qno=<%= i.getInquireNo() %>'">
                    <td height="35"><%=i.getInquireNo()%></td>
                    <td><%=i.getInquireTitle()%></td>
                    <td><%=i.getCreateDate() %></td> 
                    <td><%=i.getStatus() %></td>
                </tr>
                <% }%>
               <%} %>
            </tbody>
        </table>
            
            <div id="pgnum">
                <% if(currentPage != 1){ %>
		        <button onclick="location.href='<%=contextPath %>/myinquire?cpage=<%= currentPage -1%>'">&lt;</button>
		        <%} %>
		        
		        <% for(int p=startPage; p<= endPage; p++){%>
		        	<% if (p == currentPage){ %>
		        <button disabled><%=p %></button>
		        	<% }else{ %>
		        <button onclick="location.href='<%=contextPath %>/myinquire?cpage=<%=p %>'"><%=p %></button>
		  			<%} %>
		  		<%} %>
		  
		  
		  
		 		<% if(currentPage !=maxPage){ %> 
		        <button onclick="location.href='<%=contextPath %>/myinquire?cpage=<%=currentPage +1%>'">&gt;</button>
		   		<%} %>
            </div>
        

       
    </div>
</body>



<script>
    document.addEventListener("DOMContentLoaded", function () {
        const sortButton = document.getElementById("sort_button");
        const sortBox = document.getElementById("sort_box");

        sortButton.addEventListener("click", function () {
            sortBox.style.display = sortBox.style.display === "none" ? "block" : "none";
        });
    });
</script>
	
</body>
</html>