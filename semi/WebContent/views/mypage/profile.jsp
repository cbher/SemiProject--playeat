<%@page import="semi.mypage.editProfile.model.vo.EditProfile"%>
<%@page import="java.util.ArrayList"%>
<%@page import = "semi.member.model.vo.Member" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
    
   <%  
   
  
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로필 수정</title>
 
 <style>

#wrap {
    width: 600px;
    margin: 50px auto 0;
    background-color: #f6f5f0;
    padding-bottom: 50px;
}

#content {
    background-color: #ffffff;
    padding: 40px;
    border-radius: 10px;
    margin-bottom: 50px;
    text-align: center;
}

#content_title {
    font-size: 24px;
    font-weight: bold;
    margin-bottom: 20px;
}

#profile_picture {
    position: relative;
    display: flex;
    flex-direction: column;
    align-items: center;
    margin-bottom: 30px;
}

#profile_picture img {
    width: 150px;
    height: 150px;
    border-radius: 50%;
    background-color: #e2e2e2;
    margin-bottom: 10px;
}

#profile_picture button {
    background-color: transparent;
    border: none;
    cursor: pointer;
    position: absolute;
    bottom: 10px;
    right: 10px;
}

#profile_picture button img {
    width: 30px;
    height: 30px;
}

form {
    display: flex;
    flex-direction: column;
    align-items: center;
    gap: 20px;
    width: 100%;
}

label {
    font-weight: bold;
    width: 100%;
}

input[type="text"], textarea {
    width: 100%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
}

textarea {
    resize: none;
    height: 100px;
}

#nick_box {
    display: flex;
    align-items: center;
    width: 100%;
    justify-content: space-between;
}

#nick_box input {
    flex-grow: 1;
    margin-right: 10px;
}

#nick_box button {
    width: 230px;
    height: 30px;
    background-color: #ff7f50;
    color: white;
    border-radius: 5px;
    border: none;
    cursor: pointer;
}

#nick_box button:hover {
    background-color: #e67350;
}

#changebtn {
    padding: 10px;
    background-color: #ff7f50;
    border: none;
    color: white;
    font-weight: bold;
    cursor: pointer;
    border-radius: 5px;
}

#changebtn:hover {
    background-color: #e67350;
}

.info {
    font-size: 12px;
    color: #888;
    text-align: left;
    width: 100%;
    margin-top: -10px;
    text-align:center;
}

#intro {
    width: 300px;
    height: 200px;
}

    </style>

</head>
<body>
		<%@ include file="../mypage/mypageMenubar.jsp" %>
	         <%@ include file="../common/footer.jsp" %>
    <div id="wrap">
        <div id="content">
            <div id="content_title">프로필 수정</div>

            <div id="profile_picture">
                <% if (profile != null && profile.get(0).getFilename() != null) { %>
                    <!-- 프로필 사진이 있는 경우 -->
                    <img id="titleImg" src="<%= request.getContextPath() %>/resources/images/profile/<%=profile.get(0).getFilename() %>" alt="">
                <% } else { %>
                    <!-- 기본 이미지 -->
                    <img id="titleImg" src="resources/images/mypage/emptyprofile.png" alt="기본 프로필 사진">
                <% } %>
            </div>

            <!-- 프로필 이미지 변경 -->
            <form action="<%=request.getContextPath()%>/updateProfile.bo" method="post" enctype="multipart/form-data">
            <div>		
              	<label for="profileInput">
                    <img src="<%= request.getContextPath() %>/resources/images/mypage/emptyImg.png" alt="카메라 아이콘" width="60" height="60">
              	</label>
              	<input type="file" id="profileInput" name="profileImage" style="display: none;" onchange="previewProfile(this)">
            </div>

            
              <div id="nick_box">
                  <label for="nickname">닉네임 변경</label>
                  <!-- 닉네임 처리 -->
						<%if(profile.get(0).getNickname()==null) {%>
						 <input type="text" name="nickname" id="nickname" value="" required>
						<%}else {%>
						  <input type="text" name="nickname" id="nickname" value="<%= profile.get(0).getNickname() %>" required>
						<%}%>
                    <button id ="checkbtn" type="button" onclick="nickNameCheck()">중복 확인</button>
                    <div class="info">*닉네임은 2~10자 이내로 설정 가능합니다.</div>
                </div>

                <div id="intro-label">
                    <label for="intro">자기소개</label>
                </div>
					                <%
					  if (profile.get(0).getIntroduce() == null) {%>
					    <textarea id="intro" name="intro" maxlength="35">자기소개가 아직 작성되지 않았습니다.</textarea>
					<%}else {%>
					    <textarea id="intro" name="intro" maxlength="35"><%= profile.get(0).getIntroduce() %></textarea>
					<%}%>
                <div class="info info-center">*자기소개는 최대 35자까지 가능합니다.</div> <!-- 이 부분을 중앙 정렬로 변경 -->

                <button id="changebtn" type="submit">변경 내용 저장</button>
            </form>
        </div>
    </div>

    <script>
    function previewProfile(input) { //input을 통해 현재 작성된 사진 미리보기
        if (input.files && input.files[0]) { 
            const reader = new FileReader(); //파일이 존재하는 경우 미리보기 생성
            reader.onload = function(e) {
                document.getElementById('titleImg').src = e.target.result;
            };
            reader.readAsDataURL(input.files[0]);
        }
    }

    function nickNameCheck(){
		const $nickNameInput = $("#nickname");
		
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
						$nickNameInput.focus(); //
					}
				}

			}, error:function(){
				console.log("닉네임 중복체크용 ajax 통신 실패!")
			},
		});
	}
    </script>
</body>
</html>