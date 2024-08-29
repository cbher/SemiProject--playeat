<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<link rel="stylesheet" href="/semi/resources/css/insertInquirePage.css">

</head>
<body>

<%@include file="../common/menubar.jsp" %>

<div class="insertInq-area" align="center">
	<h3 align="center">문의사항 작성</h3>
    <form action="<%=contextPath %>/insertInq.inq" method="post" enctype="multipart/form-data">
       <input type="hidden" name="userNo" value="<%=loginUser.getUserNo() %>" >
        <table align="center" id="insertTable">
            <thead>
                <tr>
                   <th width="60">문의 제목</th>
                   <td width="300"><input type="text" name="title" required></td>
                   
                </tr>
            </thead>
            <tbody>
            <tr>
            	<th colspan="3" align="center">문의내용</th>
            	
            </tr>
                <tr>
                    <td colspan="3">
                        <textarea name="content" id="" required></textarea>
                    </td>
                </tr>
                <tr>
                	<td>첨부파일 :</td>
                    <td colspan="2">
                       <input type="file" name="upfile" >
                    </td>
                </tr>
                
            </tbody>
        </table>
        <div class="btn-center">
        <button type="submit" class="btn btn-sm btn-outline-info">등록하기</button>
        <button type="reset" class="btn btn-sm btn-outline-warning">초기화</button>
        <button class="btn btn-sm btn-outline-secondary" onclick="history.back()">뒤로가기</button>
         </div>  
    </form>

</div>






<%@include file="../common/footer.jsp" %>
</body>
</html>