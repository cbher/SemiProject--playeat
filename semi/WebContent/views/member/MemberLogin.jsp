<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% Member member = (Member)session.getAttribute("member"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
    <link rel="stylesheet" href="/semi/resources/css/login.css?after">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
	 <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	 <script type="text/javascript" src="https://developers.kakao.com/sdk/js/kakao.js"></script>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	<%@ include file="../common/footer.jsp" %>

    <div class="login-wrapper">
        <h2>Login</h2>
        <form method="post" action="<%= contextPath %>/LoginComplete.me" id="login-form">
            <input type="text" name="userName" placeholder="아이디" id="id">
            <input type="password" name="userPassword" placeholder="비밀번호">
            <label for="checkId">
                <input type="checkbox" id="checkId"> 아이디 저장하기
            </label>
            <input type="submit" value="Login" class="login-btn">
        </form>

        <!-- 아이디 찾기 -->
        <button id="modalBtn">아이디 찾기</button>
        
        <div id="myModal" class="comment-modal">
          <div class="modal-content">
            <span class="close" id="closeBtn">&times;</span>
              <form>
                <p class="title">
                  아이디 찾기            
                </p>
                <br>
                <hr>
                <br>
                <div class="find-id" id="find-id">
                  이름 <br>
                  <input type="text" id="find-name" required placeholder="가입시 입력한 이름"> <br><br>
                  이메일 <br>
                  <input type="text" id="find-email" required placeholder="가입시 입력한 이메일">
                <br><br>
              <div id="find-btn">
                <input type="button" onclick="btnFindId()" value="아이디 찾기">
              </div>
                </div>
            </form>
             <div class="id-result" id="id-result" style="display: none;">
		      <h3 align="center">조회된 아이디입니다.</h3>
		      <p align="center"> 아이디 : <span id="userId"></span> (가입일: <span id="enrollDate"></span>)</p>
		      <br>
		      <a href="<%= contextPath %>/login.me" class="loginbtn" style="margin: auto; margin-left: 230px;">로그인</a>
		    </div>
          </div>
        </div>
        
        <!-- 비밀번호 찾기 -->
        <button id="modalBtn2">비밀번호 찾기</button>
        
        <div id="myModal2" class="comment-modal2">
          <div class="modal-content2">
            <span class="close" id="closeBtn2">&times;</span>
              <form>
                <p class="title">
                  비밀번호 찾기            
                </p>           
                <hr>
                <br>
                <div class="find-password" id="find-password">
                  이름 <br>
                  <input type="text" id="pwd-name" required placeholder="가입시 입력한 이름"> <br><br>
                  아이디 <br>
                  <input type="text" id="pwd-id" required placeholder="가입시 입력한 아이디"> <br><br>
                  이메일 <br>
                  <input type="text" id="pwd-email" required placeholder="가입시 입력한 이메일">
                <br><br>
              <div id="find-btn">
                <input type="button" onclick="btnFindPwd()" value="비밀번호 찾기">
              </div>
                </div>
            </form>
            
            <div id="div-input-pwd" style="display: none">
		        <h3 align="center">변경할 비밀번호를 입력해 주세요.</h3>
		
		        <div class="form-group" align="center">
		          <div id="input-group">
		            <input class="inputboxlist" type="password" id="password" name="password"  style="height: 30px;" required placeholder="비밀번호"/>
		          </div>
		        </div>
            <br>
		        <div class="form-group" align="center">
		          <div class="input-group">
		            <input class="inputboxlist" type="password" id="passwordCheck"  name="passwordCheck" style="height: 30px;" required placeholder="비밀번호 확인"/>
		          </div>
		        </div>
            <br><br>  
		        <input type="button" class="submitbtn" onclick="btnChangePwd()" style="margin: auto; margin-left: 200px; background-color: none; height: 30px; border-radius: 10px; cursor: pointer;" value="비밀번호 변경">
      		</div>
          </div>
        </div>

        <a href="<%= contextPath %>/enrollForm.me">회원가입</a>

        <div class="api">
          </form>
          <a href="javascript:kakaoLogin()" id="kakao-login-btn">
            <img src="/semi/resources/backGroundImg/kakao_login_medium_narrow.png" alt="">
          </a>
        </div>
        
    </div>
    
    <script>
        $(document).ready(function() {
            // Retrieve and set the saved ID from the cookie if it exists
            var savedId = Cookies.get('userId');
            if (savedId) {
                $('#id').val(savedId); // Pre-fill the ID input
                $('#checkId').prop('checked', true); // Keep the checkbox checked
            }

            // When the form is submitted, handle the ID storage logic
            $('#login-form').on('submit', function(event) {
                var userId = $('#id').val(); // Get the entered ID
                
                // If the checkbox is checked, save the ID in the cookie
                if ($('#checkId').is(':checked')) {
                    Cookies.set('userId', userId, { expires: 7, path: '/' });
                } else {
                    // If unchecked, remove the saved ID
                    Cookies.remove('userId', { path: '/' });
                }
            });
        });

       
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

    document.addEventListener("DOMContentLoaded", function () {
    // elements
    var modalBtn2 = document.getElementById("modalBtn2");
    var modal2 = document.getElementById("myModal2");
    var closeBtn2 = document.getElementById("closeBtn2");

    // functions
    function toggleModal() {
        modal2.classList.toggle("show");
    }

    // events
    modalBtn2.addEventListener("click", toggleModal);
    closeBtn2.addEventListener("click", toggleModal);

    window.addEventListener("click", function (event) {
        // 모달의 검은색 배경 부분이 클릭된 경우 닫히도록 하는 코드
        if (event.target === modal2) {
        toggleModal();
        }
    });
    });
    

    // 카카오API

	Kakao.init('380af2edeb82dfbf591425877a112ec6');
	
	console.log(Kakao.isInitialized());
	
	function kakaoLogin() {
        Kakao.Auth.login({
            success: function (response) {
                Kakao.API.request({
                    url: '/v2/user/me',
                    success: function (response) {
                    	 const kakaoAccount = response.kakao_account;
                         
                         const id = response.id;
                         const email = kakaoAccount.email;
                         const name = kakaoAccount.profile.nickname;
                         const phoneNumber = kakaoAccount.phone_number;
						$.ajax({
							url: 'idCheck.me',
							data: {checkId: response.id},
							success: function(result) {
                    			//alert(response.id);	
								if(result == "NNNNN") {
									// 카카오로그인
									loginKakaoUser(response.id);
								} else {
									// 카카오 회원가입
									insertKakaoUser(response.id, response.kakao_account.email, response.kakao_account.name, response.kakao_account.nickname, response.kakao_account.phone_number);
								}
							},
							error: function() {
								console.log("카카오 로그인/회원가입용 ajax 통신 실패");
							}
						});

                    },
                    fail: function (error) {
                        alert(JSON.stringify(error));
                    },
                })
            },
            fail: function (error) {
                alert(JSON.stringify(error));
            },
        })
    }

	function loginKakaoUser(id) {
		$.ajax({
			url: "kakaoLogin.me",
			type: "post",
			data: {userId: id},
			success: function() {
				location.href="<%= contextPath %>";
			},
			error: function() {
				console.log("kakao user login ajax 실패");
			}
		});
	}

	function insertKakaoUser(id, email, name, nickname, phone) {
		console.log("userId: " + id);
	    console.log("email: " + email);
	    console.log("name: " + name);
	    console.log("nickname: " + nickname);  // 닉네임 확인
	    console.log("phone: " + phone);
	    
	    $.ajax({
	        url: "kakaoInsert.me",
	        type: "post",
	        data: {
	            userId: id,
	            email: email,
	            userName: name,
	            nickname: nickname,
	            phone: phone
	        },
	        success: function() {
	            if (nickname == null || nickname === "") {
	                alert(name + "님, 회원가입이 완료되었습니다.");
	            } else {
	                alert(nickname + "님, 회원가입이 완료되었습니다.");
	            }
	            // Redirect to the context path after success
	            location.href = "<%= contextPath %>";
	        },
	        error: function() {
	            console.error("Kakao user insert AJAX call failed");
	        }
	    });
	}
	
	
	
	// 아이디 찾기
	function btnFindId() {
    const name = $('#find-name').val().trim();
    if (name === "") {
        alert("이름을 입력해 주세요");
        $('#find-name').focus();
        return;
    }
    
    const email = $('#find-email').val().trim();
    if (email === "") {
        alert("이메일을 입력해 주세요");
        $('#find-email').focus();
        return;
    }

    $.ajax({
        url: "searchId.me",
        data: {
            'name': name,
            'email': email
        },
        success: function(result) {
            if (result === "fail") {
                alert("일치하는 가입 정보가 없습니다.");
            } else {
                // 결과를 모달 창 내에 표시
                $(".id-result").show(); // 결과 부분을 표시
                $("#userId").text(result.userId); // 서버로부터 받은 userId 출력
                $("#enrollDate").text(result.enrollDate); // 서버로부터 받은 가입일 출력
                document.getElementById('find-id').style.display = 'none';
				document.getElementById('id-result').style.display = 'block';
            }
        },
        error: function() {
            console.log("아이디 찾기 ajax 통신 실패");
        }
    });
	}
	
	// 비밀번호 찾기
	 function btnFindPwd() {
    const userId = $("#pwd-id").val().trim();
    const name = $("#pwd-name").val().trim();
    const email = $("#pwd-email").val().trim();

    if (!userId || !name || !email) {
        alert("모두 입력해주세요.");
        return;
    }

    $.ajax({
        url: "searchPwd.me",
        data: { userId, name, email },
        success: function (result) {
            if (result === "success") {
                $("#find-password").hide();  // 비밀번호 찾기 폼 숨김
                $("#div-input-pwd").show();   // 비밀번호 변경 폼 표시
            } else {
                alert("일치하는 가입 정보가 없습니다.");
            }
        },
        error: function () {
            alert("서버와의 통신에 실패했습니다.");
        }
    });
}

// 비밀번호 변경 처리
	function btnChangePwd() {
	    const password = $("#password").val().trim();
	    const passwordCheck = $("#passwordCheck").val().trim();
	
	    if (!password || password.length < 8) {
	        alert("비밀번호는 8자리 이상이어야 합니다.");
	        return;
	    }
	    
	    const specialCharRegex = /[@$!%*?&]/;
	    if (!specialCharRegex.test(password)) {
	        alert("비밀번호는 최소 하나의 특수 문자(@$!%*?&)를 포함해야 합니다.");
	        return;
	    }
	
	    if (password !== passwordCheck) {
	        alert("비밀번호 확인이 일치하지 않습니다.");
	        return;
	    }
	
	    $.ajax({
	        url: "changePwd.me",
	        type: "post",
	        data: {
	        		userId: $("#pwd-id").val(),
	        		userPwd: password,
	        	  },
	        success: function (result) {
	        	console.log(result);
	            if (result === "success") {
	                alert("비밀번호가 성공적으로 변경되었습니다.");
	                location.href = "<%= contextPath %>/login.me";
	            } else {
	                alert("비밀번호 변경에 실패했습니다.");
	            }
	        },
	        error: function () {
	            alert("서버와의 통신에 실패했습니다.");
	        }
	    });
	}
	
	

    </script>


<script src="https://cdnjs.cloudflare.com/ajax/libs/js-cookie/3.0.1/js.cookie.min.js"></script>
</body>
</html>