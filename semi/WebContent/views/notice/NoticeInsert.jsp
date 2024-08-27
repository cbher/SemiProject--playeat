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
       	<input type="hidden" value="<%=loginUser.getUserNo()%>" name="userNo">
        <table align="center" id="insertTable">
            <thead>
                <tr>
                   <th width="60">제목</th>
                   <td width="300"><input type="text" name="title" required></td>
                   
                </tr>
            </thead>
            <tbody>
            <tr>
            	<th colspan="3" align="center">내용</th>
            </tr>
                <tr>
                    <td colspan="3">
                        <textarea name="content" id="" required></textarea>
                    </td>
                </tr>
                <tr>
                    <th>대표이미지</th>
                    <td colspan="3" align="center">
                        <img src="" alt="" id="titleImg" width="300" height="170px" onclick="chooseFile(1)">
                    </td>
                </tr>
                <tr>
                    <th width="120">상세이미지</th>
                    <td><img src="" id="contentImg1" width="200" height="120" onclick="chooseFile(2)"></td>
                    <td><img src="" id="contentImg2" width="200" height="120" onclick="chooseFile(3)"></td>
                   
                </tr>
            </table>
            <div id="file-area" style="display:none;">
                <input type="file" name="file1" id="file1" onchange="loadImg(this,1)" required>
                <input type="file" name="file2" id="file2" onchange="loadImg(this,2)">
                <input type="file" name="file3" id="file3" onchange="loadImg(this,3)"> 
                
            </div>
            </tbody>
        </table>
        <div class="btn-center">
        <button type="submit" class="btn btn-sm btn-outline-info">등록하기</button>
        <button type="reset" class="btn btn-sm btn-outline-warning">초기화</button>
        <button class="btn btn-sm btn-outline-secondary" onclick="history.back()">뒤로가기</button>
         </div>  
    </form>

</div>

  <script>
    	function chooseFile(num){
    		$("#file"+num).click();
    	}
    	
        function loadImg(inputFile, num){
            
            if(inputFile.files.length == 1){ // 파일 선택된 경우 => 파일을 읽어들어다 미리보기
                const reader = new FileReader();

                reader.readAsDataURL( inputFile.files[0]);
              
                reader.onload = function(e){
                  
                    switch(num){
                        case 1: $("#titleImg").attr("src",e.target.result); break;
                        case 2: $("#contentImg1").attr("src",e.target.result); break;
                        case 3: $("#contentImg2").attr("src",e.target.result); break;
                        case 4: $("#contentImg3").attr("src",e.target.result); break;
                    }
                }
			 }else{ 
                switch(num){
                        case 1: $("#titleImg").attr("src",null); break;
                        case 2: $("#contentImg1").attr("src",null); break;
                        case 3: $("#contentImg2").attr("src",null); break;
                        case 4: $("#contentImg3").attr("src",null); break;
                    }
            	}
        
      	  }
        
    </script>










<%@include file="../common/footer.jsp" %>



</body>
</html>