<%@page import="semi.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%	
	String contextPath = request.getContextPath();
	

%> 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

		<br>
		<br>
		<br>		
		<br>
		<br>
    <div class="login-area">
        <h3>login</h3>
        <form action="<%=contextPath %>/login.me" method="post" >
            <table align="center">
                <tr>
                    <th>아이디 :</th>
                    <td><input type="text" name="userId" required ></td>
                   
                </tr>
                <tr>
                    <th>비밀번호 :</th>
                    <td><input type="password" name="userPwd" required></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <button type="submit">로그인</button>
                        <button type="button">회원가입</button>
                    </td>
                </tr>
                <tr>
                    <td><a href="">아이디 찾기</a></td>
                    <td><a href="">비밀번호 찾기</a></td>
                </tr>
	
            </table>
        </form>
    </div>

<%@ include file="../common/footer.jsp" %>

</body>
</html>