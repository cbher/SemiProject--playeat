<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%




%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>information</title>

 <style>
        body,  h1, h2, h3,  h4, h5, h6,  p,  ul, li, div, a {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
        }

        img {
            display: block;
        }

        a {
            text-decoration: none;
            color: inherit;
        }

        .inner {
            width: 1100px;
            margin: 0 auto;
            position: relative;
        }

     

        /* Menubar */
        .menubar {
            background-color: #f6f5f0;
            padding: 10px 0;
        }

        .menubar .menu .inner {
            display: flex;
            justify-content: space-between;
        }

        .menubar .menu .inner li {
            list-style: none;
            position: relative;
        }

        .menubar .menu .inner li a {
            font-size: 18px;
            font-weight: 700;
            color: #8b7dbe;
            padding: 15px 20px;
            display: block;
        }

        .menubar .menu .inner li a:hover {
            color: purple;
        }

        /* Content */
        #wrap {
            width: 1100px;
            margin: 150px auto 0;
            background-color: #f4f4f4;
            padding-bottom: 50px;
        }

        #account_management {
            margin-top: 20px;
            padding: 20px;
            background-color: #e2e2e2;
            width: 600px;
            margin: 0 auto;
        }

        #account_management h2 {
            text-align: center;
        }

        form {
            display: flex;
            flex-direction: column;
            gap: 10px;
        }

        label {
            font-weight: bold;
            display: inline-block;
            margin-bottom: 5px;
        }

        input[type="text"],
        input[type="password"],
        input[type="email"],
        select {
            width: calc(100% - 120px);
            padding: 10px;
            margin: 5px 0;
            border: 1px solid #ccc;
            display: inline-block;
            vertical-align: middle;
        }

        button {
            width: 100px;
            padding: 10px;
            margin-left: 10px;
            display: inline-block;
            vertical-align: middle;
            cursor: pointer;
        }

        #actions {
            display: flex;
            justify-content: space-between;
        }

        #withdrawal {
            text-align: right;
            margin-top: -40px;
        }

        #withdrawal button {
            cursor: pointer;
        }

    
</style>





</head>
<body>

	<%@ include file="../common/mypageMenubar.jsp" %>
         <%@ include file="../common/footer.jsp" %>


    <div id="wrap">
        <div id="account_management">
            <h2>내 계정</h2>
            <div id="withdrawal">
                <button onclick="withdrawAccount()">회원탈퇴</button>     
            </div>
            <form id="account_form">
                <div>
                    <label for="nickname">닉네임 변경</label><br>
                    <input type="text" name="nickname">
                    <button type="button" name="nickname" onclick="checkNickname()">중복 확인</button>
                </div>
                <div>
                    <label for="name">이름</label><br>
                    <input type="text" value="<%= loginUser.getUserName()%>" name="name">
                </div>
                <div>
                    <label for="password">비밀번호 변경</label><br>
                    <input type="password" name="password">
                </div>
                <div>
                    <label for="password_confirm">* 비밀번호 일치 확인</label><br>
                    <input type="password" name="password_confirm" >
                </div>
                <div>
                    <label for="phone">전화번호</label><br>
                    <input type="text" name="phone" value="<%= loginUser.getPhone()%>"  >
                </div>
                <div>
                    <label for="email">이메일 변경</label><br>
                    <input type="email" name="email" value="<%= loginUser.getEmail()%>" required>
                    <button type="button" onclick="requestEmailVerification()">인증 요청</button>
                </div>
                <div>
                    <label for="email_code">이메일 인증 코드</label><br>
                    <input type="text" name="email_code">
                </div>
                
                <div id="actions">
                    <button type="button" onclick="applyChanges()">적용</button>
                    
                </div>
            </form>
        </div>

       
    </div>
	
	<script>
	function checkNickname(){
		//중복확인 버튼 클릭시 사용자가 입력한 아이디값을 넘겨서 조회요청(존재하는지 안하는지) =>응답데이터 돌려받기
		// 1) 사용불가능일 경우 => alert로 메시지 출력, 다시 입력할 수 있도록 유도 
		// 2) 사용 가능일 경우 => 진짜 사용할 건지 의사 물어볼거임
		//                   > 사용하겠다는 경우 => 더 이상 아이디 수정 못하게끔, 회원가입 버튼 활성화
		//                   > 사용안하겠다는 경우 => 다시 입력할 수 있도록 유도 
		
		
		// 아이디 입력한 input요소 객체 
		const $idInput= $("#account_form input[name=nickname]")
		
		$.ajax({
			url:"idCheck.me",
			data:{checkId:$idInput.val()},
			success:function(result){
				//console.log(result)
				if(result==='NNNNN'){
					alert("이미 존재하거나 탈퇴한 회원입니다.")
					$idInput.focus();
					//틀렸다고 하고 화면을 그쪽으로 focus잡아주는 기능
					
				}else{ //사용 가능일 경우
						$("#enroll-form : submit").removeAttr("disabled");
						$idInput.attr("readonly");
						
					}else{
						$idInput.focus();	
					}
					
				}
			
			
			}, error:function(){
				console.log("아이디 중복체크용 ajax 통신 실패!!")	
			}
			
		});
	}

	
	
	
	</script>
</body>
</html>