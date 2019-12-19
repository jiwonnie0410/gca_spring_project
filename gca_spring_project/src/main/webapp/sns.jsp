<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!--이모티콘  -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
		<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<!-- 카카오톡 -->
<script type="text/JavaScript" src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript">
	// 카카오톡 공유하기
	function shareKakaotalk() {
        Kakao.init("ce5d5303904f527a3231bf1760ccfc03");      // 사용할 앱의 JavaScript 키를 설정
        Kakao.Link.sendDefault({
              objectType:"feed"
            , content : {
                  title:"gca"   // 콘텐츠의 타이틀
                , description:"동네 친구와 운동을....--설명 추가하기"   // 콘텐츠 상세설명
                , imageUrl:"${pageContext.request.contextPath }/images/bok/sns_logo.png"   // 썸네일 이미지
                , link : {
                      mobileWebUrl:"http://39.116.34.40/gca/"   // 모바일 카카오톡에서 사용하는 웹 링크 URL
                    , webUrl:"http://39.116.34.40/gca/" // PC버전 카카오톡에서 사용하는 웹 링크 URL
                }
            }
            , social : {
                  likeCount:0       // LIKE 개수
                , commentCount:0    // 댓글 개수
                , sharedCount:0     // 공유 회수
            }
            , buttons : [
                {
                      title:"게시글 확인"    // 버튼 제목
                    , link : {
                        mobileWebUrl:"http://39.116.34.40/gca/"   // 모바일 카카오톡에서 사용하는 웹 링크 URL
                      , webUrl:"http://39.116.34.40/gca/" // PC버전 카카오톡에서 사용하는 웹 링크 URL
                    }
                }
            ]
        });
    }
	

	
	/* function sendKakaoTalk() {
		Kakao.init('745baffb91878f4a9b947f9134484a4d');
		Kakao.Link.sendTalkLink({
			label : 'gca 제목',
			image : {
				src : '${pageContext.request.contextPath }/images/bok/sns_logo.png"  , // 썸네일 이미지,
				width : '300',
				height : '200'
			},
			webButton : {
				text : 'gca 제목',
				url : 'http://localhost/gca' // 앱 설정의 웹 플랫폼에 등록한 도메인의 URL
			}
		});
	}


	// send to SNS
	function toSNS(sns, strTitle, strURL) {
		var snsArray = new Array();
		var strMsg = strTitle + " " + strURL;
		var image = "${pageContext.request.contextPath }/images/bok/sns_logo.png";  // 썸네일 이미지

		snsArray['twitter'] = "http://twitter.com/home?status="+ encodeURIComponent(strTitle) + ' '
				+ encodeURIComponent(strURL);
		snsArray['facebook'] = "http://www.facebook.com/share.php?u=" + encodeURIComponent(strURL);
		snsArray['band'] = "http://band.us/plugin/share?body="
				+ encodeURIComponent(strTitle) + "  "
				+ encodeURIComponent(strURL) + "&route="
				+ encodeURIComponent(strURL);
		snsArray['line'] = "http://line.me/R/msg/text/?"
				+ encodeURIComponent(strTitle) + " "
				+ encodeURIComponent(strURL);
		snsArray['google'] = "https://plus.google.com/share?url="
				+ encodeURIComponent(strURL) + "&t="
				+ encodeURIComponent(strTitle);
		window.open(snsArray[sns]);
	}

	
	/*원하는 sns가 없을 경우 url 복사하여 공유  */
	function copy_clip(url) {
		var IE = (document.all) ? true : false;
		if (IE) {
			window.clipboardData.setData("Text", url);
			alert("이 글의 단축url이 클립보드에 복사되었습니다.");
		} else {
			temp = prompt("이 글의 단축url입니다. Ctrl+C를 눌러 클립보드로 복사하세요", url);/*기본으로 로그인 화면 연결  */
		}
	}
</script>
</head>
<body style="overflow: hidden; background-color: #f0f0f0;">
	<div class="sns_wrap">
	<!-- 이모티콘 -->
		<p>SNS 공유하기</p>
				<a class="ftco-animate" href="javascript:toSNS('facebook','gca제목!','http://39.116.34.40/gca')" title="페이스북으로 가져가기">
				<i class="fab fa-facebook"></i></a></li>
				
				<a class="ftco-animate"href="javascript:toSNS('twitter','gca','http://39.116.34.40/gca')"title="트위터로 가져가기">
				<i class="fab fa-twitter-square"></i></a></li>
				
				<a class="ftco-animate" href="javascript:toSNS('line','gca','http://39.116.34.40/gca')" title="라인으로 가져가기">
				<i class="fab fa-line"></i></a></li>
				
				<a class="ftco-animate" href="javascript:shareKakaotalk();"title="카카오톡으로 가져가기">
				<i class="fab fa-korvue"></i></a>
		<ul>
			<li><input type="text" value="http://39.116.34.40/gca">
				<a href="javascript:copy_clip('http://39.116.34.40/gca')">
				<i class="fas fa-reply" aria-hidden="true"></i></a>
			</li>
		</ul>
	</div>
</body>
</html>