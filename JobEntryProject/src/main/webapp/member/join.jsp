<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link href="../shadow/css/shadowbox.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript" src="../shadow/js/shadowbox.js"></script>
<script type="text/javascript" src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
let activeTab=''
Shadowbox.init({
	players:['iframe']
})
function getMemberStr(){
	activeTab=$('#loginTabs .nav-link.active').attr('data-bs-target'); // 현재 활성화된 탭
	return activeTab.substr(1)
}
$(function(){
    Shadowbox.init()
	$('.idBtn').on('click',function(){
		Shadowbox.open({
			content:'../personal/emailcheck.do',
			player:'iframe',
			width:400,
			height:280,
			title:'이메일중복체크'
		})
	})
	// Bootstrap 탭 전환 이벤트 감지
    $(document).on('shown.bs.tab','#loginTabs',function () {
        // 모든 비밀번호 필드를 초기화
        $('.password').each(function () {
            $(this).val(''); // 비밀번호 필드 초기화
            $(this).attr('type', 'password'); // 타입을 "password"로 설정
        });

        // 아이콘 초기화 (눈 모양 아이콘을 "fa-eye"로 설정)
        $('.togglePassword i').removeClass('fa-eye').addClass('fa-eye-slash');
    });
    // 비밀번호 보이기/숨기기
    $(document).on('click','.togglePassword',function() {
        $('.password').each(function () {
            let input = $(this);
            
            // 현재 타입을 확인하여 password <-> text로 변경
            let type = input.attr("type") === "password" ? "text" : "password";
            input.attr("type", type);
        });
        $(this).find("i").toggleClass("fa-eye fa-eye-slash");
    });		
})
</script>
</head>
<body>
	<!-- Header Start -->
	<div class="container-xxl py-5 bg-dark page-header mb-5">
	    <div class="container my-5 pt-5 pb-4">
	        <h1 class="display-3 text-white mb-3 animated slideInDown">회원가입</h1>
	        <nav aria-label="breadcrumb">
	            <ol class="breadcrumb text-uppercase">
	                <li class="breadcrumb-item"><a href="#">Home</a></li>
	                <li class="breadcrumb-item text-white active" aria-current="page">회원가입</li>
	            </ol>
	        </nav>
	    </div>
	</div>
	<!-- Header End -->
        
	<div style="margin: 100px;">
	  <!-- 탭 메뉴 -->
	
	  <ul class="nav nav-tabs" id="loginTabs">
	      <li class="nav-item">
	          <button class="nav-link active" data-bs-toggle="tab" data-bs-target="#personal">개인회원</button>
	      </li>
	      <li class="nav-item">
	          <button class="nav-link" data-bs-toggle="tab" data-bs-target="#official">기업회원</button>
	      </li>
	  </ul>
	
	  <!-- 로그인 폼 -->
	  <div class="tab-content mt-3" style="width: 800px">
	    <!-- 개인회원 -->
	    <div class="tab-pane fade show active" id="personal">
		  <jsp:include page="../member/join_personal.jsp"/>
	    </div>
	      
		  <!-- 기업회원 -->
	    <div class="tab-pane fade" id="official">
		  <jsp:include page="../member/join_official.jsp"/>
	    </div>
	  </div>
	</div>

</body>
</html>