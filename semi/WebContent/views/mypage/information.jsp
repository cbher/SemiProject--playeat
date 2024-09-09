<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

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

</style>

</head>
<body>

    <%@ include file="../mypage/mypageMenubar.jsp" %>
    <%@ include file="../common/footer.jsp" %>

    <div id="wrap">
        <div id="account_management">
            <h2>ë´ ê³ì </h2>
            <div id="withdrawal">
                <button type="button" onclick="location.href='<%=contextPath%>/Delete.m?uno=<%=loginUser.getUserNo()%>'">íìíí´</button>
            </div>

            <form id="account_form" action="<%=request.getContextPath()%>/information.edit" method="post">
                <input type="hidden" name="userNo" value="<%= loginUser.getUserNo() %>">

                <div>
                    <label for="name">ëë¤ì</label><br>
                    <input type="text" value="<%= loginUser.getUserName()%>" name="name">
                    <button type="button" onclick="nickNameCheck()">ì¤ë³µíì¸</button>
                    <div class="info">ëë¤ìì 2~10ì ì´ë´ë¡ ì¤ì  ê°ë¥í©ëë¤.</div>
                </div>
                <div>
                    <label for="password">ë¹ë°ë²í¸ ë³ê²½</label><br>
                    <input type="password" id="password" name="password" required>
                </div>
                <div>
                    <label for="password_confirm"> ë¹ë°ë²í¸ ì¼ì¹ íì¸</label><br>
                    <input type="password" id="password_confirm" name="password_confirm" required>
                    <div id="passwordError"></div>
                </div>
                <div>
                    <label for="phone">ì íë²í¸</label><br>
                    <input type="text" name="phone" value="<%= loginUser.getPhone()%>" >
                </div>
                <div>
                    <label for="email">ì´ë©ì¼ ë³ê²½</label><br>
                    <input type="email" name="email" value="<%= loginUser.getEmail()%>" required>
                    <button type="button" onclick="requestEmailVerification()">ì¸ì¦ ìì²­</button>
                </div>
                <div>
                    <label for="email_code">ì´ë©ì¼ ì¸ì¦ ì½ë</label><br>
                    <input type="text" name="email_code">
                </div>

                <div id="actions">
                    <button type="submit" id="applyButton" disabled>ì ì©</button>
                </div>
            </form>
        </div>
    </div>

    <script>
        function nickNameCheck(){
            const $nickNameInput = $("#account_form input[name=nickname]");

            $.ajax({
                url: "nicknameCheck.me",
                data: { checkNickname: $nickNameInput.val() },
                success: function(result){
                    if(result === 'NNNNN'){ // ì¬ì©ë¶ê°ë¥ì¼ ê²½ì°
                        alert("ì´ë¯¸ ì¡´ì¬íë ëë¤ììëë¤.");
                        $nickNameInput.focus();
                    } else { // ì¬ì©ê°ë¥ì¼ ê²½ì°
                        if(confirm("ì¬ì©ê°ë¥í ëë¤ììëë¤. ì¬ì©íìê² ìµëê¹?")){
                            $("#applyButton").removeAttr("disabled");
                            $nickNameInput.attr("readonly", true);
                        } else {
                            $nickNameInput.focus();
                        }
                    }
                }, error: function(){
                    console.log("ëë¤ì ì¤ë³µíì¸ ì¤í¨!");
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
                passwordError.innerText = "ë¹ë°ë²í¸ê° ì¼ì¹íì§ ììµëë¤.";
                applyButton.disabled = true;
                return false;
            } else {
                passwordError.innerText = "";
            }

            // ëª¨ë  ì¹¸ ìë ¥
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

        // íë ìë ¥ ì ì¦ì íì¸
        document.querySelectorAll('#account_form input').forEach((input) => {
            input.addEventListener('input', allForm);
        });
    </script>
</body>
</html>
