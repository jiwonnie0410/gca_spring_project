<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
<link href="https://fonts.googleapis.com/css?family=Nunito+Sans:200,300,400,600,700,800,900" rel="stylesheet">

<link rel="stylesheet" href="${pageContext.request.contextPath }/css/open-iconic-bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/animate.css">

<link rel="stylesheet" href="${pageContext.request.contextPath }/css/owl.theme.default.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/magnific-popup.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/aos.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/ionicons.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/icomoon.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/style.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
<script type="text/javascript">
// 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('앱키');
 
    // 카카오톡 공유하기
    function sendKakaoTalk()
    {
    Kakao.Link.sendTalkLink({
      label: '공유 제목',
      image: {
        src: 'http://이미지경로',
        width: '300',
        height: '200'
      },
      webButton: {
        text: '공유제목',
        url: 'https://도메인' // 앱 설정의 웹 플랫폼에 등록한 도메인의 URL이어야 합니다.
      }
    });
    }
 
    // 카카오스토리 공유하기
      function shareStory() {
        Kakao.Story.share({
          url: '도메인',
          text: '공유제목'
        });
      }
 
  
 
    // send to SNS
    function toSNS(sns, strTitle, strURL) {
        var snsArray = new Array();
        var strMsg = strTitle + " " + strURL;
var image = "이미지경로";
 
        snsArray['twitter'] = "http://twitter.com/home?status=" + encodeURIComponent(strTitle) + ' ' + encodeURIComponent(strURL);
        snsArray['facebook'] = "http://www.facebook.com/share.php?u=" + encodeURIComponent(strURL);
snsArray['pinterest'] = "http://www.pinterest.com/pin/create/button/?url=" + encodeURIComponent(strURL) + "&media=" + image + "&description=" + encodeURIComponent(strTitle);
snsArray['band'] = "http://band.us/plugin/share?body=" + encodeURIComponent(strTitle) + "  " + encodeURIComponent(strURL) + "&route=" + encodeURIComponent(strURL);
        snsArray['blog'] = "http://blog.naver.com/openapi/share?url=" + encodeURIComponent(strURL) + "&title=" + encodeURIComponent(strTitle);
        snsArray['line'] = "http://line.me/R/msg/text/?" + encodeURIComponent(strTitle) + " " + encodeURIComponent(strURL);
snsArray['pholar'] = "http://www.pholar.co/spi/rephol?url=" + encodeURIComponent(strURL) + "&title=" + encodeURIComponent(strTitle);
snsArray['google'] = "https://plus.google.com/share?url=" + encodeURIComponent(strURL) + "&t=" + encodeURIComponent(strTitle);
        window.open(snsArray[sns]);
    }
 
    function copy_clip(url) {
        var IE = (document.all) ? true : false;
        if (IE) {
            window.clipboardData.setData("Text", url);
            alert("이 글의 단축url이 클립보드에 복사되었습니다.");
        } else {
            temp = prompt("이 글의 단축url입니다. Ctrl+C를 눌러 클립보드로 복사하세요", url);
        }
    }
</script>
</head>
<body style="overflow:hidden;background-color:#f0f0f0;">
<div class="sns_wrap">
<p>SNS 공유하기</p>
<ul class="ftco-social text-center">
<li><a class="ftco-animate" href="javascript:toSNS('facebook','공유제목!','http://http://단축URL')" title="페이스북으로 가져가기"><span class="icon-facebook"></span></a></li>
<li><a class="ftco-animate" href="javascript:toSNS('twitter','공유제목!','http://http://단축URL')" title="트위터로 가져가기"><span class="icon-twitter"></span></a></li>
<li><a class="ftco-animate" href="javascript:toSNS('line','공유제목!','http://http://단축URL')" title="라인으로 가져가기"><i class="fab fa-line"></i></a></li>
<li><a class="ftco-animate" href="javascript:sendKakaoTalk();" title="카카오톡으로 가져가기"><i class="fab fa-kickstarter"></i></a></li>
<li><a href="javascript:toSNS('google','공유제목!','http://http://단축URL')" title="구글플러스로 가져가기"></a></li>
</ul>
<ul>
<li><input type="text" value="http://도메인"><a href="javascript:copy_clip('http://도메인')"><i class="fas fa-reply"></i></a></li>
</ul>
</div>
</body>
<script src="${pageContext.request.contextPath }/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/js/jquery-migrate-3.0.1.min.js"></script>
<script src="${pageContext.request.contextPath }/js/popper.min.js"></script>
<script src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath }/js/jquery.easing.1.3.js"></script>
<script src="${pageContext.request.contextPath }/js/jquery.waypoints.min.js"></script>
<script src="${pageContext.request.contextPath }/js/jquery.stellar.min.js"></script>
<script src="${pageContext.request.contextPath }/js/owl.carousel.min.js"></script>
<script src="${pageContext.request.contextPath }/js/jquery.magnific-popup.min.js"></script>
<script src="${pageContext.request.contextPath }/js/aos.js"></script>
<script src="${pageContext.request.contextPath }/js/jquery.animateNumber.min.js"></script>
<script src="${pageContext.request.contextPath }/js/scrollax.min.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
<script src="${pageContext.request.contextPath }/js/google-map.js"></script>
<script src="${pageContext.request.contextPath }/js/main.js"></script>
 <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.js"></script>
</html>