<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="./css/signUp_input.css">

</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	<%@ include file="../common/footer.jsp" %>
	<div class="area">
        <h1>회원가입</h1>
        <br>
        <form id="enroll-form" action="<%= contextPath %>/insert.me" method="post">
        <div class="member">

            <div class="field">
                <b>아이디</b>
                <input type="text" id="userId" name="userId" maxlength="15" placeholder="5글자 ~ 15글자 (영문포함 특문제외)" required>
                <input type="button" value="중복확인" class="btn" onclick="idCheck();">
            </div>
            <div class="success-message hide">사용할 수 있는 아이디입니다</div>
            <div class="failure-message hide">아이디는 5~15글자이어야 합니다</div>
            <div class="failure-message2 hide">영어 또는 숫자만 가능합니다</div>     
            <div class="field">
                <b>비밀번호</b>
                <input class="userpw" type="password" id="password" name="userPwd" required placeholder="대소문자 구분, 특문 (!@#$%+) 만 포함, 필수">
            </div>
            <div class="strongPassword-message hide">8글자 이상, 영문, 숫자, 특수문자(@$!%#?)를 사용하세요</div>
            <div class="field">
                <b>비밀번호 재확인</b>
                <input class="userpw-confirm" id="password-retype" type="password" required>
            </div>
            <div class="mismatch-message hide">비밀번호가 일치하지 않습니다</div>
            <div class="field">
                <b>이름</b>
                <input type="text" name="userName" required>
            </div>
            
            <div class="field">
                <b>닉네임<small>(선택)</small></b>
                <input type="text" name="nickname" placeholder="선택입력">
                <input type="button" value="중복확인" class="btn" onclick="nickNameCheck();">
            </div>

            <div class="field tel-number">
                <b>휴대전화</b>
                <div>
                    <input type="tel" name="phone"  placeholder="전화번호 입력 - 포함" required>     
                </div>
            </div>

            <div class="field email">
                <b>이메일</b>
                <div class="email1">
                    <input type="email" name="email" placeholder="이메일 입력" required>
                    <input type="button" value="인증번호 받기" class="btn">
                </div>
                <input type="number" placeholder="인증번호를 입력하세요">
                <input type="button" value="인증하기" class="btn">
            </div>

            

            <input type="submit" value="가입하기">
        </div>
        </form>
    </div>
    
    <script>
    	function idCheck(){
    		// 중복확인 버튼 클릭시 사용자가 입력한 아이디값을 넘겨서 조회요청(존재하는지 안하는지) => 응답데이터 돌려받기
    		// 1) 사용불가능일 경우 => alert로 메시지 출력, 다시 입력할 수 있도록 유도
    		// 2) 사용가능일 경우 => 진짜 사용할건지 의사 물어볼꺼임
    		//				   > 사용하겠다는 경우 => 더이상 아이디 수정 못하게끔, 회원가입 버튼 활성화
    		//				   > 사용안하겠다는 경우 => 다시 입력할 수 있도록 유도
    		
    		// 아이디 입력한 input 요소 객체
    		const $idInput = $("#enroll-form input[name=userId]");
    		
    		$.ajax({
    			url:"idCheck.me",
    			data:{checkId:$idInput.val()},
    			success:function(result){
    				// console.log(result);
    				
    				if(result === 'NNNNN'){ // 사용불가능일 경우
    					alert("이미 존재하거나 탈퇴한 회원의 아이디입니다.")
    					$idInput.focus();
    				}else{ // 사용가능일 경우
    					if(confirm("사용가능한 아이디입니다. 사용하시겠습니까?")){
    						
    						$("#enroll-form :submit").removeAttr("disabled");
    						$idInput.attr("readonly", true);
    						
    					}else{
    						$idInput.focus();
    					}
    				}
    				
    				
    			}, error:function(){
    				console.log("아이디 중복체크용 ajax 통신 실패!")
    			},
    		});
    	}
    	
    	function nickNameCheck(){
    		const $nickNameInput = $("#enroll-form input[name=nickname]");
    		
    		$.ajax({
    			url:"nicknameCheck.me",
    			data:{checkNickname:$nickNameInput.val()},
    			success:function(result){
    				// console.log(result);
    				
    				if(result === 'NNNNN'){ // 사용불가능일 경우
    					alert("이미 존재하는 닉네임입니다.")
    					$nickNameInput.focus();
    				}else{ // 사용가능일 경우
    					if(confirm("사용가능한 닉네임입니다. 사용하시겠습니까?")){
    						
    						$("#enroll-form :submit").removeAttr("disabled");
    						$nickNameInput.attr("readonly", true);
    						
    					}else{
    						$nickNameInput.focus();
    					}
    				}
    				
    				
    			}, error:function(){
    				console.log("닉네임 중복체크용 ajax 통신 실패!")
    			},
    		});
    	}
    	
    	
    	
    </script>
<script src="./js/signUp_input.js"></script>
</body>
</html>