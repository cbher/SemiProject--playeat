<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                <div class="find-id">
                  이름 <br>
                  <input type="text" id="find-name" required placeholder="가입시 입력한 이름"> <br><br>
                  이메일 <br>
                  <input type="text" id="find-email" required placeholder="가입시 입력한 이메일">
                </div>
                <br>
              <div id="find-btn">
                <input type="submit" value="아이디 찾기">
              </div>
            </form>
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
                <div class="find-password">
                  이름 <br>
                  <input type="text" id="find-name" required placeholder="가입시 입력한 이름"> <br><br>
                  아이디 <br>
                  <input type="text" id="find-name" required placeholder="가입시 입력한 아이디"> <br><br>
                  이메일 <br>
                  <input type="text" id="find-email" required placeholder="가입시 입력한 이메일">
                </div>
                <br>
              <div id="find-btn">
                <input type="submit" value="비밀번호 찾기">
              </div>
            </form>
          </div>
        </div>

        <a href="<%= contextPath %>/enrollForm.me">회원가입</a>

        <div class="api">
          <div id="naverIdLogin"></div>
          </form>
          <a href="javascript:kakaoLogin()" id="kakao-login-btn">Login with Kakao</a>
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

	Kakao.init('d13c220127f473864f322330bb5e784e');
	
	console.log(Kakao.isInitialized());
	
	function kakaoLogin() {
        Kakao.Auth.login({
            success: function (response) {
                Kakao.API.request({
                    url: '/v2/user/me',
                    success: function (response) {
						$.ajax({
							url: 'idCheck.me',
							data: {checkId: response.id},
							success: function(result) {
								if(result == "NNNNN") {
									// 카카오로그인
									loginKakaoUser(response.id);
								} else {
									// 카카오 회원가입
									insertKakaoUser(response.id, response.kakao_account.email, response.kakao_account.name);
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

	function insertKakaoUser(id, email, name, nickname) {
	    $.ajax({
	        url: "kakaoInsert.me",
	        type: "post",
	        data: {
	            userId: id,
	            email: email,
	            userName: name,
	            nickname: nickname
	        },
	        success: function() {
	            if (nickname == null || nickname === "") {
	                alert(name + "님, 회원가입이 완료되었습니다.");
	            } else {
	                alert(nickname + "님, 회원가입이 완료되었습니다.");
	            }
	            // Redirect to the context path after success
	            location.href = "<%= contextPath %>/LoginComplete.me";
	        },
	        error: function() {
	            console.error("Kakao user insert AJAX call failed");
	        }
	    });
	}

    </script>


<script src="https://cdnjs.cloudflare.com/ajax/libs/js-cookie/3.0.1/js.cookie.min.js"></script>
</body>
</html>