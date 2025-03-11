<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link href="../layout/styles/layout.css" rel="stylesheet" type="text/css" media="all">
<link rel="stylesheet" href="../shadow/css/shadowbox.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript" src="../shadow/js/shadowbox.js"></script>
<script type="text/javascript">
Shadowbox.init({
    players:['iframe']
})
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
	      /*   
	        $('#msgbar').text('email: '+email+',  password: '+pw)
			sessionStorage.setItem("email",email)
			if(id==='148cl0ud@gmail.com')
			{
				sessionStorage.setItem("admin",'y')
			}	
	        */ 
		}
	})
	$('#logout').click(function(){
		location.href="../member/logout.do"
	})
	$('#signup').click(function(){
		location.href="../member/join.do"
	})

})
</script>
</head>
<body>
	<div class="wrapper row0">
	  <div id="topbar" class="hoc clear"> 
	    <div class="fl_left">
	      <ul class="nospace">
	        <li><i class="fas fa-mobile-alt rgtspace-5"></i> +00 (123) 456 7890</li>
	        <li><i class="far fa-envelope rgtspace-5"></i> info@domain.com</li>
	      </ul>
	    </div>
	    <div style="display: flex; flex-direction: column; align-items: flex-end;">
	    	<c:if test="${sessionScope.id==null }">
	    	<div style="display: flex; align-items: center; gap: 5px;">
			<input type="text" id="email" placeholder="이메일 입력" size=25 style="color:black;">
			<input type="password" id="pw" placeholder="비밀번호 입력" size=12 style="color:black;">
			<input type="button" value="로그인" id="login" class="btn-sm btn-success">
			<input type="button" value="회원가입" id="signup" class="btn-sm btn-primary">
			</div>
			<div id="msgbar" style="color: red; font-size: 14px; text-align: left; width: 500px;"></div>
			</c:if>
	    	<c:if test="${sessionScope.id!=null }">
			<div style="display: flex; align-items: center; gap: 5px;">
	    	${sessionScope.name }${sessionScope.isadmin==1?"(관리자)":"" } 님이 로그인 되었습니다.&nbsp;&nbsp;
			<input type="button" value="로그아웃" id="logout" class="btn-sm btn-success">
			</c:if>
			</div>
<!-- 
	      <ul class="nospace">
	        <li><a href="#"><i class="fas fa-home"></i></a></li>
	        <li><a href="#" title="Help Centre"><i class="far fa-life-ring"></i></a></li>
	        <li><a href="#" title="Login"><i class="fas fa-sign-in-alt"></i></a></li>
	        <li><a href="#" title="Sign Up"><i class="fas fa-edit"></i></a></li>
	        <li id="searchform">
	          <div>
	            <form action="#" method="post">
	              <fieldset>
	                <legend>Quick Search:</legend>
	                <input type="text" placeholder="Enter search term&hellip;">
	                <button type="submit"><i class="fas fa-search"></i></button>
	              </fieldset>
	            </form>
	          </div>
	        </li>
	      </ul>
 -->
	    </div>
	  </div>
	</div>
		
	<jsp:include page="../main/header.jsp"></jsp:include>

	<jsp:include page="${main_jsp }"></jsp:include>
	
	<jsp:include page="../main/footer.jsp"></jsp:include>
	
	<!-- JAVASCRIPTS -->
	<script src="../layout/scripts/jquery.min.js"></script>
	<script src="../layout/scripts/jquery.backtotop.js"></script>
	<script src="../layout/scripts/jquery.mobilemenu.js"></script>
</body>
</html>