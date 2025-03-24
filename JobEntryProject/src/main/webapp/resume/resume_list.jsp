<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>이력서 관리</title>
<!--     
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
 -->
    <style>
        /* 이력서 리스트 컨테이너 */
        .resume-container {
            display: flex;
            gap: 10px;
            overflow-x: auto; /* 좌우 스크롤 가능 */
            white-space: nowrap;
            scrollbar-width: none; /* 스크롤바 숨김 */
            -ms-overflow-style: none;
        }

        .resume-container::-webkit-scrollbar {
            display: none; /* 크롬 등 웹킷 브라우저에서 스크롤바 숨김 */
        }

        /* 이력서 카드 */
        .resume-card {
            flex: 0 0 auto;
            width: 250px;
        }

        /* 점선 테두리 (이력서 추가 버튼) */
        .border-dashed {
            border: 2px dashed #ccc;
        }

        /* 추가 메뉴 버튼 */
        .menu-btn {
            border: none;
            background: none;
            font-size: 1.2rem;
            cursor: pointer;
        }

        /* 좌우 슬라이드 버튼 */
        .scroll-btn {
            position: absolute;
            top: 50%;
            transform: translateY(-50%);
            background: rgba(0, 0, 0, 0.1);
            border: none;
            font-size: 24px;
            cursor: pointer;
            padding: 10px;
            z-index: 10;
        }
        .scroll-left { left: 260px; }
        .scroll-right { right: 0; }
        .edit-resume .card-body {cursor: pointer;}
    </style>
</head>
<body>

<div class="container mt-5 position-relative">
    <!-- 이력서 섹션 -->
    <h4 class="mb-3">이력서</h4>

    <!-- 좌우 슬라이드 버튼 -->
    <button class="scroll-btn scroll-left" id="scrollLeft">‹</button>
    <button class="scroll-btn scroll-right" id="scrollRight">›</button>

    <!-- 이력서 리스트 -->
    <div style="display: flex; gap: 10px;">
      <!-- 새 이력서 추가 버튼 -->
      <input type="hidden" id="id" name="id" value="${id }">
      <div class="resume-card card text-center border-dashed p-3" id="addResume">
          <a href="../resume/resume_detail.do" class="text-decoration-none text-dark">
              <div class="card-body">
                  <h5 class="mb-0">+ 새 이력서 작성</h5>
              </div>
          </a>
      </div>
      <div class="resume-container" id="resumeList">
<%--       
        <!-- 기본 이력서 -->
        <c:forEach var="vo" items="${list }" varStatus="s">
       	<c:if test="${s.index==0 }">
        <div class="resume-card card border-primary edit-resume">
            <div class="card-header bg-primary text-white d-flex justify-content-between">
                대표 이력서 <span class="badge bg-light text-dark">50%</span>
                <!-- 
                <div class="dropdown">
                    <button class="menu-btn" data-bs-toggle="dropdown">⋮</button>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#">대표 이력서 설정</a></li>
                        <li><a class="dropdown-item" href="#">이력서 복사</a></li>
                        <li><a class="dropdown-item" href="#">다운로드</a></li>
                        <li><a class="dropdown-item text-danger delete-resume" href="#">삭제</a></li>
                    </ul>
                </div>
                -->
            </div>
            <div class="card-body">
        	<form method=post action="../resume/resume_detail.do" class="showDetail">
                <h5 class="card-title">${vo.title }</h5>
                <input type="hidden" class="id" name="id" value="${id }">
                <input type="hidden" class="rno" name="rno" value="${vo.rno }">
                <!-- 
                <p class="text-muted">2025.03.07 | 임시 저장</p>
            	 -->
            </form>
            </div>
        </div>
        </c:if>
    	<c:if test="${s.index>0 }">
        <div class="resume-card card edit-resume">
            <div class="card-header d-flex justify-content-between">
                이력서 ${resumeCount}
                <div class="dropdown">
                    <button class="menu-btn" data-bs-toggle="dropdown">⋮</button>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#">대표 이력서 설정</a></li>
						<!-- 
                        <li><a class="dropdown-item" href="#">이력서 복사</a></li>
                        <li><a class="dropdown-item" href="#">다운로드</a></li>
						 -->
                        <li><a class="dropdown-item text-danger delete-resume" href="../resume/resume_delete.do?rno=${vo.rno }">삭제</a></li>
                    </ul>
                </div>
            </div>
            <div class="card-body">
        	<form method=post action="../resume/resume_detail.do" class="showDetail">
                <h5 class="card-title">${vo.title }</h5>
                <input type="hidden" class="id" name="id" value="${id }">
                <input type="hidden" class="rno" name="rno" value="${vo.rno }">
                <!-- 
                <p class="text-muted">2025.03.07 | 임시 저장</p>
            	 -->
			</form>
            </div>
        </div>
        </c:if>
        </c:forEach>
 --%>        
      </div>
    </div>
    
