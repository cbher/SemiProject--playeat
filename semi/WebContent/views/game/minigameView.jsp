<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.outer{
		position: relative;
		top: 300px;
		background-color: #f6f5f0;
		width: 1100px;
		height: 800px;
		margin: auto;
	}
	.buttons{
		position: absolute;
		top: 1200px;
		
		left: 45%;
	}
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	
	<div class="outer">	

	</div>

	<div class="buttons">
		<button>사다리타기</button>
		<button>랜덤뽑기</button>
		<button>제비뽑기</button>
		<button>룰렛돌리기</button>

	</div>

</body>	
</html>