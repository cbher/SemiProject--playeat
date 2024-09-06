

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
 

