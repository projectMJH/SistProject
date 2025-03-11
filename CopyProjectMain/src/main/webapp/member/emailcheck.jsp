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
    	$('#checkBtn').click(function(){
    		let email=$('#email').val()
    		if(email.trim()==="")
  			{
  			   $('#email').focus()
  			   return
  			}
    		$.ajax({
    			type:'post',
    			url:'../member/emailcheck_ok.do',
    			data:{"email":email.trim()},
    			success:function(result)
    			{
    				//alert(result);
    				let count=parseInt(result);
    				if(count===0)
    				{
    					$('#oktr').show()
    					$('#res').html(
    					  '<span style="color:blue">'	
    					  +email+'는(은) 사용가능한 아이디입니다</span>'
    					)
    					$('#email').prop('disabled',true)
    				}	
    				else
    				{
                        $('#oktr').show()
                        $('#res').html(
                          '<span style="color:blue">'   
                          +email+'는(은) 이미 사용중인 아이디입니다</span>'
                        )
                        $('#email').val("")
                        $('#email').focus()
    				}	
    				
    			}
    		})
    	})
    	$('#ok').click(function(){
    		parent.frm.email.value=$('#email').val()
    		parent.Shadowbox.close()
    	})
    })
</script>
</head>
<body>
  <div class="container" style="margin-top: 50px">
    <div class="row" style="width: 350px;">
        <table class="table">
            <tr>
                <td>EMAIL:<input type=text id="email" size=15 class="form-control-sm">
                       <input type=button value="이메일중복체크"
                       class="btn-sm btn-primary" id="checkBtn">
                </td>
            </tr>
            <tr>
                <td class="text-center" id="res">

                </td>
            </tr>
            <tr style="display:none" id="oktr">
                <td class="text-center">
                    <input type=button value="확인" class="btn-sm btn-success" id="ok">
                </td>
            </tr>
        </table>
    </div>  
  </div>
</body>
</html>