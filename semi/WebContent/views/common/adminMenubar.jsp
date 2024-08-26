<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String contextPath = request.getContextPath();
    String alertMsg = (String)session.getAttribute("adAlertMsg");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
 
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

    <link rel="stylesheet" href="https://unpkg.com/swiper@6.8.4/swiper-bundle.min.css" />
    <script src="https://unpkg.com/swiper@6.8.4/swiper-bundle.min.js"></script>
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
         <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
img{
    display: block;
}

a{
    text-decoration: none;
}
body{
    /* background-color: #f6f5f0; */
    position: relative;
}

.inner{
    width: 1100px;
    margin: 0 auto;
    position: relative;
}

div{
    /* border: 1px solid black; */
}

/* header */


header{
    width: 100%;
    top: 0;
    z-index: 9;
    position: fixed;
    background-color: #f6f5f0
}


header > .inner{
    height: 120px;
    
  
}



header .inner a{
    color: #656565;
}

header .inner a img{
    height: 150%;
    position: absolute;
    top: 0;
    bottom: 0;
    left: 10px;
    margin: auto;
    background-size: cover;
    overflow: hidden;
}

header .inner > .search{
    position: absolute;
    right: 0;
    left: 0;
    height: 100%;
    width: 500px;
    margin: 0 auto;
    box-sizing: border-box;
    display: flex;
    
}

header .inner .search input{
    width: 400px;
    height: 50px;
    border-radius: 40px;
    box-sizing: border-box;
    border-color: #e4d4fa;
    font-size: 17px;
    position: absolute;
    top: 30px; 
    left: 45px;
    padding: 20px;
    padding-right: 50px;
}







header .inner .search input:focus{
    outline: none;
}


header .inner .login{
    position: absolute;
    right: 0;
}
header .inner .login ul{
    display: flex;

}
header .inner .login ul li{
    text-align: center;
    list-style: none;
    margin-right: 15px;
    font-size: 11px;
    font-weight: 700;
    color: #656565;
    position: relative;
}

header .inner .login ul li::before{
    content: "";
    width: 1px;
    height: 10px;
    background-color: #656565;
    display: block;
    position: absolute;
    top: 0;
    bottom: 0;
    left: -7px;
    margin: auto;
}

header .inner .login ul li:first-child:before{display: none;}

header .menubar::before{
    content: "";
    width: 100%;
    height: 1px;
    background-color: #c8c8c8;
    display: block;
}

.menubar{
    background-color: #f6f5f0;
    height: 80px;
    
}

.menubar .menu{
    height: 100%;
    box-sizing: border-box;
}

.menubar .menu .inner{
    display: flex;
    box-sizing: border-box;
    height: 100%;
    padding: 0;
    
}

.menubar .menu .inner li {
    width: 100%;
    height: 100%;
    list-style: none;
}
.menubar .menu .inner li ul{
    width: 100%;
    padding: 0;
    display: none;
}

.menubar .menu .inner li ul li a{
    font-size: 15px;
}




.menubar .menu .inner li a{
    position: relative;
    
    display: block;
    text-align: center;
    line-height: 80px;
    font-size: 18px;
    font-weight: 700;
    color: #8b7dbe;
    transition: all .3s;
}



.menubar .menu .inner  li:hover>a{
    color: purple;
    
}


.menubar .menu .inner  li:hover ul{
    background-color: #e4d4fa;
    opacity: .9;
    transform: scale(1);
    display: block;
    transition: all .4s; 
    
}


.menubar .menu .inner  li ul li:hover a{
    
    color: purple;
    transition: all .5s;
}



.menubar .menu .inner li a:hover:after{
    content: "";
    display: block;
    background-color: purple;
    width: 60%;
    height: 3px;
    margin: 0;
    position: absolute;
    bottom: 0;
    transform: translateX(45px);  
}
header .inner .search button:hover{
    cursor: pointer;
}
</style>
</head>
<body>
  <% if(alertMsg != null){ %>
<script >
	alert("<%=alertMsg%>");
</script>
	<% session.removeAttribute("adAlertMsg"); %>
  <%} %>
    <header>
        <div class="inner">
            <a href="" class="logo">
                <img src="./resourse/play_eat-removebg-preview.png" alt="">
            </a>
            <div class="search">
                <form action="http://localhost:8002/semi/">
                <div style=" width: 400px; height: 100px; margin-top: 10px;      " >
                    <button style="height: 100%; width: 100%; font-size: 40px; font-weight: 900; border: 0; "> 관리자페이지</button>
                   
                </div>
                    
                </form>
            </div>
            <div class="login">
                <ul>
                    <li><a href="">로그아웃</a></li>
                    <li><a href="">마이페이지</a></li>
                </ul>
            </div>
            
        </div>
        <section class="menubar">
            <div class="menu">
                <ul class="inner">
                    <li>
                        <a href="Questions.qe">문의</a>
                   
                    </li>
                    <li>
                        <a href="adPlace.pl">장소관리</a>
                      
                    </li>
           
                    <li>
                        <a href="adBoard.bl">게시판관리</a>
                  
                    </li>
                         <li>
                        <a href="">원클래스 매니저</a>
                  
                    </li>
                    <li>
                        <a href="javascript:0">회원</a>
                        <ul class="hide-menu">
                            <li><a href="adMemberlist.ml?cpage=1">회원관리</a></li>
                            <li><a href="adReportList.rl?cpage=1">신고관리</a></li>                 
                        </ul>   
                    </li>
                   
                   
                   
                    
                </ul>
            </div>
        </section>
    </header>


</body>
</html>