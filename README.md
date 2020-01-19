# 운동하자!
<div>
<img width="80%" src="https://user-images.githubusercontent.com/53467957/72684996-e1212d80-3b28-11ea-951e-22fc55f066b9.jpg">
</div>

### [운동하자! 프로젝트 프레젠테이션 링크](https://docs.google.com/presentation/d/1wPR49DZsjyABSsNXX6CgvJAKD5Y-J1yEbhUZS3tzRWQ/edit?usp=sharing)

#### GCA (Girls Can do Anything)   
#### 박지원, 복진영, 이수림, 전은영, 최미현

### 1. 개발 개요 및 동기
　운동은 건강한 삶을 영위하기 위해 꼭 필요한 행위이지만 현대인에게 <b>운동 부족</b>은 하나의 고질병으로 자리 잡고 있어 비만, 허리디스크 등 운동 부족으로 인한 다양한 질병에 노출되고 있다. 이는 개발 팀원들을 비롯하여 6개월 간 아침부터 저녁까지 앉아서 수업을 듣는 같은 학원의 학생들에게도 적용되는 이야기이다.    
　매일 앉아만 있다 보니 몸이 뻐근해지고 때때로 통증이 생기기도 한다. 거북목처럼 자세도 나빠질 수 있어 운동의 필요성을 절실히 느끼지만, 혼자서 하는 운동은 나태해지기 쉽고 꾸준하기 어렵다. 또 혼자 할 수 있는 운동에는 한계가 있고 매일 걷기, 달리기 등 단순한 운동만 하다 보면 금방 지루해질 수 있다. 친구와 함께 운동하려고 해도 시간이 맞지 않거나, 혼자 있는데 갑자기 배드민턴이 하고 싶어질 때도 있다.     
　이러한 <b>불편함</b>을 해소하기위해 <u>시간과 조건이 맞는 사람들끼리 모여 운동할 수 있도록</u> 매칭 서비스를 제공하는 웹 애플리케이션을 개발하게 되었고, 기존에 있던 서비스들의 단점을 보완하여 더욱 특색 있는 서비스를 만들고자 노력하였다.
 
 ### 2. 벤치마킹
　1인 가구의 증가로 온라인 만남 매칭 서비스도 성장세를 보이고 있다. 해당 서비스를 제공하는 애플리케이션 중 운동과 관련이 있거나 선호도가 높은곳으로 ‘챌린저스’, ‘스포츠유어스’, ‘틴더’, ‘소모임’을 선정하여 벤치마킹하였다.    
　<b>반짝/동아리매치/용병</b> 파트는 ‘스포츠유어스’를 벤치마킹하였다. ‘스포츠유어스’는 체계적인 종목 분류, 위치기반에 따른 인증 시스템을 제공하는데 본 애플리케이션도 이러한 기능을 구현하여 사용자가 원하는 모임을 간편하게 찾고, 모임의 참여 여부를 체크하여 실제 모임에 참가한 사용자에게 점수를 제공한다.    
　<b>챌린지</b> 기능은 ‘챌린저스’를 벤치마킹하여 구현하였고, 사용자가 참가한 챌린지의 성공 여부에 따라 점수를 제공하고 랭킹에 반영한다. 스페셜 챌린지의 경우 보증금 결제 기능과 성공 시 더 높은 점수를 제공하여 수익성과 사용자의 참여도를 높이도록 하였다.
<b>유저 인터페이스</b>는 ‘틴더’와 ‘소모임’의 카드형 UI와 직관적인 인터페이스를 벤치마킹하여, 사용자가 이용하기 편리하고 친숙하게 느끼도록 구현하였다.

### 3. 개발환경
본 프로젝트는 스프링 프레임워크를 기반으로 개발하였다. 이에 MVC 패턴을 적용해 모델-화면-컨트롤러를 분리함으로써 코드의 표준화를 도모하였으며 개발시간을 단축하고 유지보수성을 높였다.

#### 개발언어
BootStrap4, HTML5, Java, JavaScript, jQuery, Ajax, CSS, Srping Framework    
#### 데이터베이스
Oracle Database Express Edition 11g Release 2   
#### IDE
Eclipse, SQL Developer   
#### 빌드배포
Maven, Jenkins   
#### 테스트 툴
JUnit, PMD, JMeter   
#### 형상관리
GitHub   

#### 사용 API
- Spring Security (https://docs.spring.io/spring-security/site/docs/4.2.12.RELEASE/apidocs/)
- Tiles (https://mvnrepository.com/artifact/org.apache.tiles/tiles-api)
- Google Chart (https://developers.google.com/chart/?hl=ko)
- 부트페이 (https://www.bootpay.co.kr/)
- 카카오페이 (https://developers.kakao.com/docs/restapi/kakaopay-api)
- 네이버 아이디로 로그인 (https://developers.naver.com/docs/login/overview/)
- 다음 주소 (http://postcode.map.daum.net/guide)
- 다음 지도 (http://apis.map.kakao.com/)
- Facebook 공유 (https://developers.facebook.com/docs?locale=ko_KR)
- 카카오톡 공유 (https://developers.kakao.com/docs/restapi/kakaopay-api)
- FullCalendar (https://fullcalendar.io/)

### 4. 주요기능

<img width="80%" src="https://user-images.githubusercontent.com/53467957/72685128-5ccfaa00-3b2a-11ea-9e0c-862ce05f2ea0.jpg">





### 반짝모임
<div>
<img width="80%" src="https://user-images.githubusercontent.com/53467957/72685129-5d684080-3b2a-11ea-8ce3-ac4dff56128f.jpg">
</div>




### 웹소켓 채팅/참가자 신고&강퇴
<div>
<img width="80%" src="https://user-images.githubusercontent.com/53467957/72685130-5d684080-3b2a-11ea-9eda-32f36a2763b4.jpg">
</div>



#### 챌린지

<img width="80%" src="https://user-images.githubusercontent.com/53467957/72685180-cc459980-3b2a-11ea-93e8-fd4dcf708f8b.jpg">




#### 홍보게시판 & 문의게시판

<img width="80%" src="https://user-images.githubusercontent.com/53467957/72685181-cc459980-3b2a-11ea-9425-3fb1f2978319.jpg">

#### 랭킹 & 사용자 히스토리

<img width="80%" src="https://user-images.githubusercontent.com/53467957/72685131-5d684080-3b2a-11ea-8daf-3d25a58bfb63.jpg">

#### 관리자페이지
