<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/bootstrap/bootstrap.min.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('#logBtn').click(function(){
		let email=$('#email').val()
		if(email.trim()==="")
		{
			$('#msg').text("이메일을 입력하세요")
			$('#email').focus()
			return
		}	
		
        let pw=$('#pw').val()
        if(pw.trim()==="")
        {
			$('#msg').text("비밀번호를 입력하세요")
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
        			$('#msg').text("아이디가 존재하지 않습니다")
        			$('#email').val("")
        			$('#pw').val("")
        			$('#email').focus()
        		}	
        		else if(result==='NOPWD')
        		{
        			$('#msg').text("비밀번호가 틀립니다")
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
	$('#canBtn').click(function(){
		parent.Shadowbox.close()
	})
})
</script>
</head>
<body>
    <div class="container" style="margin-top: 50px;">
        <div class="row" style="width: 340px">
            <table class="table">
                <tr>
                    <th width=20%>Email</th>
                    <td width=80%>
                        <input type=text name="email" id="email" size=30 class="form-control-sm"
                        	placeholder="이메일 입력">
                    </td>
                </tr>
                <tr>
                    <th width=15% class="text-center" style="color:gray">Password</th>
                    <td width=85%>
                        <input type=password name="pw" id="pw" size=15 class="form-control-sm"
                        	placeholder="비밀번호 입력">
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="text-center">
                        <input type=button id="logBtn" class="btn-sm btn-success" value="로그인">
                        <input type=button id="canBtn" class="btn-sm btn-info" value="취소">
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <span id="msg" style="color:red"></span>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</body>
</html>