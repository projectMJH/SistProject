<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이력서</title>
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
            top: 70px;
            right: 20px;
        }

        .input-container {
            margin-bottom: 1.5rem;
        }
        .form-control {
            border: none; /* Border 없애기 */
            border-radius: 0.5rem;   /* 둥근 모서리 */
            padding: 0.5rem;
            font-size: 1.1rem;
            background-color: transparent;
        }
        .form-label {
            font-weight: bold;
            font-size: 0.9rem;
        }
        .form-control:focus {
            box-shadow: none; /* 포커스시 하이라이트 제거 */
            border-color: #007bff; /* 포커스 시 파란색 테두리 */
        }
        .flex-align {
		    display: flex;
		    align-items: center; /* 아이콘과 텍스트 수직 정렬 */
		    gap: 8px; /* 아이콘과 텍스트 사이 간격 */
		    min-width: 200px; /* 최소 너비 설정 */
		}
</style>
<script>
$(document).ready(function(){
    let careerIndex = 0; // 경력 입력 폼의 인덱스

    // 경력 추가 버튼 클릭 시
//    $("#addCareer").click(function(){
    $(document).on("click", "#addCareer", function(){
        careerIndex++;
        let careerForm = `
            <div class="card shadow-sm mb-3 career-entry" data-index="${careerIndex}">
                <div class="card-body">
                    <div class="d-flex justify-content-between">
                        <strong>년/월 ~ 년/월</strong> 
                        <button class="btn btn-sm btn-outline-danger removeCareer"><i class="bi bi-trash me-2 fs-6"></i>삭제</button>
                    </div>
                    <input type="text" class="form-control mt-2" placeholder="기업명 입력">
                    <input type="text" class="form-control mt-2" placeholder="부서">
                    <input type="text" class="form-control mt-2" placeholder="직무">
                    <input type="text" class="form-control mt-2" placeholder="연봉 (선택)">
                    
                    <textarea class="form-control mt-2" placeholder="하단 추천 양식으로 이력서를 완성해 보세요"></textarea>

                    <div class="btn-group mt-3" role="group">
                        <button class="btn btn-outline-primary select-format">프로젝트 기반</button>
                        <button class="btn btn-outline-secondary select-format">개발/기술 기반</button>
                        <button class="btn btn-outline-success select-format">성과 기반</button>
                    </div>
                </div>
            </div>
        `;
        $("#careerContainer").append(careerForm);
    });

    // 경력 삭제 버튼 클릭 시
    $(document).on("click", ".removeCareer", function(){
        $(this).closest(".career-entry").remove();
    });

    // 추천 양식 버튼 클릭 시 스타일 적용
    $(document).on("click", ".select-format", function(){
        $(this).siblings().removeClass("btn-primary btn-secondary btn-success").addClass("btn-outline-primary btn-outline-secondary btn-outline-success");
        $(this).removeClass("btn-outline-primary btn-outline-secondary btn-outline-success").addClass("btn-primary");
    });

    let educationIndex = 0; // 학력 입력 폼의 인덱스

    // 학력 추가 버튼 클릭 시
//    $("#addEducation").click(function(){
    $(document).on("click", "#addEducation", function(){
        educationIndex++;
        let educationForm = `
            <div class="card shadow-sm mb-3 education-entry" data-index="${educationIndex}">
                <div class="card-body">
                    <div class="d-flex justify-content-between">
                        <strong>입학년도 ~ 졸업년도</strong> 
                        <button class="btn btn-sm btn-outline-danger removeEducation"><i class="bi bi-trash me-2 fs-6"></i>삭제</button>
                    </div>
                    <input type="text" class="form-control mt-2" placeholder="학교명 입력">
                    <input type="text" class="form-control mt-2" placeholder="전공">
                    <select class="form-control mt-2">
                        <option value="">학위 선택</option>
                        <option value="고등학교">고등학교</option>
                        <option value="전문학사">전문학사</option>
                        <option value="학사">학사</option>
                        <option value="석사">석사</option>
                        <option value="박사">박사</option>
                    </select>

                    <textarea class="form-control mt-2" placeholder="학업 성취도 및 주요 활동을 작성하세요"></textarea>

                    <div class="btn-group mt-3" role="group">
                        <button class="btn btn-outline-primary select-format">학업 성취</button>
                        <button class="btn btn-outline-secondary select-format">연구 및 프로젝트</button>
                        <button class="btn btn-outline-success select-format">기타 활동</button>
                    </div>
                </div>
            </div>
        `;
        $("#educationContainer").append(educationForm);
    });

    // 학력 삭제 버튼 클릭 시
    $(document).on("click", ".removeEducation", function(){
        $(this).closest(".education-entry").remove();
    });

    // 추천 양식 버튼 클릭 시 스타일 적용
    $(document).on("click", ".select-format", function(){
        $(this).siblings().removeClass("btn-primary btn-secondary btn-success").addClass("btn-outline-primary btn-outline-secondary btn-outline-success");
        $(this).removeClass("btn-outline-primary btn-outline-secondary btn-outline-success").addClass("btn-primary");
    });  
    
    const imageUpload = document.getElementById("imageUpload");
    const uploadLabel = document.getElementById("uploadLabel");

//    imageUpload.addEventListener("change", function(event) {
    $(document).on("change", "#imageUpload", function(event){
        var formData = new FormData();
        var fileName = $("#id").val()+'_'+$("#imageUpload")[0].files[0].name;
        formData.append("file", $("#imageUpload")[0].files[0]);
        formData.append("fileName", fileName); // 파일이름

        $.ajax({
            url: "../UploadServlet",  
            type: "POST",
            data: formData,
            contentType: false,
            processData: false,
            success: function(response) {
                $("#uploadLabel").html(
                        '<img src="../file/image.jsp?fileName='+fileName+'&t=' + new Date().getTime() + '" alt="Uploaded Image" '
                      + 'style="display: block; max-width: 100%; height: auto;">'
                      +'<input type="hidden" name="poster" value="'+fileName+'">');            
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

//    uploadLabel.addEventListener("click", (event) => {
/*
    $(document).on("click", "#uploadLabel", function(event){
    	event.preventDefault(); // 🚀 기본 동작 방지
        imageUpload.click(); // label이 아닌 직접 실행
    });
*/   
//	$('#jBtn').click(function(){
    $(document).on("click", "#jBtn", function(){
        $('#frm_resume').submit()
	})

});
</script> 
</head>
<body>
   <!-- main body -->
    <!-- 제목 섹션 -->
    <form method="post" action="../resume/resume_edit.do" id="frm_resume">
    <div class="card shadow-sm">
        <div class="card-header bg-light input-container">
            <label for="name" class="form-label">제목</label>
            <input type="text" name="title" class="form-control" value="${rvo.title }" style="font-size: 1.7rem;">
        </div>
    </div>
    <!-- 프로필 섹션 -->
    <div class="card shadow-sm mb-4">
        <div class="card-header bg-light">
            <h4>${rvo.name }</h4>
        </div>
        <div class="card-body">
            <div class="d-flex justify-content-start">
		        <div class="profile-container">
		          <label for="imageUpload" class="upload-box" id="uploadLabel">
		          	<c:if test="${rvo.poster==null }">
			            <img src="../file/default-icon.png" alt="image upload">
		          	</c:if>
		          	<c:if test="${rvo.poster!=null }">
			            <img src="../file/image.jsp?fileName=${rvo.poster }" style="display: block; max-width: 100%; height: auto;">
		          	</c:if>
		          </label>  
		          <input type="file" id="imageUpload" accept="image/*" class="d-none" style="display: none;" >
		        </div>
                <!-- 왼쪽: 정보 
                <div class="me-4">
                    <p class="flex-align"><span class="col-sm-3"><i class="bi bi-envelope">&nbsp;</i><strong>이메일:&nbsp;&nbsp;</strong></span>
                    </p>
                    <p class="flex-align"><i class="bi bi-telephone"></i>&nbsp;<strong>전화번호:&nbsp;&nbsp;</strong>
                    </p>
				    <p><i class="bi 
					        <c:choose>
					            <c:when test="${rvo.sex == '여자'}">bi-gender-female</c:when>
					            <c:otherwise>bi-gender-male</c:otherwise>
					        </c:choose> 
					    	">
					   </i><strong>성별:&nbsp;&nbsp;</strong>${rvo.sex }
				    </p>
                    <p class="flex-align"><i class="bi bi-calendar"></i>&nbsp;<strong>생년월일:&nbsp;&nbsp;</strong>
                    </p>
                    <p class="flex-align"><i class="bi bi-house-door"></i><strong>주소:&nbsp;&nbsp;</strong>
                    ${rvo.address }
                    </p>
                </div>
-->
                 <!-- 왼쪽: 정보 -->
                 <div class="me-4">
                     <p><i class="bi bi-envelope me-2"></i><strong>이메일:&nbsp;&nbsp;</strong>${rvo.email }</p>
                     <p><i class="bi bi-telephone me-2"></i><strong>전화번호:&nbsp;&nbsp;</strong>${rvo.phone }</p>
 				    <p><i class="bi 
 					        <c:choose>
 					            <c:when test="${rvo.sex == '여자'}">bi-gender-female</c:when>
 					            <c:otherwise>bi-gender-male</c:otherwise>
 					        </c:choose> 
 					    	me-1">
 					   </i><strong>성별:&nbsp;&nbsp;</strong>${rvo.sex }
 				    </p>
                     <p><i class="bi bi-calendar me-2"></i><strong>생년월일:&nbsp;&nbsp;</strong>${rvo.birth }</p>
                     <p><i class="bi bi-house-door me-2"></i><strong>주소:&nbsp;&nbsp;</strong>${rvo.address }</p>
                 </div>                
            </div>
        </div>
    </div>

    <!-- 스킬 입력 
    <div class="card shadow-sm mb-3">
        <div class="card-header bg-light">
            <h5>직종/스킬</h5>
        </div>
        <div class="card-body">
            <p>이곳에 추가적인 정보나 내용들을 배치할 수 있습니다. 예를 들어 이력서 내용이나, 관심사 등을 포함할 수 있습니다.</p>
        </div>
    </div>
    -->         
    <div class="card shadow-sm mb-3">
        <div class="card-header bg-light">
            <h5>경력 사항</h5>
        </div>
        <div class="card-body">
            <div class="border-bottom pb-2 mb-3">
                <strong>2021.09 ~ 2024.11</strong> <span class="badge bg-secondary">재직중</span>
            </div>
            <h5>지모트</h5>
            <p class="text-muted">솔루션사업실 | <strong>부장</strong></p>
            <p><strong>연봉:</strong> 5,000 만원</p>

            <div class="bg-light p-3 rounded">
                <h6 class="fw-bold">1. 프로젝트명:</h6>
                <p><strong>진행 기간:</strong> 2024년 7월 23일 ~ 2024년 10월 23일 (3개월)</p>
                <p><strong>주요 역할:</strong> RCLIPS (개인신용전략솔루션) 탑재</p>
                <p><strong>업무 성과:</strong> 개인신용정보기반 대출전략시스템 업그레이드</p>
            </div>

            <div class="btn-group mt-3">
                <button class="btn btn-outline-primary">프로젝트 기반</button>
                <button class="btn btn-outline-secondary">개발/기술 기반</button>
                <button class="btn btn-outline-success">성과 기반</button>
            </div>
        </div>
        
	    <div id="careerContainer">
	        <!-- 경력 입력 폼이 추가될 위치 -->
	    </div>
	    <button id="addCareer" class="btn btn-link text-primary mt-2">+ 추가</button>        
    </div>
	            
    <div class="card shadow-sm mb-2">
        <div class="card-header bg-light">
            <h5>학력 사항</h5>
        </div>
        <div class="card-body">
            <p>이곳에 추가적인 정보나 내용들을 배치할 수 있습니다. 예를 들어 이력서 내용이나, 관심사 등을 포함할 수 있습니다.</p>
        </div>
        <div id="educationContainer">
        <!-- 학력 입력 폼이 추가될 위치 -->
	    </div>
	    <button id="addEducation" class="btn btn-link text-primary mt-2">+ 추가</button>
    </div>
    
    <!-- hidden field -->
	<input type="hidden" id="id" name="id" value="${rvo.id }" >
	<input type="hidden" id="rno" name="rno" value="${rvo.rno }" >
	<input type="hidden" id="name" name="name" value="${rvo.name }" >
    <input type="hidden" id="email" name="email" value="${rvo.email }">
    <input type="hidden" id="phone" name="phone" value="${rvo.phone }">
    <input type="hidden" id="birth" name="birth" value="${rvo.birth }">
	<input type="hidden" id="scholar" name="scholar" value="${rvo.scholar }" >
	<input type="hidden" id="skill" name="skill" value="${rvo.skill }" >
	<input type="hidden" id="career" name="career" value="${rvo.career }" >
	<input type="hidden" id="self_intro" name="self_intro" value="${rvo.self_intro }" >
    <input type="hidden" name="isbasic" value="${rvo.isbasic}">
    <!-- 버튼 -->
    <div class="text-center">
      <button type="button" class="btn btn-outline-success" id="jBtn">등록</button>
      <button type="button" class="btn btn-outline-secondary" onclick="history.back()">취소</button>
    </div>
    </form>

</body>
</html>