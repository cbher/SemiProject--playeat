<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<style>

#top-btn { 
    display: none; 
    position: fixed;
    bottom: 40px;
    right: 15%;
    z-index: 999;
    background-color: white;
    border: 2px solid #dbdbdb;
    outline: none;
    cursor: pointer;
    padding: 10px;
    border-radius: 50%;
    width: 50px;
    height: 50px;
    font-size: 13px;
    font-weight: 500;
    color: #333333;
}
</style>

</head>
<body>
<button id="top-btn"> ▲ <br/> TOP </button>

<script>
//탑버튼
$(document).ready(function() { 

    // Top 버튼 특정 스크롤높이에서만 보이기 / 숨기기
    $(window).scroll(function(){
      if($(this).scrollTop() > 100){
          $('#top-btn').fadeIn();
        }else{
          $('#top-btn').fadeOut();
        }
    });
    
    // Top 버튼 클릭시 페이지 상단으로 이동
     $('#top-btn').click(function(){
      $('html, body').animate({scrollTop : 0}, 800);
        return false;
    });
    
  });

</script>

</body>
</html>