<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 
<link href="../css/style.css" rel="stylesheet">
<link href="../css/responsive/responsive.css" rel="stylesheet">
 -->
<link rel="stylesheet" href="../shadow/css/shadowbox.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript" src="../shadow/js/shadowbox.js"></script>
<script type="text/javascript" src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
Shadowbox.init({
	players:['iframe']
})
$(function(){
	$('#idBtn').on('click',function(){
		Shadowbox.open({
			content:'../member/emailcheck.do',
			player:'iframe',
			width:400,
			height:280,
			title:'이메일중복체크'
		})
	})
	$('#postBtn').click(function(){
		new daum.Postcode({
			oncomplete:function(data)
			{
				$('#post').val(data.zonecode)
				$('#addr1').val(data.address)
			}
		}).open()
	})
	
	$('#joinBtn').click(function(){
		let email=$('#emailck').val()
		if(email.trim()==="")
		{
			alert("이메일 중복체크를 해야 됩니다")
			return
		}
		let pwd1=$('#pwd1').val()
		if(pwd1.trim()==="")
		{
			$('#pwd1').focus()
			return
		}	
        let pwd2=$('#pwd2').val()
		if(pwd1!==pwd2.trim())
		{
			alert("비밀번호가 틀립니다")
			$('#pwd2').val("")
			$('#pwd2').focus()
			return
		}	
        let name=$('#name').val()
        if(name.trim()==="")
        {
            $('#name').focus()
            return
        }  
        let post=$('#post').val()
        if(post.trim()==="")
        {
        	alert("우편번호 검색을 해야 됩니다")
        	return
        }	
        $('#frm').submit()
	})
})
</script>
</head>
<body>

        <!-- Header End -->
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
    <!-- ****** Archive Area Start ****** -->
        <div class="container">
            <div class="row" style="width:100%;">
            <form method=post action="../member/join_ok.do" name="frm" id="frm">
            <table class="table">
                <tr>
                    <th width=15% class="text-center" style="color:gray">이메일</th>
                    <td width=85% style="display: flex; gap: 5px;">
                        <input type=text name="email" id="emailck" size=45 class="input-sm" readonly>
                        <input type=button id="idBtn" value="이메일중복체크" class="btn-sm btn-primary" >
                    </td>
                </tr>
                <tr>
                    <th width=15% class="text-center" style="color:gray">Password</th>
                    <td width=85% style="display: flex; gap: 5px;">
                        <input type=password name="pw" id="pwd1" size=15 class="input-sm"
                        	placeholder="비밀번호 입력" required>
                        <input type=password name="pwd1" id="pwd2" size=15 class="input-sm"
                            placeholder="비밀번호 재입력" required>
                    </td>
                </tr>
                <tr>
                    <th width=15% class="text-center" style="color:gray">이름</th>
                    <td width=85%>
                        <input type=text name="name" id="name" size=15 class="input-sm">
                    </td>
                </tr>            
                <tr>
                    <th width=15% class="text-center" style="color:gray">성별</th>
                    <td width=85% style="display: flex; gap: 5px;">
                        <input type=radio name="sex" value="남자" checked>남자
                        <input type=radio name="sex" value="여자">여자
                    </td>
                </tr>            
                <tr>
                    <th width=15% class="text-center" style="color:gray">생년월일</th>
                    <td width=85%>
                        <input type=date name="birth" size=25 class="input-sm">
                    </td>
                </tr>            
                <tr>
                    <th width=15% class="text-center" style="color:gray">우편번호</th>
                    <td width=85% style="display: flex; gap: 5px;">
                        <input type=text id="post" name="post" size=10 class="input-sm" readonly>
                        <input type=button value="우편번호검색" class="btn-sm btn-danger" id="postBtn">
                    </td>
                </tr>            
                <tr>
                    <th width=15% class="text-center" style="color:gray">주소</th>
                    <td width=85%>
                        <input type=text id="addr1" name="addr1" size=55 class="input-sm" readonly>
                    </td>
                </tr>            
                <tr>
                    <th width=15% class="text-center" style="color:gray">상세주소</th>
                    <td width=85%>
                        <input type=text name="addr2" size=55 class="input-sm">
                    </td>
                </tr>            
                <tr>
                    <th width=15% class="text-center" style="color:gray">전화번호</th>
                    <td width=85% style="display: flex; gap: 5px;">
                        <select name="phone1" class="form-control-sm">
                            <option>010</option>
                        </select>
                        <input type=text name="phone2" size=55 class="input-sm">
                    </td>
                </tr>            
                <tr>
                    <td colspan="2" class="text-center">
                        <input type=button value="회원가입" class="btn-sm btn-success" id="joinBtn">
                        <input type=button value="취소" class="btn-sm btn-info"
                            onclick="javascript:history.back()">
                    </td>
                </tr> 
                           
            </table>
            </form>
            </div>
        </div>
</body>
</html>