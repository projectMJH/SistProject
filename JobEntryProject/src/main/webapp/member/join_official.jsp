<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(function(){
	$('#jBtn_co').click(function(){
		let email=$('#email_co').val()
		if(email.trim()==="")
		{
			alert("기업 이메일 중복체크를 하세요")
			return
		}
		let pwd1=$('#pwd1_co').val()
		if(pwd1.trim()==="")
		{
			alert("기업 입력한 비밀번호를 입력하세요 ")
			$('#pwd1').focus()
			return
		}	
        let pwd2=$('#pwd2_co').val()
		if(pwd1!==pwd2.trim())
		{
			alert("기업 입력한 비밀번호가 서로 다릅니다")
			$('#pwd2_co').val("")
			$('#pwd2_co').focus()
			return
		}	
        let name=$('#name_co').val()
        if(name.trim()==="")
        {
        	alert("기업 이름을 입력하세요")
            $('#name_co').focus()
            return
        }  
        let cname=$('#cname').val()
        if(cname.trim()==="")
        {
        	alert("회사명을 입력하세요")
           $('#cname').focus()
            return
        }  

        $('#frm_co').submit()
	})
})
</script>
</head>
<body>
      <div class="card p-4">
        <form method="post" action="../official/join_ok.do" name="frm" id="frm_co">
          <!-- 이메일 -->
          <div class="mb-3 row">
            <label class="col-sm-2 col-form-label text-end">이메일</label>
            <div class="col-sm-10">
              <div class="input-group">
                <input type="text" name="email" id="email_co" class="form-control" readonly>
                <button type="button" class="btn btn-outline-primary idBtn">이메일 중복 체크</button>
              </div>
            </div>
          </div>

          <!-- 비밀번호 -->
          <div class="mb-3 row">
            <label class="col-sm-2 col-form-label text-end">비밀번호</label>
            <div class="col-sm-4">
              <input type="password" name="pw" id="pwd1_co" class="form-control password" placeholder="비밀번호 입력" required>
            </div>
            <div class="col-sm-4">
              <input type="password" name="pwd1" id="pwd2_co" class="form-control password" placeholder="비밀번호 재입력" required>
            </div>
		    <div class="col-sm-2">
		        <button class="btn btn-outline-secondary togglePassword" type="button">
		            <i class="fas fa-eye-slash"></i>
		        </button>
		    </div>
          </div>

          <!-- 이름 -->
          <div class="mb-3 row">
            <label class="col-sm-2 col-form-label text-end">이름</label>
            <div class="col-sm-10">
              <input type="text" name="name" id="name_co" class="form-control" required>
            </div>
          </div>

          <!-- 전화번호 -->
          <div class="mb-3 row">
            <label class="col-sm-2 col-form-label text-end">전화번호</label>
            <div class="col-sm-4">
              <select name="phone1" class="form-select" required>
                <option>010</option>
              </select>
            </div>
            <div class="col-sm-6">
              <input type="text" name="phone2" class="form-control" required>
            </div>
          </div>

          <!-- 기업명 -->
          <div class="mb-3 row">
            <label class="col-sm-2 col-form-label text-end">기업명</label>
            <div class="col-sm-10">
              <input type="text" name="cname" id="cname" class="form-control" required>
            </div>
          </div>

          <!-- 사업자등록번호 -->
          <div class="mb-3 row">
            <label class="col-sm-2 col-form-label text-end">사업자등록번호</label>
            <div class="col-sm-2">
              <input type="text" name="brnumber1" class="form-control" required>
            </div>
            <div class="col-sm-2">
              <input type="text" name="brnumber2" class="form-control" required>
            </div>
            <div class="col-sm-5">
              <input type="text" name="brnumber3" class="form-control" required>
            </div>
          </div>

          <!-- 버튼 -->
          <div class="text-center">
            <button type="button" class="btn btn-outline-success" id="jBtn_co">회원가입</button>
            <button type="button" class="btn btn-outline-secondary" onclick="history.back()">취소</button>
          </div>
        </form>
      </div>

</body>
</html>