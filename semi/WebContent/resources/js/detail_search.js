// let box = $('body')
// let boxHeight = box.height();
// let boxOffsetTop = box.offset().top;
// let quickMenu = $('.badge');
// let quickMenuHeight = quickMenu.height();
// const DURATION = 900;

// $(window).resize(function(){
//     boxHeight = box.height();
//     boxOffsetTop = box.offset().top;
//     quickMenuHeight = quickMenu.height();
// })

// $(window).scroll(function() {
//     let scrollTop = $(this).scrollTop();
//     let point;
//     let endPoint = boxHeight - quickMenuHeight;
//     if ( scrollTop < boxOffsetTop ) {
//         point = 0;
//     } else if ( scrollTop > endPoint ) {
//         point = endPoint;
//     } else {
//         point = scrollTop - 50;
//     }
//     quickMenu.stop().animate({top: point}, DURATION);
// });

let quickMenu = $('.badge');
const DURATION = 900; // 이동 애니메이션 시간

function positionQuickMenu() {
    let windowHeight = $(window).height();
    let quickMenuHeight = quickMenu.height();
    
    // 화면의 중앙 위치를 계산
    let point = ($(window).scrollTop() + (windowHeight / 2)) - (quickMenuHeight / 2);

    point -= 30;

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

$("input[type=radio]").each(function(){

    var chk = $(this).is(":checked");
    var name = $(this).attr('subject-list');
    if(chk == true) $("input[name='"+name+"']").data("previous",$(this).val());

});

$("input[type=radio]").click(function(){

    var pre = $(this).data("previous");
    var chk = $(this).is(":checked");
    var name = $(this).attr('name');

    if(chk == true && pre == $(this).val()){
        $(this).prop('checked',false);
        $("input[name='"+name+"']").data("previous",'');

    }else{
        if(chk == true) $("input[name='"+name+"']").data("previous",$(this).val());
    }

});

// 더보기 버튼

function showSearchList(){
    $(".search-area .search-list").slice(0, 4).show(); // select the first 4
    $(".add-list").click(function(e){ // click event for load more
        e.preventDefault();
        $(".search-area .search-list:hidden").slice(0, 4).show(); // select next 4 hidden divs and show them
        if($(".search-list:hidden").length == 0){ // check if any hidden divs still exist
            // alert("No more divs"); // alert if there are none left
            $('.search-area .add-list').hide();
        }
    });
};

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
 

