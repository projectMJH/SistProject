<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">
<title>Insert title here</title>
<link rel="stylesheet" href="../shadow/css/shadowbox.css">

<!-- Favicon -->
<link href="../img/favicon.ico" rel="icon">

<!-- Google Web Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600&family=Inter:wght@700;800&display=swap" rel="stylesheet">

<!-- Icon Font Stylesheet -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

<!-- Libraries Stylesheet -->
<link href="../lib/animate/animate.min.css" rel="stylesheet">
<link href="../lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

<!-- Customized Bootstrap Stylesheet -->
<link href="../tcss/bootstrap.min.css" rel="stylesheet">

<!-- Template Stylesheet -->
<link href="../tcss/style.css" rel="stylesheet">

<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript" src="../shadow/js/shadowbox.js"></script>
<script type="text/javascript">
Shadowbox.init({
    players:['iframe']
})
function login(){
    Shadowbox.open({
        content:'../member/login.do',
        player:'iframe',
        width:380,
        height:290,
        title:'로그인'
    })	
}
$(function(){
	//document.getElementById('login').addEventListener("click", function() {
	$('#msgbar').text("");
	$('#login').on("click", function() { 	
 		//let id=document.getElementById('id').value.trim();
		//let pwd=document.getElementById('pwd').value.trim();
 		let email=$('#email').val().trim();
		let pw=$('#pw').val().trim();
		if(email!=="") 
		{
			if(pw==="")
			{
				$('#msgbar').text("비밀번호를 입력하세요");
				//document.getElementById('pw').focus()
				$('#pw').focus()
				return
			}
			
	        $.ajax({
	        	type:'post',
	        	url:'../member/login_ok.do',
	        	data:{"email":email,"pw":pw},
	        	success:function(result){
	        		// NOID, NOPWD, OK
	        		if(result==='NOID')
	        		{
	        			$('#msgbar').text("아이디가 존재하지 않습니다")
	        			$('#email').val("")
	        			$('#pw').val("")
	        			$('#email').focus()
	        		}	
	        		else if(result==='NOPWD')
	        		{
	        			$('#msgbar').text("비밀번호가 틀립니다")
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
		}
	})
/* 	$('#logout').click(function(){
		location.href="../member/logout.do"
	})
	$('#signup').click(function(){
		location.href="../member/join.do"
	})
 */
})
</script>
<body>
    <div class="container-xxl bg-white p-0">
        <!-- Spinner Start -->
        <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
            <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
                <span class="sr-only">Loading...</span>
            </div>
        </div>
        <!-- Spinner End -->
		
		<jsp:include page="../main/header.jsp"/>
		
        <jsp:include page="${main_jsp }"/>
        
        <jsp:include page="../main/footer.jsp"/>
    </div>

    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="../lib/wow/wow.min.js"></script>
    <script src="../lib/easing/easing.min.js"></script>
    <script src="../lib/waypoints/waypoints.min.js"></script>
    <script src="../lib/owlcarousel/owl.carousel.min.js"></script>

    <!-- Template Javascript -->
    <script src="../js/main.js"></script>
</body>
</html>