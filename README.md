# 🍦세미프로젝트 4조 : 점심4조

![PLAEAT로고](semi/WebContent/resources/backGroundImg/play_eat-removebg-preview.png)

# 🚩프로젝트 소개

다양한 정보를 얻기 위해 여러사이트를 돌아다닐 필요없이 한 사이트에서 사용자들이 대부분의 정보를 얻을수 있으며 친구 또는 연인들이 즐거운 하루를 보낼수 있도록 정보를 드리는 것이 저희가 사이트를 만든 이유입니다.

# 🙌구성원 및 역할

- **조장 : 이준영**

  - 관리자 페이지 회원 수 및 회원목록 조회
  - 관리자 페이지 게시글 관리
  - 관리자 페이지 신고 접수 및 회원 제재
  - 관리자 페이지 문의사항 확인 및 답변
  - 새로운 맛집 및 놀거리 등록 / 수정

- **조원 : 이승헌**

  - 메인 페이지
  - 최근 본 목록 뱃지 (세션 사용)
  - 공지사항 게시판 (사진포함 등록, 삭제, 수정)
  - 문의사항 게시판 (사진포함 등록, 삭제, 수정)
  - 사다리타기 미니게임 (오픈소스 활용)

- **조원 : 오명식**

  - 마이페이지
  - 회원 정보 수정 및 탈퇴
  - 본인이 작성한 리뷰 및 문의사항 조회 / 수정
  - 좋아요 누른 게시글에 대한 찜 리스트 조회

- **조원 : 정민식**

  - 로그인 및 회원가입 (카카오 API)
  - 아이디 및 비밀번호 찾기
  - 원데이 클래스 및 맛집 상세페이지 (카카오 소셜 공유 사용)
  - 상세 검색 페이지 (네이버 지도 API)
  - 명예의 전당 페이지

- **조원 : 황영찬**
  - 놀거리 상세 페이지
  - 맛집 찾기 및 놀거리 찾기 메인페이지
  - 요리 게시판 메인 페이지 및 요리 게시글 상세페이지
  - 요리 게시글 작성, 수정, 삭제 및 추천 기능
  - 상세 검색 페이지 카테고리 구분s

# 💻개발 기간

- **2024.07.09 ~ 2024.07.15 : 주제선정, 팀명, 팀장 프로젝트 주제 정하기**
- **2024.07.15 ~ 2024.07.22 : 유사사이트 분석, 구현목표 및 기능, 요구사항 분석, UseCase Diagram**
- **2024.07.22 ~ 2024.08.05 : 사이트맵 만들기, 메인페이지 화면설계**
- **2024.08.05 ~ 2024.08.12 : DB테이블 설계, ERD 작성**
- **2024.08.12 ~ 2024.08.16 : 화면 JSP 생성, FE JS작성, JDBC통한 오라클 연동**
- **2024.08.16 ~ 2024.08.31 : 프로젝트 구현 및 디버깅**
- **2024.09.01 ~ 2024.09.06 : 베타테스트 진행 및 오류수정**
- **2024.09.07 ~ 2024.09.09 : 프로젝트 최종 발표 및 발표자료 제출**

![alt text](./semi/WebContent/resources/ReadMe/image.png)

# 🔎개발환경

- **OS** : Windows10
- **Developer Tools** : Eclipse / VS Code / SqlDeveloper
- **Server** : Apach Tomcat 9.0
- **DBMS** : Oracle
- **Management** : Git, GitHub
- **Front-end** : HTML5 / CSS3 / JavaScript / jQuery / AJAX / JSON
- **BackEnd** : Java, JSP & Servlet
- **API** : 카카오 로그인 / 소셜 공유 API, 네이버 지도 API

# 🔗테이블 설계

