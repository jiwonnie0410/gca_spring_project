<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>:: 카카오톡 공유하기 ::</title>
<script type="text/JavaScript" src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript">
    function shareKakaotalk() {
        Kakao.init("ce5d5303904f527a3231bf1760ccfc03");      // 사용할 앱의 JavaScript 키를 설정
        Kakao.Link.sendDefault({
              objectType:"feed"
            , content : {
                  title:"gca"   // 콘텐츠의 타이틀
                , description:"gca 상세설명"   // 콘텐츠 상세설명
                , imageUrl:"${pageContext.request.contextPath }/images/mihy/badminton-black.png"   // 썸네일 이미지
                , link : {
                      mobileWebUrl:"http://magic.wickedmiso.com/"   // 모바일 카카오톡에서 사용하는 웹 링크 URL
                    , webUrl:"http://magic.wickedmiso.com/" // PC버전 카카오톡에서 사용하는 웹 링크 URL
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
                        mobileWebUrl:"http://magic.wickedmiso.com/"   // 모바일 카카오톡에서 사용하는 웹 링크 URL
                      , webUrl:"http://magic.wickedmiso.com/" // PC버전 카카오톡에서 사용하는 웹 링크 URL
                    }
                }
            ]
        });
    }
</script>
</head>
<body>
    <h1>카카오톡 공유하기</h1>
    <input type="button" onClick="shareKakaotalk();" value="KAKOA Talk으로 공유하기"/>
</body>
</html>