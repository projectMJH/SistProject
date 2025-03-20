<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이력서</title>
<script>
$(document).ready(function(){
    let careerIndex = 0; // 경력 입력 폼의 인덱스

    // 경력 추가 버튼 클릭 시
    $("#addCareer").click(function(){
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
    $("#addEducation").click(function(){
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
});
</script> 
</head>
<body>

    <!-- main body -->
    <!-- 프로필 섹션 -->
    <div class="card shadow-sm mb-4">
        <div class="card-header bg-light">
            <h3>${rvo.name }</h3>
        </div>
        <div class="card-body">
            <div class="d-flex justify-content-start">
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
                <!-- 오른쪽: 사진
                <div class="ms-auto text-center">
                  <label for="profileUpload" class="position-relative d-inline-block">
                  	<c:if test="${rvo.poster!=null }">
					<img id="profileImage" src="../resume/moon.png" alt="Profile Image"
			            class="img-fluid shadow border border-2" 
			            style="width: 150px; height: 200px; object-fit: cover; border-radius: 15px;">
			        </c:if>
        			<!-- 이미지가 없을 경우 아이콘 표시 -->    
                  	<c:if test="${rvo.poster==null }">
				        <i id="defaultIcon" class="bi bi-image text-secondary fs-1"></i> 
				        <input type="file" id="imageUpload" accept="image/*" class="d-none">   
			        </c:if>
			      </label>      
                </div>
                 -->
                
                <div class="ms-auto text-center">
				    <label for="profileUpload" class="position-relative d-inline-block">
				        <!-- 이미지 미리보기 -->
				        <img id="profileImage" src="../resume/moon.png" alt="Profile Image"
				            class="img-fluid shadow border border-2" 
				            style="width: 150px; height: 150px; object-fit: cover; border-radius: 15px;">
				
				        <!-- 이미지가 없을 경우 아이콘 표시 -->
				        <i id="defaultIcon" class="bi bi-person-circle text-secondary fs-1 position-absolute top-50 start-50 translate-middle"
				            style="display: none;"></i> 이미지 없음
				    </label>
				    
				    <!-- 파일 업로드 input -->
				    <input type="file" id="profileUpload" accept="image/*" class="d-none">
				</div>
                
                
                
                
                
            </div>
        </div>
    </div>
    
    <script>
document.addEventListener("DOMContentLoaded", function () {
    const profileUpload = document.getElementById("profileUpload");
    const profileImage = document.getElementById("profileImage");
    const defaultIcon = document.getElementById("defaultIcon");

    // 이미지가 없을 경우 기본 아이콘 표시
    if (!profileImage.src || profileImage.src.includes("moon.png") === false) {
        profileImage.style.display = "none";
        defaultIcon.style.display = "block";
    }

    // 파일 선택 시 이미지 미리보기
    profileUpload.addEventListener("change", function (event) {
        const file = event.target.files[0];
        if (file) {
            const reader = new FileReader();
            reader.onload = function (e) {
                profileImage.src = e.target.result;
                profileImage.style.display = "block";
                defaultIcon.style.display = "none"; // 기본 아이콘 숨김
            };
            reader.readAsDataURL(file);
        }
    });

    // 클릭 시 파일 업로드 창 열기
    profileImage.addEventListener("click", () => profileUpload.click());
    defaultIcon.addEventListener("click", () => profileUpload.click());
});
</script>
    
    
    
    
    

    <!-- 추가 내용 예시 -->
    <div class="card shadow-sm mb-3">
        <div class="card-header bg-light">
            <h5>직종/스킬</h5>
        </div>
        <div class="card-body">
            <p>이곳에 추가적인 정보나 내용들을 배치할 수 있습니다. 예를 들어 이력서 내용이나, 관심사 등을 포함할 수 있습니다.</p>
        </div>
    </div>
            
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
	            
    <div class="card shadow-sm">
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
        
		
    <!-- / main body -->
</body>
</html>