[![ERD](semi/WebContent/resources/ReadMe/ERD.png)](https://www.erdcloud.com/d/SLicMH6G8kXjH2nv8)

# 🎮프로젝트 구현

- **🔴조장 : 이준영**
<details>
<summary>관리자페이지</summary>

- - 🔴관리자 메인페이지

![관리자 메인 페이지](https://github.com/cbher/semi/blob/main/semi/WebContent/resources/adreadyme/ad.%EA%B4%80%EB%A6%AC%EC%9E%90%20%EB%A9%94%EC%9D%B8.gif)

---
- - 🔴문의사항
  - 문의사항목록  ![문의사항 목록 ](https://github.com/cbher/semi/blob/main/semi/WebContent/resources/adreadyme/ad.%EB%AC%B8%EC%9D%98%EC%82%AC%ED%95%AD%20%EB%AA%A9%EB%A1%9D.gif)
  - 답변하기 ![문의사항 답변](https://github.com/cbher/semi/blob/main/semi/WebContent/resources/adreadyme/ad.%EB%AC%B8%EC%9D%98%EC%82%AC%ED%95%AD%20%EB%8B%B5%EB%B3%80%20%EC%A0%95%EC%83%81%EC%9E%91%EB%8F%99.gif)
    
- - 🔴장소 관리
  - 장소 목록![장소 목록 ](https://github.com/cbher/semi/blob/main/semi/WebContent/resources/adreadyme/ad.%EC%9E%A5%EC%86%8C%EB%AA%A9%EB%A1%9D.gif)
  - 장소 검색![장소 검색 ](https://github.com/cbher/semi/blob/main/semi/WebContent/resources/adreadyme/ad.%EC%9E%A5%EC%86%8C%EA%B2%80%EC%83%89.gif)
  - 장소 수정![장소 수정 ](https://github.com/cbher/semi/blob/main/semi/WebContent/resources/adreadyme/ad.%EC%9E%A5%EC%86%8C%EC%88%98%EC%A0%95.gif)
  - 장소 폐업처리![장소 폐업처리 ](https://github.com/cbher/semi/blob/main/semi/WebContent/resources/adreadyme/ad.%EC%9E%A5%EC%86%8C%20%ED%8F%90%EC%97%85%EC%B2%98%EB%A6%AC.gif)
  - 장소 추가하기![장소 추가하기 ](https://github.com/cbher/semi/blob/main/semi/WebContent/resources/adreadyme/ad.%EC%9E%A5%EC%86%8C%20%EC%B6%94%EA%B0%80%ED%95%98%EA%B8%B0.gif)

- - 🔴게시판 관리
  - 게시판 목록![게시판 목록](https://github.com/cbher/semi/blob/main/semi/WebContent/resources/adreadyme/ad.%EA%B2%8C%EC%8B%9C%ED%8C%90%20%EA%B4%80%EB%A6%AC.gif)
  - 게시판 글 삭제![게시판 글 삭제](https://github.com/cbher/semi/blob/main/semi/WebContent/resources/adreadyme/ad.%EA%B2%8C%EC%8B%9C%ED%8C%90%20%EA%B8%80%20%EC%82%AD%EC%A0%9C.gif)
- - 🔴원클래스 관리
  - 원클래스 목록![원클래스 목록](https://github.com/cbher/semi/blob/main/semi/WebContent/resources/adreadyme/ad.%EC%9B%90%ED%81%B4%EB%9E%98%EC%8A%A4%20%EB%AA%A9%EB%A1%9D.gif)
  - 원클래스 수정![원클래스 수정](https://github.com/cbher/semi/blob/main/semi/WebContent/resources/adreadyme/ad.%EC%9B%90%ED%81%B4%EB%9E%98%EC%8A%A4%20%EC%88%98%EC%A0%95%ED%95%98%EA%B8%B0.gif)
  - 원클래스 등록![원클래스 등록](https://github.com/cbher/semi/blob/main/semi/WebContent/resources/adreadyme/ad.%EC%9B%90%ED%81%B4%EB%93%B1%EB%A1%9D2.gif)
  - 원클래스 삭제![원클래스 삭제](https://github.com/cbher/semi/blob/main/semi/WebContent/resources/adreadyme/ad.%EC%9B%90%ED%81%B4%20%EB%A7%A4%EB%8B%88%EC%A0%80%20%EC%82%AD%EC%A0%9C%ED%95%98%EA%B8%B0.gif)\
 - - 🔴회원 관리
   - 회원 목록![회원 목록](https://github.com/cbher/semi/blob/main/semi/WebContent/resources/adreadyme/ad.%ED%9A%8C%EC%9B%90%EB%AA%A9%EB%A1%9D.gif)
   - 회원 제제![회원 제제](https://github.com/cbher/semi/blob/main/semi/WebContent/resources/adreadyme/ad.%ED%9A%8C%EC%9B%90%EC%A0%9C%EC%A0%9C.gif)
 - - 🔴신고 관리
   - 신고 목록![신고 목록](https://github.com/cbher/semi/blob/main/semi/WebContent/resources/adreadyme/ad.%EC%8B%A0%EA%B3%A0%EB%AA%A9%EB%A1%9D%20%ED%99%95%EC%9D%B8%ED%95%98%EB%9F%AC%EA%B0%80%EA%B8%B0.gif)
   - 신고 제제![신고 제제](https://github.com/cbher/semi/blob/main/semi/WebContent/resources/adreadyme/ad.%EC%A0%9C%EC%A0%9C%EC%84%B1%EA%B3%B5%20%EB%A6%AC%ED%8F%BF%EA%B8%B0%EC%A4%80.gif)
   - 신고 제제없음![신고 제제없음](https://github.com/cbher/semi/blob/main/semi/WebContent/resources/adreadyme/ad.%EC%A0%9C%EC%A0%9C%EC%97%86%EC%9D%8C.gif)
   -  </details>
   
- **🟡조원 : 이승헌**

---

- **🟢조원 : 오명식**

---

- **🔵조원 : 정민식**
  
  - 🔵로그인 화면
    [로그인](./semi/WebContent/resources/ReadMe/정민식/로그인.gif)

  - 🔵아이디 저장
    [아이디 저장](./semi/WebContent/resources/ReadMe/정민식/아이디%20저장.gif)

  - 🔵아이디 찾기
    [아이디 찾기](./semi/WebContent/resources/ReadMe/정민식/아이디%20찾기.gif)

  - 🔵비밀번호 찾기 후 변경
    [비밀번호 찾기 / 변경](./semi/WebContent/resources/ReadMe/정민식/비밀번호%20찾기%20및%20변경.gif)

  - 🔵카카오 로그인
    [카카오 로그인](./semi/WebContent/resources/ReadMe/정민식/카카오%20로그인.gif)

  - 🔵회원가입
    [회원가입](./semi/WebContent/resources/ReadMe/정민식/회원가입.gif)

  - 🔵원데이 클래스 상세 화면
    [원데이클래스 상세](./semi/WebContent/resources/ReadMe/정민식/원데이.gif)

  - 🔵카카오, 네이버 공유하기
    [공유하기](./semi/WebContent/resources/ReadMe/정민식/공유하기.gif)

  - 🔵한줄평 작성
    [한줄평 작성](./semi/WebContent/resources/ReadMe/정민식/한줄평%20작성.gif)

  - 🔵더보기 버튼
    [더보기 버튼](./semi/WebContent/resources/ReadMe/정민식/더보기%20버튼.gif)

  - 🔵식당 상세
    [식당상세](./semi/WebContent/resources/ReadMe/정민식/식당상세.gif)

  - 🔵리뷰 작성
    [리뷰 작성](./semi/WebContent/resources/ReadMe/정민식/리뷰%20작성.gif)

  - 🔵리뷰 수정
    [리뷰 수정](./semi/WebContent/resources/ReadMe/정민식/리뷰%20수정.gif)

  - 🔵리뷰 삭제
    [리뷰 삭제](./semi/WebContent/resources/ReadMe/정민식/리뷰%20삭제.gif)

  - 🔵네이버지도API 및 마커
    [네이버 지도](./semi/WebContent/resources/ReadMe/정민식/지도%20마커.gif)




---

- **🟣조원 : 황영찬**

- - 🟣놀거리 메인페이지
    [playMain](./semi/WebContent/resources/ReadMe/놀거리.gif)

- - 놀거리 상세 페이지

---