</div>

<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
    let id=$('#id').val()
    print_page(id);
/*     
	$('#findBtn').click(function(){
	    print_page(1);
	})
	$('#ss').keydown(function(e){
		if(e.keyCode==13)
		{
		    print_page(1);
	    }	
	})
 */	
    // 이력서 추가 기능
    $(document).on("click", ".edit-resume .card-body", function() {
    	let id=$('#id').val()
    	let rno=$(this).find(".rno").val()
    	submitForm(id, rno);
    });
/* 
	$(document).on("click", ".edit-resume .card-body", function() {
        $(this).find(".showDetail").submit();
    });
 */
    // 좌우 슬라이드 기능
    $("#scrollLeft").click(function() {
        $("#resumeList").animate({ scrollLeft: "-=250px" }, 300);
    });

    $("#scrollRight").click(function() {
        $("#resumeList").animate({ scrollLeft: "+=250px" }, 300);
    });
})

function submitForm(id, rno) {
    // 1. form 요소 생성
    let form = document.createElement("form");
    form.method = "POST";  // HTTP 요청 방식
    form.action = "../resume/resume_detail.do"; // 전송할 URL

    // 2. id 입력 필드 추가
    let inputId = document.createElement("input");
    inputId.type = "hidden";
    inputId.name = "id";
    inputId.value = id;
    form.appendChild(inputId);

    // 3. rno 입력 필드 추가
    let inputRno = document.createElement("input");
    inputRno.type = "hidden";
    inputRno.name = "rno";
    inputRno.value = rno;
    form.appendChild(inputRno);

    // 4. form을 body에 추가하고 전송
    document.body.appendChild(form);
    form.submit();
}

function change_basic(id,rno)
{
    $.ajax({
        type:'post',
        url:'../resume/resume_basic_ajax.do',
        data:{"id":id, "rno":rno},
        success:function(result){
        	print_page(id)
        }
    })
}

function remove_resume(id,rno)
{
    $.ajax({
        type:'post',
        url:'../resume/resume_delete_ajax.do',
        data:{"rno":rno},
        success:function(result){
        	print_page(id)
        }
    })
}

function print_page(id)
{
    $.ajax({
        type:'post',
        url:'../resume/resume_list_ajax.do',
        data:{"id":id},
        success:function(result){
            let json=JSON.parse(result)
            //console.log(json)
            jsonView(json,id)
        }
    })
}
function jsonView(json,id)
{
    // 이미지 
    let html=''
    json.forEach(function(resume, index){
    	if(index===0)
    	{
        	html+='<div class="resume-card card border-primary edit-resume">'
                +'<div class="card-header bg-primary text-white d-flex justify-content-between">'
                +'대표 이력서 <span class="badge bg-light text-dark">50%</span>'
                +'</div>'
                +'<div class="card-body">'
                +'<h5 class="card-title">'+resume.title+'</h5>'
                +'<input type="hidden" class="rno" name="rno" value="'+resume.rno+'">'
                +'</div>'
                +'</div>'
    	}
    	else
    	{
    		
    		html+='<div class="resume-card card edit-resume">'
            	+'<div class="card-header d-flex justify-content-between">'
                +'이력서 '+index
                +'<div class="dropdown">'
                +'<button class="menu-btn" data-bs-toggle="dropdown">⋮</button>'
                +'<ul class="dropdown-menu">'
                +'<li><a class="dropdown-item" style="cursor: pointer;" onclick="change_basic(\''+id+'\','+resume.rno+')">대표 이력서 설정</a></li>'
                +'<li><a class="dropdown-item text-danger" style="cursor: pointer;" onclick="remove_resume(\''+id+'\','+resume.rno+')">삭제</a></li>'
                +'</ul>'
                +'</div>'
            	+'</div>'
            	+'<div class="card-body">'
                +'<h5 class="card-title">'+resume.title+'</h5>'
                +'<input type="hidden" class="rno" name="rno" value="'+resume.rno+'">'
    	        +'</div>'
        		+'</div>'
    	}
    })
    // 페이지
    $('#resumeList').html(html)

}
</script>

</body>
</html>
