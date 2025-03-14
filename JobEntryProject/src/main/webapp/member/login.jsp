<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>사람인 로그인</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">

<!-- Bootstrap CSS
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function(){
	$('.login').click(function(){
        let activeTab=$('#loginTabs .nav-link.active').attr('data-bs-target'); // 현재 활성화된 탭
        let email=$(activeTab).find('input[name="email"]').val(); // 이메일
		if(email.trim()==="")
		{
			$('#msg').html("&nbsp;<i class='bi bi-exclamation-triangle'></i>&nbsp;이메일을 입력하세요")
			$('#email').focus()
			return
		}	
		
        let pw = $(activeTab).find('input[name="pw"]').val(); // 비밀번호
	    if(pw.trim()==="")
	    {
			$('#msg').html("&nbsp;<i class='bi bi-exclamation-triangle'></i>&nbsp;비밀번호를 입력하세요")
	        $('#pw').focus()
	        return
	    }   
	    
		let url = (activeTab === '#personalTab') ? '../personal/login_ok.do' : '../official/login_ok.do';
		$.ajax({
	    	type:'post',
	    	url:url,
	    	data:{"email":email,"pw":pw},
	    	success:function(result){
	    		// NOID, NOPWD, OK
	    		if(result==='NOID')
	    		{
	    			$('#msg').html("&nbsp;<i class='bi bi-exclamation-triangle'></i>&nbsp;아이디가 존재하지 않습니다")
	    			$('#email').val("")
	    			$('#pw').val("")
	    			$('#email').focus()
	    		}	
	    		else if(result==='NOPWD')
	    		{
	    			$('#msg').html("&nbsp;<i class='bi bi-exclamation-triangle'></i>&nbsp;비밀번호가 틀립니다")
	                $('#pw').val("")
	                $('#pw').focus()
	    		}	
	    		else
	    		{
	                parent.location.href="../main/main.do"
	    			parent.Shadowbox.close()
	    		}	
	    	}
	    })
	})
	// Bootstrap 탭 전환 이벤트 감지
    $(document).on('shown.bs.tab','#loginTabs',function () {
        // 모든 비밀번호 필드를 초기화
        $('.password').each(function () {
            $(this).val(''); // 비밀번호 필드 초기화
            $(this).attr('type', 'password'); // 타입을 "password"로 설정
        });

        // 아이콘 초기화 (눈 모양 아이콘을 "fa-eye-slash"로 설정)
        $('.togglePassword i').removeClass('fa-eye').addClass('fa-eye-slash');
    });
    // 비밀번호 보이기/숨기기
    $(document).on('click','.togglePassword',function() {
        let input = $(this).closest(".input-group").find(".password");
        let type = input.attr("type") === "password" ? "text" : "password";
        input.attr("type", type);
        $(this).find("i").toggleClass("fa-eye fa-eye-slash");
    });		
})
</script>    
</head>
<body>

              <div style="margin: 5px;">
                <!-- 탭 메뉴 -->
                <ul class="nav nav-tabs" id="loginTabs">
                    <li class="nav-item">
                        <button class="nav-link active" data-bs-toggle="tab" data-bs-target="#personalTab">개인회원</button>
                    </li>
                    <li class="nav-item">
                        <button class="nav-link" data-bs-toggle="tab" data-bs-target="#companyTab">기업회원</button>
                    </li>
                </ul>

                <!-- 로그인 폼 -->
                <div class="tab-content mt-3">
                    <!-- 개인회원 -->
                    <div class="tab-pane fade show active" id="personalTab"	>
                            <input type="hidden" name="userType" value="personal">
                            <div class="mb-3">
                                <input type="text" name="email" class="form-control" placeholder="이메일을 입력하세요...">
                            </div>
                            <div class="mb-3 input-group">
                                <input type="password" name="pw" class="form-control password" placeholder="비밀번호를 입력하세요...">
                                <button class="btn btn-outline-secondary togglePassword" type="button">
                                    <i class="fas fa-eye-slash"></i>
                                </button>
                            </div>
                            <button type="button" class="login btn btn-primary w-100">로그인</button>
                    </div>

                    <!-- 기업회원 -->
                    <div class="tab-pane fade" id="companyTab">
                            <input type="hidden" name="userType" value="company">
                            <div class="mb-3">
                                <input type="text" name="email" class="form-control" placeholder="이메일을 입력하세요...">
                            </div>
                            <div class="mb-3 input-group">
                                <input type="password" name="pw" class="form-control password" placeholder="비밀번호를 입력하세요...">
                                <button class="btn btn-outline-secondary togglePassword" type="button">
                                    <i class="fas fa-eye-slash"></i>
                                </button>
                            </div>
                            <button type="button" class="login btn btn-primary w-100">로그인</button>
                    </div>
                </div>
 	            <div id="msg" style="color:red"></div>
 	          </div>  
</body>
</html>
