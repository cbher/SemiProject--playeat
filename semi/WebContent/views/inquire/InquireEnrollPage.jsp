<%@page import="semi.inquire.model.vo.Inquire"%>
 <%@page import="java.util.ArrayList"%> 
<%@page import="semi.common.PageInfo"%> 
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <%
  ArrayList<Inquire>list = (ArrayList<Inquire>)request.getAttribute("list"); // 공지번호, 공지제목, userId(1번), 조회수,
  PageInfo pi = (PageInfo)request.getAttribute("pi"); 
  int currentPage = pi.getCurrentPage(); 
  int startPage = pi.getStartPage(); 
  int endPage =pi.getEndPage(); 
  int maxPage = pi.getMaxPage();
  %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Insert title here</title>

<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>

<link rel="stylesheet" href="/semi/resources/css/inquListView.css">

 <%@include file="../common/menubar.jsp" %>
</head>
<body>
 
  
  
    <div class="inquire-area">
         
                 <br />
               <h2 align="center">문의사항</h2>
           <%if(loginUser != null){%>
   
          
           	<div class="inputAnswer" >
				 <a class="button" href="<%=contextPath %>/inquireEnterPage.inq">문의사항 작성하기</a>
           </div>
          <br />
          
            
           <div id="emailModal" class="modal" style="display:none;">
			  <div class="modal-content">
			    <span class="close">&times;</span>
			    <h2>이메일 확인</h2>
			    <br>
			    <form id="emailForm">
			      <input type="email" id="email" name="email" placeholder="이메일 입력해주세요" required>
			      <input type="hidden" id="inquireNo" name="inquireNo">
			      <button type="submit" align="center">확인</button>
			    </form>
			    <br>
			    <span class="waring"> &lt; 주의 &gt; </span> <br>
			 	<span>문의를 작성한 사람의 이메일이 <br> 아니면 문의사항을 확인 하실 수 없습니다.</span>
			  </div>
			</div>
		 <br>
           <br>
	            <br>
           <%} %>
          <table class="inquire-view" align="center">
            <thead>
              <tr align="center">
                <th width="100">글번호</th>
                <th width="500">글 제목</th>
                <th width="100">작성자</th>
                <th width="120">작성일</th>
                <th width="120">답변여부</th>
              </tr>
            </thead>
            <tbody>
              <%if(list.isEmpty()){ %>
              <tr>
                <td colspan="4">문의사항 글이 없습니다</td>
              </tr>
              <%}else {%> 
              <%for(Inquire i : list){%>
              <tr>
                <td><%= i.getInquireNo() %></td>
                <td class="content"><%=i.getInquireTitle()%></td>
                <td><%= i.getInquireWriter()%></td>
                <td><%= i.getCreateDate() %></td>
                <%if(i.getStatus().equals("Y")) {%>
                <th width="120" style="color: red; font-weight: 700">X</th>
                <%}else{ %>
                <th width="120" style="color: green; font-weight: 700">Y</th>
                <%} %>
              </tr>
              	<%} %> 
              <%} %>
            </tbody>
          </table>

          <script type="text/javascript">
           $(function () {
              $(".inquire-view>tbody>tr").click(function () {
            	  const num = $(this).children().eq(0).text();
            	    $('#inquireNo').val(num);  // 모달창에 문의사항 번호 설정
            	    
            	    $('#email').val('');
            	    
            	    $('#emailModal').show();  // 모달창 열기
            	  });

            	  $('.close').click(function () {
            	    $('#emailModal').hide();  // 모달창 닫기
            	  });

            	  $('#emailForm').submit(function (event) {
            	    event.preventDefault(); // 폼 제출 막기
            	    const formData = $(this).serialize();

            	    // AJAX 요청으로 이메일과 비밀번호를 비교
            	    $.ajax({
            	      url: "<%= contextPath %>/checkEmail.inq",
            	      type: "POST",
            	      data: formData,
            	      success: function (response) {
            	        if (response === "success") {
            	          const num = $('#inquireNo').val();
            	          location.href = "<%= contextPath %>/iqdetail.inq?num=" + num;
            	        } else {
            	          alert("이 글의 작성자가 아닙니다.");
            	          $('#emailModal').hide();  // 모달창 닫기
            	        }
            	      },
            	      error: function () {
            	        alert("오류가 발생했습니다.");
            	      }
            	    });
            	  });
            	});
          </script>

          <br />
          <br />
        <div class="paging-area" align="center">
          <%if(currentPage != 1){ %>
          <button onclick="location.href='<%=contextPath%>/iqList.ip?cpage=<%= currentPage -1%>'">&lt;</button>
          <%} %> 
          <%for(int p =startPage; p <= endPage; p++) {%>
	           <%if(p ==currentPage) {%>
	          		<button disabled><%=p %></button>
	          <%}else{ %>
	          		<button onclick="location.href='<%=contextPath %>/iqList.ip?cpage=<%= p %>'"> <%= p %>  </button>
	          <%} %>
           <%} %>
           <% if(currentPage != maxPage){ %>
          <button onclick="location.href='<%=contextPath%>/iqList.ip?cpage=<%= currentPage + 1%>'"> &gt;</button>
          <%} %>
        </div>
      </div>


</body>
<%@include file="../common/footer.jsp" %>
</html>
   
