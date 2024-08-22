let quickMenu = $('.badge');
const DURATION = 900; // 이동 애니메이션 시간

function positionQuickMenu() {
    let windowHeight = $(window).height();
    let quickMenuHeight = quickMenu.height();
    
    // 화면의 중앙 위치를 계산
    let point = ($(window).scrollTop() + (windowHeight / 2)) - (quickMenuHeight / 2);

    point -= 50;

    quickMenu.stop().animate({ top: point }, DURATION);
}

$(window).scroll(function() {
    positionQuickMenu(); // 스크롤할 때마다 중앙에 맞춰 이동
});

$(window).resize(function() {
    positionQuickMenu(); // 창 크기가 변경될 때도 중앙에 재배치
});

$(document).ready(function() {
    positionQuickMenu(); // 페이지 로드 시 중앙에 배치
});

$(function(){
    $(".rank-area2 .rank-list").slice(0, 4).show(); // select the first 4
    $(".add-list").click(function(e){ // click event for load more
        e.preventDefault();
        $(".rank-area2 .rank-list:hidden").slice(0, 4).show(); // select next 4 hidden divs and show them
        if($(".rank-list:hidden").length == 0){ // check if any hidden divs still exist
            // alert("No more divs"); // alert if there are none left
            $('.rank-area2 .add-list').hide();
        }
    });
});

// 탑버튼
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