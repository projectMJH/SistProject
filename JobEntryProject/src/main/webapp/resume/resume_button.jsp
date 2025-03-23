<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>이력서 관리</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

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
        .scroll-left { left: 0; }
        .scroll-right { right: 0; }
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
    <div class="resume-container" id="resumeList">
        <!-- 새 이력서 추가 버튼 -->
        <div class="resume-card card text-center border-dashed p-3" id="addResume">
            <a href="#" class="text-decoration-none text-dark">
                <div class="card-body">
                    <h5 class="mb-0">+ 새 이력서 작성</h5>
                </div>
            </a>
        </div>

        <!-- 기본 이력서 -->
        <div class="resume-card card border-primary">
            <div class="card-header bg-primary text-white d-flex justify-content-between">
                대표 이력서 <span class="badge bg-light text-dark">50%</span>
                <div class="dropdown">
                    <button class="menu-btn" data-bs-toggle="dropdown">⋮</button>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#">대표 이력서 설정</a></li>
                        <li><a class="dropdown-item" href="#">이력서 복사</a></li>
                        <li><a class="dropdown-item" href="#">다운로드</a></li>
                        <li><a class="dropdown-item text-danger delete-resume" href="#">삭제</a></li>
                    </ul>
                </div>
            </div>
            <div class="card-body">
                <h5 class="card-title">프로필</h5>
                <p class="text-muted">2025.03.07 | 임시 저장</p>
            </div>
        </div>
    </div>
</div>

<script>
    $(document).ready(function() {
        let resumeCount = 1; // 현재 이력서 개수

        // 이력서 추가 기능
        $("#addResume").click(function(event) {
            event.preventDefault();
            resumeCount++;

            let newResume = `
                <div class="resume-card card">
                    <div class="card-header d-flex justify-content-between">
                        이력서 ${resumeCount}
                        <div class="dropdown">
                            <button class="menu-btn" data-bs-toggle="dropdown">⋮</button>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="#">대표 이력서 설정</a></li>
                                <li><a class="dropdown-item" href="#">이력서 복사</a></li>
                                <li><a class="dropdown-item" href="#">다운로드</a></li>
                                <li><a class="dropdown-item text-danger delete-resume" href="#">삭제</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="card-body">
                        <h5 class="card-title">새 이력서</h5>
                        <p class="text-muted">2025.03.07 | 임시 저장</p>
                    </div>
                </div>
            `;

            $("#resumeList").append(newResume);
        });

        // 이력서 삭제 기능
        $(document).on("click", ".delete-resume", function(event) {
            event.preventDefault();
            $(this).closest(".resume-card").remove();
            resumeCount--;
        });

        // 좌우 슬라이드 기능
        $("#scrollLeft").click(function() {
            $("#resumeList").animate({ scrollLeft: "-=250px" }, 300);
        });

        $("#scrollRight").click(function() {
            $("#resumeList").animate({ scrollLeft: "+=250px" }, 300);
        });
    });
</script>

</body>
</html>
