<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
        .upload-box {
            width: 150px;
            height: 200px;
            border-radius: 15px;
            background-color: #f8f9fa;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            border: 2px dashed #dee2e6;
            transition: all 0.3s ease-in-out;
            overflow: hidden;
        }
        .upload-box:hover {
            background-color: #e9ecef;
        }
        .upload-box img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            border-radius: 15px;
        }
        .profile-container {
            position: absolute;
            top: 20px;
            right: 20px;
        }
</style>
<script type="text/javascript">
function getTimestamp() 
{
    var now = new Date();
    var year = now.getFullYear();
    var month = ("0" + (now.getMonth() + 1)).slice(-2); // 월 (0부터 시작하므로 +1)
    var day = ("0" + now.getDate()).slice(-2);
    var hours = ("0" + now.getHours()).slice(-2);
    var minutes = ("0" + now.getMinutes()).slice(-2);
    var seconds = ("0" + now.getSeconds()).slice(-2);
    return year + month + day + "_" + hours + minutes + seconds;
}
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
	
    const imageUpload = document.getElementById("imageUpload");
    const uploadLabel = document.getElementById("uploadLabel");

    imageUpload.addEventListener("change", function(event) {
        var formData = new FormData();
        var fileName=$("#imageUpload")[0].files[0].name
        //alert(fileName)
        var newName=fileName.substring(0, fileName.lastIndexOf("."))+'_'+getTimestamp()+fileName.substring(fileName.lastIndexOf(".")) 
        //alert(newName)
        //var fileName= $("#imageUpload")[0].files[0].name+'_'+getTimestamp();
        formData.append("file", $("#imageUpload")[0].files[0]);
        formData.append("fileName", newName); // 파일이름

        $.ajax({
            url: "../UploadServlet",  
            type: "POST",
            data: formData,
            contentType: false,
            processData: false,
            success: function(response) {
                $("#uploadLabel").html(
                        '<img src="../file/image.jsp?fileName='+newName+'&t=' + new Date().getTime() + '" alt="Uploaded Image" '
                      + 'style="display: block; max-width: 100%; height: auto;">'
                      +'<input type="hidden" name="poster" value="'+newName+'">');            
            },
            error: function(jqXHR, textStatus, errorThrown) {
                console.error("AJAX 요청 실패!");
                console.error("상태 코드: ", jqXHR.status); // HTTP 상태 코드 (예: 404, 500)
                console.error("응답 텍스트: ", jqXHR.responseText); // 서버에서 반환한 오류 메시지
                console.error("에러 내용: ", errorThrown); // 예외 정보
                alert("업로드 실패! 오류 코드: " + jqXHR.status);
            }
        });
    });
/*
    uploadLabel.addEventListener("click", (event) => {
    	event.preventDefault(); // 🚀 기본 동작 방지
        imageUpload.click(); // label이 아닌 직접 실행
    });
*/   
})
</script>
</head>
<body>
      <div class="card p-4 position-relative">
        <form method="post" action="../personal/join_ok.do" name="frm" id="frm_pr">
        <!-- Poster -->

        <div class="profile-container">
          <label for="imageUpload" class="upload-box" id="uploadLabel">
            <img src="../file/default-icon.png" alt="image upload">
          </label>  
          <input type="file" id="imageUpload" accept="image/*" class="d-none" style="display: none;" >
        </div>

          <!-- 이메일 -->
          <div class="mb-3 row">
            <label class="col-sm-2 col-form-label text-end">이메일</label>
            <div class="col-sm-7">
              <div class="input-group">
                <input type="text" name="email" id="email_pr" class="form-control" readonly>
                <button type="button" class="btn btn-outline-primary idBtn">이메일 중복 체크</button>
              </div>
            </div>
          </div>

          <!-- 비밀번호 -->
          <div class="mb-3 row">
            <label class="col-sm-2 col-form-label text-end">비밀번호</label>
            <div class="col-sm-3">
              <input type="password" name="pw" id="pwd1_pr" class="form-control password" placeholder="비밀번호 입력" required>
            </div>
            <div class="col-sm-3">
              <input type="password" name="pwd1" id="pwd2_pr" class="form-control password" placeholder="비밀번호 재입력" required>
            </div>
		    <div class="col-sm">
		        <button class="btn btn-outline-secondary togglePassword" type="button">
		            <i class="fas fa-eye-slash"></i>
		        </button>
		    </div>
          </div>

          <!-- 이름 -->
          <div class="mb-3 row">
            <label class="col-sm-2 col-form-label text-end">이름</label>
            <div class="col-sm-7">
              <input type="text" name="name" id="name_pr" class="form-control" required>
            </div>
          </div>

          <!-- 성별 -->
          <div class="mb-3 row">
            <label class="col-sm-2 col-form-label text-end">성별</label>
            <div class="col-sm-7 d-flex align-items-center">
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

    <script>

    </script>

</body>
</html>