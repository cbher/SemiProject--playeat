let box = $('body')
let boxHeight = box.height();
let boxOffsetTop = box.offset().top;
let quickMenu = $('.badge');
let quickMenuHeight = quickMenu.height();
const DURATION = 900;

$(window).resize(function(){
    boxHeight = box.height();
    boxOffsetTop = box.offset().top;
    quickMenuHeight = quickMenu.height();
})

$(window).scroll(function() {
    let scrollTop = $(this).scrollTop();
    let point;
    let endPoint = boxHeight - quickMenuHeight;
    if ( scrollTop < boxOffsetTop ) {
        point = 0;
    } else if ( scrollTop > endPoint ) {
        point = endPoint;
    } else {
        point = scrollTop - 50;
    }
    quickMenu.stop().animate({top: point}, DURATION);
});

const swiper = new Swiper('.swiper', {
  // Optional parameters
  direction: 'horizontal',
  loop: true,

  // If we need pagination
  pagination: {
    el: '.swiper-pagination',
  },

  // Navigation arrows
  navigation: {
    nextEl: '.swiper-button-next',
    prevEl: '.swiper-button-prev',
  },

  // And if we need scrollbar
  scrollbar: {
    el: '.swiper-scrollbar',
  },
});

var swiper1 = new Swiper(".recommend .mySwiper", {
  slidesPerView: 3,
  spaceBetween: 30,
  
  direction: 'horizontal',
  loop: true,
  
  pagination: {
    el: ".swiper-pagination",
    clickable: true,
  },

  navigation: {
    nextEl: '.swiper-button-next',
    prevEl: '.swiper-button-prev',
  },
});

  // MODAL
const modal = document.querySelector('.modal');
const modalOpen = document.querySelector('.modal_btn');
const modalClose = document.querySelector('.close_btn');

//열기 버튼을 눌렀을 때 모달팝업이 열림
modalOpen.addEventListener('click',function(){
  	//'on' class 추가
    modal.classList.add('on');
});
//닫기 버튼을 눌렀을 때 모달팝업이 닫힘
modalClose.addEventListener('click',function(){
    //'on' class 제거
    modal.classList.remove('on');
});

// 한줄평 MODAL

document.addEventListener("DOMContentLoaded", function () {
  // elements
  var modalBtn = document.getElementById("modalBtn");
  var modal = document.getElementById("myModal");
  var closeBtn = document.getElementById("closeBtn");

  // functions
  function toggleModal() {
    modal.classList.toggle("show");
  }

  // events
  modalBtn.addEventListener("click", toggleModal);
  closeBtn.addEventListener("click", toggleModal);

  window.addEventListener("click", function (event) {
    // 모달의 검은색 배경 부분이 클릭된 경우 닫히도록 하는 코드
    if (event.target === modal) {
      toggleModal();
    }
  });
});



jQuery.fn.center = function() {
  this.css('top', Math.max(0, (($(window).height() - $(this).outerHeight()) / 2) + $(window).scrollTop()) + 'px');
  this.css('left', Math.max(0, (($(window).width() - $(this).outerWidth()) / 2) + $(window).scrollLeft()) + 'px');
  return this;
}

function wrapWindowByMask() {
  var maskHeight = $(document).height();
  var maskWidth = $(window).width();

  $('#mask').css({
    'width': maskWidth,
    'height': maskHeight
  });
  $('#mask').fadeTo(10, 0.8);

  $('.ModalPopup').show();
  $('.ModalPopup').center();
}

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





new Swiper('.main-slide .swiper-container',{
  slidesPerView: 4, // 한번에 보여줄 슬라이드 개수
  spaceBetween: 10, // 슬라이드 사이 여백
   // 1번 슬라이드가 가운데 보이기
  loop:true,
  // autoplay: {
  //     delay : 5000,
  // },
  pagination:{
      el : '.main-slide .swiper-pagination', // 페이지 번호 요소 선택자
      clickable : true, // 사용자의 페이지 번호 요소 제어 가능 여부

  },
  navigation : {
      prevEl : '.main-slide .swiper-prev',
      nextEl : '.main-slide .swiper-next',
  }

});

