<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(function(){
	$('#postBtn').click(function(){
		new daum.Postcode({
			oncomplete:function(data)
			{
				$('#post').val(data.zonecode)
				$('#addr1').val(data.address)
			}
		}).open()
	})
	
	$('#jBtn_pr').click(function(){
		let email=$('#email_pr').val()
		if(email.trim()==="")
		{
			alert("개인 이메일 중복체크를 해야 됩니다")
			return
		}
		let pwd1=$('#pwd1_pr').val()
		if(pwd1.trim()==="")
		{
			$('#pwd1').focus()
			return
		}	
        let pwd2=$('#pwd2_pr').val()
		if(pwd1!==pwd2.trim())
		{
			alert("입력한 비밀번호가 서로 다릅니다")
			$('#pwd2_pr').val("")
			$('#pwd2_pr').focus()
			return
		}	
        let name=$('#name_pr').val()
        if(name.trim()==="")
        {
        	alert("이름을 입력 해야 됩니다")
            $('#name_pr').focus()
            return
        }  
        let post=$('#post').val()
        if(post.trim()==="")
        {
        	alert("우편번호 검색을 해야 됩니다")
        	return
        }	
        
        $('#frm_pr').submit()
	})
})
</script>
</head>
<body>
      <div class="card p-4">
        <form method="post" action="../personal/join_ok.do" name="frm" id="frm_pr">
          <!-- 이메일 -->
          <div class="mb-3 row">
            <label class="col-sm-2 col-form-label text-end">이메일</label>
            <div class="col-sm-10">
              <div class="input-group">
                <input type="text" name="email" id="email_pr" class="form-control" readonly>
                <button type="button" class="btn btn-outline-primary idBtn">이메일 중복 체크</button>
              </div>
            </div>
          </div>

          <!-- 비밀번호 -->
          <div class="mb-3 row">
            <label class="col-sm-2 col-form-label text-end">비밀번호</label>
            <div class="col-sm-4">
              <input type="password" name="pw" id="pwd1_pr" class="form-control password" placeholder="비밀번호 입력" required>
            </div>
            <div class="col-sm-4">
              <input type="password" name="pwd1" id="pwd2_pr" class="form-control password" placeholder="비밀번호 재입력" required>
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
              <input type="text" name="name" id="name_pr" class="form-control" required>
            </div>
          </div>

          <!-- 성별 -->
          <div class="mb-3 row">
            <label class="col-sm-2 col-form-label text-end">성별</label>
            <div class="col-sm-10 d-flex align-items-center">
              <div class="form-check me-3">
                <input class="form-check-input" type="radio" name="sex" value="남자" checked>
                <label class="form-check-label">남자</label>
              </div>
              <div class="form-check">
                <input class="form-check-input" type="radio" name="sex" value="여자">
                <label class="form-check-label">여자</label>
              </div>
            </div>
          </div>

          <!-- 생년월일 -->
          <div class="mb-3 row">
            <label class="col-sm-2 col-form-label text-end">생년월일</label>
            <div class="col-sm-10">
              <input type="date" name="birth" class="form-control">
            </div>
          </div>

          <!-- 우편번호 -->
          <div class="mb-3 row">
            <label class="col-sm-2 col-form-label text-end">우편번호</label>
            <div class="col-sm-10">
              <div class="input-group">
                <input type="text" id="post" name="post" class="form-control" readonly>
                <button type="button" id="postBtn" class="btn btn-outline-danger">우편번호 검색</button>
              </div>
            </div>
          </div>

          <!-- 주소 -->
          <div class="mb-3 row">
            <label class="col-sm-2 col-form-label text-end">주소</label>
            <div class="col-sm-10">
              <input type="text" id="addr1" name="addr1" class="form-control" readonly>
            </div>
          </div>

          <!-- 상세주소 -->
          <div class="mb-3 row">
            <label class="col-sm-2 col-form-label text-end">상세주소</label>
            <div class="col-sm-10">
              <input type="text" name="addr2" class="form-control">
            </div>
          </div>

          <!-- 전화번호 -->
          <div class="mb-3 row">
            <label class="col-sm-2 col-form-label text-end">전화번호</label>
            <div class="col-sm-4">
              <select name="phone1" class="form-select">
                <option>010</option>
              </select>
            </div>
            <div class="col-sm-6">
              <input type="text" name="phone2" class="form-control">
            </div>
          </div>

          <!-- 버튼 -->
          <div class="text-center">
            <button type="button" class="btn btn-outline-success" id="jBtn_pr">회원가입</button>
            <button type="button" class="btn btn-outline-secondary" onclick="history.back()">취소</button>
          </div>
        </form>
      </div>

</body>
</html>