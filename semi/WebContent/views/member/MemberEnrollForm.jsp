<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>

<link rel="stylesheet" href="./css/sign_up.css">
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	<%@ include file="../common/footer.jsp" %>
	
	<div class="sign-up_area">
        <h1>회원가입</h1>

        <form action="" class="signUp-form" onsubmit="return validateForm()">
            <ul class="signUp-box">
                <li class="check">
                    <ul class="clearfix">
                        <li>이용약관 동의(필수)</li>
                        <li class="check-btn">
                            <input type="checkBox" required>
                        </li>
                    </ul>
                    <textarea>환영합니다. 이 편지는 영국에서 최초로 시작되어 일년에 한바퀴 돌면서 받는 사람에게 행운을 주었고 지금은 당신에게로 옮겨진 이 편지는 4일 안에 당신 곁을 떠나야 합니다. 이 편지를 포함해서 7통을 행운이 필요한 사람에게 보내 주셔야 합니다. 복사를 해도 좋습니다. 혹 미신이라 하실지 모르지만 사실입니다. 영국에서 HGXWCH이라는 사람은 1930년에 이 편지를 받았습니다. 그는 비서에게 복사해서 보내라고 했습니다. 며칠 뒤에 복권이 당첨되어 20억을 받았습니다. 어떤 이는 이 편지를 받았으나 96시간 이내 자신의 손에서 떠나야 한다는 사실을 잊었습니다. 그는 곧 사직되었습니다. 나중에야 이 사실을 알고 7통의 편지를 보냈는데 다시 좋은 직장을 얻었습니다. 미국의 케네디 대통령은 이 편지를 받았지만 그냥 버렸습니다. 결국 9일 후 그는 암살 당했습니다. 기억해 주세요. 이 편지를 보내면 7년의 행운이 있을 것이고 그렇지 않으면 3년의 불행이 있을 것입니다. 그리고 이 편지를 버리거나 낙서를 해서는 절대로 안됩니다. 7통입니다. 이 편지를 받은 사람은 행운이 깃들 것입니다. 힘들겠지만 좋은게 좋다고 생각하세요. 7년의 행운을 빌면서..... 
                    </textarea>
                </li>

                <li class="check">
                    <ul class="clearfix">
                        <li>개인정보 수집 및 이용에 대한 안내(필수)</li>
                        <li class="check-btn">
                            <input type="checkBox" required>
                        </li>
                    </ul>
                    <textarea>개인정보 수집 및 이용에 대하여 안내드립니다. 개인정보법에 의거하여 이와 같은 사항을 안내드리겠습니다.  떠나는 길에 니가 내게 말했지 '너는 바라는 게 너무나 많아' 아냐 내가 늘 바란 건 하나야 한 개뿐이야 달디단 밤양갱 달디달고 달디달고 달디단 밤양갱 밤양갱 내가 먹고 싶었던 건 달디단 밤양갱 밤양갱이야 상다리가 부러지고 둘이서 먹다 하나가 쓰러져버려도 나라는 사람을 몰랐던 넌 떠나가다가 돌아서서 말했지 '너는 바라는 게 너무나 많아' 아냐 내가 늘 바란 건 하나야 한 개뿐이야 달디단 밤양갱 접기
                    </textarea>
                </li>

                <li class="check">
                    <ul class="clearfix">
                        <li>위치정보 이용약관 동의(선택)</li>
                        <li class="check-btn">
                            <input type="checkBox">
                        </li>
                    </ul>
                    <textarea>환영합니다. 이 편지는 영국에서 최초로 시작되어 일년에 한바퀴 돌면서 받는 사람에게 행운을 주었고 지금은 당신에게로 옮겨진 이 편지는 4일 안에 당신 곁을 떠나야 합니다. 이 편지를 포함해서 7통을 행운이 필요한 사람에게 보내 주셔야 합니다. 복사를 해도 좋습니다. 혹 미신이라 하실지 모르지만 사실입니다. 영국에서 HGXWCH이라는 사람은 1930년에 이 편지를 받았습니다. 그는 비서에게 복사해서 보내라고 했습니다. 며칠 뒤에 복권이 당첨되어 20억을 받았습니다.  어떤 이는 이 편지를 받았으나 96시간 이내 자신의 손에서 떠나야 한다는 사실을 잊었습니다. 그는 곧 사직되었습니다. 나중에야 이 사실을 알고 7통의 편지를 보냈는데 다시 좋은 직장을 얻었습니다. 미국의 케네디 대통령은 이 편지를 받았지만 그냥 버렸습니다. 결국 9일 후 그는 암살 당했습니다. 기억해 주세요. 이 편지를 보내면 7년의 행운이 있을 것이고 그렇지 않으면 3년의 불행이 있을 것입니다. 그리고 이 편지를 버리거나 낙서를 해서는 절대로 안됩니다. 7통입니다. 이 편지를 받은 사람은 행운이 깃들 것입니다. 힘들겠지만 좋은게 좋다고 생각하세요. 7년의 행운을 빌면서..... 
                    </textarea>
                </li>
                <li class="check">
                    <ul class="clearfix">
                        <li>이벤트 등 프로모션 알림 메일 수신(선택)</li>
                        <li class="check-btn">
                            <input type="checkBox">
                        </li>
                    </ul>                  
                </li>
            </ul>

            <ul class="footBtwrap clearfix">
                <li><button class="btn1"">다음으로</button></li>
            </ul>
            
            <script>
            	function enrollPage(){
            		location.href = "<%= contextPath %>/enrollForm2.me";
            	}
            	
            	function validateForm() {
            	    const checkboxes = document.querySelectorAll('input[type="checkbox"][required]');
            	    for (let checkbox of checkboxes) {
            	        if (!checkbox.checked) {
            	            alert("필수 항목을 체크해주세요.");
            	            return false; // 폼 제출 중단
            	        }
            	    }

            	    // 모든 체크박스가 체크되었다면 페이지 이동
            	    location.href = "<%= contextPath %>/enrollForm2.me";
            	    return false; // 폼의 기본 제출 동작 중단
            	}
            </script>
        </form>
    </div>
	
</body>
</html>