<%@page import="semi.mypage.editProfile.model.vo.EditProfile"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Information</title>

<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f9f9f9;
        margin: 0;
        padding: 0;
    }

    #wrap {
        width: 1100px;
        margin: 150px auto;
        background-color: #ffffff;
        padding: 40px;
        border-radius: 12px;
    }

    #account_management {
        background-color: #f1f1f1;
        margin-top: 20px;
        padding: 30px;
        width: 600px;
        border-radius: 12px;
        margin: 0 auto;
    }

    #account_management h2 {
        text-align: center;
        color: #333;
        font-weight: 700;
        margin-bottom: 30px;
    }

    form {
        display: flex;
        flex-direction: column;
        gap: 25px;
    }

    label {
        font-weight: 600;
        color: #555;
    }

    input[type="text"],
    input[type="password"],
    input[type="email"] {
        width: 80%;
        padding: 12px;
        border: 1px solid #ccc;
        border-radius: 8px;
        font-size: 16px;
        transition: all 0.3s ease;
    }

    input[type="text"]:focus{
        border:none;
    }
    input[type="password"]:focus{
        border:none;
    }
    input[type="email"]:focus {
        border:none;
    }

    button {
        width: 100px;
        padding: 12px;
        background-color: #8b7dbe;
        color: #fff;
        border: none;
        border-radius: 8px;
        font-size: 16px;
        font-weight: 700;
        margin-top: 10px;
        cursor: pointer;
    }

    button:hover {
        background-color: #6a5cba;
    }

    #withdrawal button {
        background-color: #ff4d4d;
    }

    #withdrawal button:hover {
        background-color: #ff0000;
    }

    #actions {
        display: flex;
        justify-content: flex-end;
        margin-top: 20px;
    }

    #withdrawal {
        text-align: right;
        margin-top: -20px;
    }

    .info {
        font-size: 12px;
        color: #888;
    }
    
    footer .inner {
      display: block;
      color: #8b7dbe;
      height: 100px;
      font-size: 15px;
      padding: 20px 0 20px 0;
      top: 100%;
      width: 100%;
      height: 80px;
      margin:auto;
    }

    footer .menu {
      list-style-type: none;
      display: flex;
      justify-content: center;
    }
    footer .menu {
      list-style-type: none;
      display: flex;
      justify-content: center;
    }

    footer .menu li {
      position: relative;
    }
    footer .menu li {
      position: relative;
    }

    footer .menu li::before {
      content: "";
      width: 3px;
      height: 3px;
      background-color: #555;
      position: absolute; /*position의 값을 부여하면 block요소가 됨.*/
      top: 0;
      bottom: 0;
      right: -1px;
      margin: auto;
    }
    footer .menu li:last-child::before {
      display: none;
    }
    footer .menu li::before {
      content: "";
      width: 3px;
      height: 3px;
      background-color: #555;
      position: absolute; /*position의 값을 부여하면 block요소가 됨.*/
      top: 0;
      bottom: 0;
      right: -1px;
      margin: auto;
    }
    footer .menu li:last-child::before {
      display: none;
    }

    footer .menu li a {
      font-size: 12px;
      padding: 5px 15px;
      display: block;
    }
    footer .menu li a {
      font-size: 12px;
      padding: 5px 15px;
      display: block;
    }

    footer .inner .info {
      list-style-type: none;
      padding: 0;
      margin: auto;
      display: flex;
      justify-content: center;
      align-items: center;
    }
    footer .inner .info {
      list-style-type: none;
      padding: 0;
      margin: auto;
      display: flex;
      justify-content: center;
      align-items: center;
    }

    footer .info span {
      margin-right: 20px;
      font-size: 12px;
    }
    footer .info span {
      margin-right: 20px;
      font-size: 12px;
    }

    footer .info span:last-child {
      margin-right: 0;
    }
    footer .info span:last-child {
      margin-right: 0;
    }

    footer .inner .info .copyright {
      display: flex;
      align-items: center;
    }

</style>

