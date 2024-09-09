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

footer .inner {
      display: block;
      color: #8b7dbe;
      height: 100px;
      font-size: 15px;
      padding: 20px 0 20px 0;
      top: 100%;
      width: 100%;
      height: 80px;
      margin:auto;
    }

    footer .menu {
      list-style-type: none;
      display: flex;
      justify-content: center;
    }
    footer .menu {
      list-style-type: none;
      display: flex;
      justify-content: center;
    }

    footer .menu li {
      position: relative;
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
    footer .info span {
      margin-right: 20px;
      font-size: 12px;
    }

    footer .info span:last-child {
      margin-right: 0;
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

 		<%@ include file="../mypage/mypageMenubar.jsp" %>
	
    <div id="wrap">
        <div id="content">
            <div id="content_title">
                <a href="<%=contextPath%>/mypage.myreview">나의 리뷰</a>
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
    
    <footer>
      <div class="inner">
        <ul class="menu">
          <li><a href="">개인정보처리방침</a></li>
          <li><a href=""> 이용약관 </a></li>
          <li><a href="">위치정보이용약관</a></li>
          <li><a href="">원클래스약관</a></li>
        </ul>

        <div class="info">
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
      // footer this-year (현재년도 표시)
      const thisYear = document.querySelector("#this-year");
      thisYear.textContent = new Date().getFullYear();
    </script>
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