<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>리뷰 작성</title>
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link rel="stylesheet" href="/semi/resources/css/review_form.css">
    
        <script src="./js/review_form.js"></script>
    </head>
    <body>
        
        <header>
            <div class="inner">
                <a href="" class="logo">
                    <img src="./resourse/play_eat-removebg-preview.png" alt="">
                </a>
                <div class="search">
                    <form action="test.do">
                        
                            <input type="text" name="search" placeholder="검색어를 입력하세요">
                            <button class="material-icons" type="submit" >search</button>
                        
                    </form>
                </div>
                <div class="login">
                    <ul>
                        <li><a href="">로그인</a></li>
                        <li><a href="">회원가입</a></li>
                    </ul>
                </div>
                
            </div>
            <section class="menubar">
                <div class="menu">
                    <ul class="inner">
                        <li>
                            <a href="">공지문의</a>
                            <ul class="hide-menu">
                                <li><a href="">공지사항</a></li>
                                <li><a href="">문의사항</a></li>
                                <li><a href="">자주묻는질문</a></li>
                            </ul>   
                        </li>
                        <li>
                            <a href="">놀거리</a>
                            <ul class="hide-menu">
                                <li><a href="">테마별</a></li>
                                <li><a href="">지역별</a></li>
                                <li><a href="">원데이클래스</a></li>
                            </ul>   
                        </li>
                        <li>
                            <a href="">요리</a> 
                            <ul class="hide-menu">
                                <li><a href="">레시피 찾기</a></li>
                                <li><a href="">레시피 업로드</a></li>
                                <li><a href="">이번달 명예의 전당</a></li>
                            </ul>  
                        </li>
                        <li>
                            <a href="">맛집찾기</a>
                            <ul class="hide-menu">
                                <li><a href="">맛집검색</a></li>
                                <li><a href="">지역별 맛집</a></li>
                                <li><a href="">가격별 맛집</a></li>
                                <li><a href="">랜덤 메뉴 추천</a></li>
        
                            </ul>   
                        </li>
                        <li>
                            <a href="">미니게임</a>
                            <ul class="hide-menu">
                                <li><a href="">랜덤뽑기</a></li>
                                <li><a href="">사다리타기</a></li>
                                <li><a href="">룰렛돌리기</a></li>
                                <li><a href="">제비뽑기</a></li>
                            </ul>   
                        </li>                                  
                    </ul>
                </div>
            </section>
        </header>
    
        <!-- 리뷰 폼 -->
    
        <div class="review-form">
            <br>
            <h2 align="center">리뷰 작성하기</h2>
            <br>
    
            <form action="" id="enroll-form" method="post" enctype="multipart/form-data">
            
            <table align="center" class="review-area">
                <tr>
                    <th>내용</th>
                    <td colspan="3">
                        <textarea name="content" rows="5" style="resize: none; height: 300px;" required></textarea>
                    </td>
                </tr>
                <tr>
                    <th>상세이미지</th>
                    <td align="center"><img id="contentImg1" width="150" height="120" onclick="chooseFile(1)"></td>
                    <td align="center"><img id="contentImg2" width="150" height="120" onclick="chooseFile(2)"></td>
                    <td align="center"><img id="contentImg3" width="150" height="120" onclick="chooseFile(3)"></td>
                </tr>
            </table>
    
            <div id="file-area" style="display: none;"> <!-- 버튼 있지만 안보임 -->
                <input type="file" name="file1" id="file" onchange="loadImg(this, 1)" required>
                <input type="file" name="file2" id="file" onchange="loadImg(this, 2)">
                <input type="file" name="file3" id="file" onchange="loadImg(this, 3)">
            </div>
            <br>
            <div align="center">
                <button type="submit" id="enter-btn">등록하기</button>
            </div>
            </form>    
        </div>
    
        <footer class="footer">
            <div class="inner">
              <ul class="menu">
                <li><a href="">개인정보처리방침</a></li>
                <li><a href=""> 이용약관 </a></li>
                <li><a href="">위치정보이용약관</a></li>
                <li><a href="">원클래스약관</a></li>            
              </ul>
          
              <div class="info3">
                <span>kh H반 4조</span>
                <span>semi4jyo@gmail.com</span>
                <span>개인정보 책임자 4조</span>
                    
                <p class="copyright">
                  &copy; <span id="this-year"></span> kh정보교육원 H반 4조 세미프로젝트
                </p>
              </div>
            </div>
        </footer>
    </body>
    </html>