</head>
<body>

    <%@ include file="../mypage/mypageMenubar.jsp" %>

    <div id="wrap">
        <div id="account_management">
            <h2>내 계정</h2>
            <div id="withdrawal">
                <button type="button" onclick="location.href='<%=contextPath%>/Delete.m?uno=<%=loginUser.getUserNo()%>'">회원탈퇴</button>
            </div>

            <form id="account_form" action="<%=request.getContextPath()%>/information.edit" method="post">
                <input type="hidden" name="userNo" value="<%= loginUser.getUserNo() %>">

                <div>
                    <label for="name">닉네임</label><br>
                    <input type="text" value="<%= loginUser.getUserName()%>" name="name">
                    <button type="button" onclick="nickNameCheck()">중복확인</button>
                    <div class="info">닉네임은 2~10자 이내로 설정 가능합니다.</div>
                </div>
                <div>
                    <label for="password">비밀번호 변경</label><br>
                    <input type="password" id="password" name="password" required>
                </div>
                <div>
                    <label for="password_confirm">비밀번호 일치 확인</label><br>
                    <input type="password" id="password_confirm" name="password_confirm" required>
                    <div id="passwordError"></div>
                </div>
                <div>
                    <label for="phone">전화번호</label><br>
                    <input type="text" name="phone" value="<%= loginUser.getPhone()%>" >
                </div>
                <div>
                    <label for="email">이메일 변경</label><br>
                    <input type="email" name="email" value="<%= loginUser.getEmail()%>" required>
                    <button type="button" onclick="requestEmailVerification()">인증 요청</button>
                </div>
                <div>
                    <label for="email_code">이메일 인증 코드</label><br>
                    <input type="text" name="email_code">
                </div>

                <div id="actions">
                    <button type="submit" id="applyButton" disabled>적용</button>
                </div>
            </form>
        </div>
    </div>
    
    <footer>
      <div class="inner">
        <ul class="menu">
          <li><a href="">개인정보처리방침</a></li>
          <li><a href=""> 이용약관 </a></li>
          <li><a href="">위치정보이용약관</a></li>
          <li><a href="">원클래스약관</a></li>
        </ul>

        <div class="info">
          <span>kh H반 4조</span>
          <span>semi4jyo@gmail.com</span>
          <span>개인정보 책임자 4조</span>

          <p class="copyright">
            &copy; <span id="this-year"></span> kh정보교육원 H반 4조
            세미프로젝트
          </p>
        </div>
      </div>
    </footer>
    
    <script>
      // footer this-year (현재년도 표시)
      const thisYear = document.querySelector("#this-year");
      thisYear.textContent = new Date().getFullYear();
    </script>

    <script>
        function nickNameCheck(){
            const $nickNameInput = $("#account_form input[name=nickname]");

            $.ajax({
                url: "nicknameCheck.me",
                data: { checkNickname: $nickNameInput.val() },
                success: function(result){
                    if(result === 'NNNNN'){ // 사용이 불가능할 경우
                        alert("이미 존재하는 닉네임입니다.");
                        $nickNameInput.focus();
                    } else { // 사용 가능일 경우
                        if(confirm("사용 가능한 닉네임입니다. 사용하시겠습니까?")){
                            $("#applyButton").removeAttr("disabled");
                            $nickNameInput.attr("readonly", true);
                        } else {
                            $nickNameInput.focus();
                        }
                    }
                }, error: function(){
                    console.log("닉네임 중복확인 실패");
                }
            });
        }

        function allForm() {
            const password = document.getElementById('password').value;
            const passwordConfirm = document.getElementById('password_confirm').value;
            const passwordError = document.getElementById('passwordError');
            const applyButton = document.getElementById('applyButton');

            // 
            if (password !== passwordConfirm) {
                passwordError.innerText = "비밀번호가 일치하지 않습니다.";
                applyButton.disabled = true;
                return false;
            } else {
                passwordError.innerText = "";
            }

            // 다 입력했는지 여부
            const requiredFields = document.querySelectorAll('#account_form input[required]');
            let fill = true;

            requiredFields.forEach((field) => {
                if (!field.value.trim()) {
                    allFilled = false;
                }
            });

            if (fill) {
                applyButton.disabled = false;
            } else {
                applyButton.disabled = true;
            }

            return fill;
        }

        // 모든 필드 입력 시 즉시 확인
        document.querySelectorAll('#account_form input').forEach((input) => {
            input.addEventListener('input', allForm);
        });
    </script>
</body>
</html>
