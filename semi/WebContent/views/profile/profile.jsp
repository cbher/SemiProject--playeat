<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <style>
        body, h1, h2, h3, h4, h5, h6, p, ul, li, div, a {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            font-family: Arial, sans-serif;
            background-color: #f6f5f0;
        }
        .inner {
            width: 1100px;
            margin: 0 auto;
            position: relative;
        }
        img {
            display: block;
        }
        a {
            text-decoration: none;
            color: inherit;
        }

       
        /* Content */
        #wrap {
            width: 1100px;
            margin: 50px auto 0;
            background-color: #f6f5f0;
            padding-bottom: 50px;
        }
        #content {
            background-color: #ffffff;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
            margin-bottom: 50px;
        }
        #content_title {
            text-align: center;
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 20px;
        }
        #profile_picture {
            display: flex;
            flex-direction: column;
            align-items: center;
            margin-bottom: 30px;
        }
        #profile_picture img {
            width: 200px;
            height: 200px;
            border-radius: 50%;
            background-color: #e2e2e2;
            margin-bottom: 10px;
        }
        #profile_picture button {
            background-color: transparent;
            border: none;
            cursor: pointer;
        }
        #profile_picture button img {
            width: 50px;
            height: 50px;
        }
        form {
            display: flex;
            flex-direction: column;
            gap: 20px;
        }
        label {
            font-weight: bold;
            margin-bottom: 5px;
        }
        input[type="text"], input[type="file"], textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        textarea {
            resize: none;
            height: 100px;
            
        }
        #nickname_section {
            display: flex;
            align-items: center;
            width: 300px;
            
        }
        #nickname_section input {
            flex-grow: 1;
            
        }
        #nickname_section button{
                width:120px;
                height:40px;
        }
        button {
            
            background-color: #ff7f50;
            border: none;
            color: white;
            font-weight: bold;
            cursor: pointer;
            border-radius: 5px;
        }
        button:hover {
            background-color: #e67350;
        }
        
        #changebtn{
            width:150px;
        }
       
    </style>

</head>
<body>

    <%@ include file="../common/mypageMenubar.jsp" %>
    <%@ include file="/views/common/footer.jsp" %>



    <div id="wrap">
        <div id="content">
            <div id="content_title">프로필 수정</div>

            <div id="profile_picture">
                <img src="" >
                <button>
                    <img src="./resourse/camera_icon.png" >
                    <input type="file">
                </button>
            </div>

            <form>
                <div id="nickname_section">
                    <label for="nickname">닉네임 변경</label>
                    <input type="text" id="nickname" required>
                    <button type="button">중복확인</button>
                </div>

                <div>
                    <label for="intro">자기소개</label>
                    <textarea id="intro" maxlength="35"></textarea>
                </div>

                <button id ="changebtn"type="submit">변경 내용 저장</button>
            </form>
        </div>

      
    </div>















</body>
</html>