<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="/semi/resources/css/noticeinsert.css">

<!-- 
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
 -->
</head>
<body>

<%@include file="../common/menubar.jsp" %>


<div class="insertNo-area" align="center">
	<h3 align="center">공지글 작성하기</h3>
    <form action="<%=contextPath %>/insert.no" method="post" enctype="multipart/form-data">
        <table align="center" id="insertTable">
            <thead>
                <tr>
                   <th width="60">제목</th>
                   <td width="300"><input type="text" name="title" required></td>
                   
                </tr>
            </thead>
            <tbody>
            <tr>
            	<th colspan="2" align="center">내용</th>
            </tr>
                <tr>
                    <td colspan="2">
                        <textarea name="content" id="" required></textarea>
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