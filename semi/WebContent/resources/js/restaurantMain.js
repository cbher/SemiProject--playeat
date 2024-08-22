

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

new Swiper('.sub-slide.incheon .swiper-container',{
    slidesPerView: 4, // 한번에 보여줄 슬라이드 개수
    spaceBetween: 10, // 슬라이드 사이 여백
     // 1번 슬라이드가 가운데 보이기
    loop:true,
    // autoplay: {
    //     delay : 5000,
    // },
    pagination:{
        el : '.sub-slide.incheon .swiper-pagination', // 페이지 번호 요소 선택자
        clickable : true, // 사용자의 페이지 번호 요소 제어 가능 여부

    },
    navigation : {
        prevEl : '.sub-slide.incheon .swiper-prev',
        nextEl : '.sub-slide.incheon .swiper-next',
    }

});

new Swiper('.sub-slide.kangwon .swiper-container',{
    slidesPerView: 4, // 한번에 보여줄 슬라이드 개수
    spaceBetween: 10, // 슬라이드 사이 여백
     // 1번 슬라이드가 가운데 보이기
    loop:true,
    // autoplay: {
    //     delay : 5000,
    // },
    pagination:{
        el : '.sub-slide.kangwon .swiper-pagination', // 페이지 번호 요소 선택자
        clickable : true, // 사용자의 페이지 번호 요소 제어 가능 여부

    },
    navigation : {
        prevEl : '.sub-slide.kangwon .swiper-prev',
        nextEl : '.sub-slide.kangwon .swiper-next',
    }

});

new Swiper('.sub-slide.choongchung .swiper-container',{
    slidesPerView: 4, // 한번에 보여줄 슬라이드 개수
    spaceBetween: 10, // 슬라이드 사이 여백
     // 1번 슬라이드가 가운데 보이기
    loop:true,
    // autoplay: {
    //     delay : 5000,
    // },
    pagination:{
        el : '.sub-slide.choongchung .swiper-pagination', // 페이지 번호 요소 선택자
        clickable : true, // 사용자의 페이지 번호 요소 제어 가능 여부

    },
    navigation : {
        prevEl : '.sub-slide.choongchung .swiper-prev',
        nextEl : '.sub-slide.choongchung .swiper-next',
    }

});

new Swiper('.sub-slide.julla .swiper-container',{
    slidesPerView: 4, // 한번에 보여줄 슬라이드 개수
    spaceBetween: 10, // 슬라이드 사이 여백
     // 1번 슬라이드가 가운데 보이기
    loop:true,
    // autoplay: {
    //     delay : 5000,
    // },
    pagination:{
        el : '.sub-slide.julla .swiper-pagination', // 페이지 번호 요소 선택자
        clickable : true, // 사용자의 페이지 번호 요소 제어 가능 여부

    },
    navigation : {
        prevEl : '.sub-slide.julla .swiper-prev',
        nextEl : '.sub-slide.julla .swiper-next',
    }

});

new Swiper('.sub-slide.gyungsang .swiper-container',{
    slidesPerView: 4, // 한번에 보여줄 슬라이드 개수
    spaceBetween: 10, // 슬라이드 사이 여백
     // 1번 슬라이드가 가운데 보이기
    loop:true,
    // autoplay: {
    //     delay : 5000,
    // },
    pagination:{
        el : '.sub-slide.gyungsang .swiper-pagination', // 페이지 번호 요소 선택자
        clickable : true, // 사용자의 페이지 번호 요소 제어 가능 여부

    },
    navigation : {
        prevEl : '.sub-slide.gyungsang .swiper-prev',
        nextEl : '.sub-slide.gyungsang .swiper-next',
    }

});

new Swiper('.sub-slide.jeju .swiper-container',{
    slidesPerView: 4, // 한번에 보여줄 슬라이드 개수
    spaceBetween: 10, // 슬라이드 사이 여백
     // 1번 슬라이드가 가운데 보이기
    loop:true,
    // autoplay: {
    //     delay : 5000,
    // },
    pagination:{
        el : '.sub-slide.jeju .swiper-pagination', // 페이지 번호 요소 선택자
        clickable : true, // 사용자의 페이지 번호 요소 제어 가능 여부

    },
    navigation : {
        prevEl : '.sub-slide.jeju .swiper-prev',
        nextEl : '.sub-slide.jeju .swiper-next',
    }

});








  // script.js
// script.js
document.addEventListener('DOMContentLoaded', function() {
    // 메뉴 데이터
    const menus = [
        { name: "덮밥", image: "resourse/덮밥.jpg" },
        { name: "삼겹살", image: "resourse/삼겹살.jpg" },
        { name: "짜장면", image: "resourse/짜장면.jpg" },
        { name: "불고기", image: "resourse/프로젝트 로고.png" },
        { name: "제육", image: "resourse/프로젝트 로고.png" },
        { name: "돈가스", image: "resourse/프로젝트 로고.png" },
        { name: "시발", image: "resourse/프로젝트 로고.png" }
    ];

    const menuImage = document.getElementById('menu-image');
    const menuName = document.getElementById('menu-name');

    // 슬롯머신 애니메이션 실행
    function startSlotMachine() {
        // 슬롯머신 이미지 배열 생성
        let images = [];
        for (let i = 0; i < 10; i++) {
            const randomIndex = Math.floor(Math.random() * menus.length);
            images.push(menus[randomIndex].image);
        }

        // 슬롯머신 애니메이션
        let index = 0;
        menuImage.style.opacity = 1; // Make sure image is visible
        menuImage.src = images[index];
        const duration = 3; // 애니메이션 총 지속 시간 (초)
        const frameRate = 30; // 애니메이션 프레임 속도 (프레임/초)
        const frames = duration * frameRate; // 총 프레임 수
        const interval = duration * 1000 / frames; // 각 프레임 간격 (밀리초)
        
        const animationInterval = setInterval(() => {
            menuImage.src = images[index];
            index = (index + 1) % images.length; // 순환
        }, interval);

        // 애니메이션 종료 후 최종 이미지 설정
        setTimeout(() => {
            clearInterval(animationInterval);
            const finalIndex = Math.floor(Math.random() * menus.length);
            const selectedMenu = menus[finalIndex];
            menuImage.src = selectedMenu.image;
            menuName.textContent = selectedMenu.name;
            menuImage.style.opacity = 1;
        }, duration * 1000); // duration 동안 회전 후 멈춤
    }

    document.getElementById('recommend-button').addEventListener('click', function() {
        menuImage.style.opacity = 0; // 이미지 사라지게 하기
        setTimeout(() => {
            startSlotMachine();
        }, 500); // 클릭 후 500ms 후에 슬롯머신 시작
    });
});

