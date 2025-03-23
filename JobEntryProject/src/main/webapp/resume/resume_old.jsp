<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
            <h3>문종호</h3>
        </div>
        <div class="card-body">
            <div class="d-flex justify-content-start">
                <!-- 왼쪽: 정보 -->
                <div class="me-4">
                    <p><i class="bi bi-envelope me-2"></i><strong>이메일:</strong> 1001moon@hanafos.com</p>
                    <p><i class="bi bi-telephone me-2"></i><strong>전화번호:</strong> 010-8778-8264</p>
                    <p><i class="bi bi-gender-mail me-2"></i><strong>성별:</strong> 남자</p> <!-- 성별 옆 아이콘 추가 -->
                    <p><i class="bi bi-calendar me-2"></i><strong>생년월일:</strong> 1995-09-05</p>
                    <p><i class="bi bi-house-door me-2"></i><strong>주소:</strong> 서울 서대문</p>
                </div>
                <!-- 오른쪽: 사진 -->
                <div class="ms-auto">
                    <img src="../resume/moon.png" alt="Profile Image" class="img-fluid rounded-circle" style="width: 150px;">
                </div>
            </div>
        </div>
    </div>

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