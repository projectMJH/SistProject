<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>사람인 로그인</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="node_modules/bootstrap-icons/font/bootstrap-icons.css">
    <!-- FontAwesome -->
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>

<!-- ✅ 로그인 버튼 -->
<div class="container mt-5 text-center">
    <button class="btn btn-primary btn-lg" id="openLoginModal">로그인</button>
</div>

<!-- ✅ 로그인 모달 (Shadowbox) -->
<div class="modal fade" id="loginModal" tabindex="-1" aria-labelledby="loginModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">로그인</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <!-- 🔹 탭 메뉴 -->
                <ul class="nav nav-tabs" id="loginTabs">
                    <li class="nav-item">
                        <button class="nav-link active" data-bs-toggle="tab" data-bs-target="#personalTab">개인회원</button>
                    </li>
                    <li class="nav-item">
                        <button class="nav-link" data-bs-toggle="tab" data-bs-target="#companyTab">기업회원</button>
                    </li>
                </ul>

                <!-- 🔹 로그인 폼 -->
                <div class="tab-content mt-3">
                    <!-- 개인회원 -->
                    <div class="tab-pane fade show active" id="personalTab">
                        <form action="login_process.jsp" method="post">
                            <input type="hidden" name="userType" value="personal">
                            <div class="mb-3">
                                <input type="text" name="userId" class="form-control" placeholder="아이디">
                            </div>
                            <div class="mb-3 input-group">
                                <input type="password" name="password" class="form-control password" placeholder="비밀번호">
                                <button class="btn btn-outline-secondary togglePassword" type="button">
                                    <i class="fas fa-eye"></i>
                                </button>
                            </div>
                            <button type="submit" class="btn btn-primary w-100">로그인</button>
                        </form>
                    </div>

                    <!-- 기업회원 -->
                    <div class="tab-pane fade" id="companyTab">
                        <form action="login_process.jsp" method="post">
                            <input type="hidden" name="userType" value="company">
                            <div class="mb-3">
                                <input type="text" name="userId" class="form-control" placeholder="사업자 번호">
                            </div>
                            <div class="mb-3 input-group">
                                <input type="password" name="password" class="form-control password" placeholder="비밀번호">
                                <button class="btn btn-outline-secondary togglePassword" type="button">
                                    <i class="fas fa-eye"></i>
                                </button>
                            </div>
                            <button type="submit" class="btn btn-primary w-100">로그인</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- ✅ Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<script>
$(document).ready(function() {
    // 🔹 로그인 버튼 클릭 시 모달 표시
    $("#openLoginModal").click(function() {
        $("#loginModal").modal("show");
    });

    // 🔹 비밀번호 보이기/숨기기
    $(".togglePassword").click(function() {
        let input = $(this).closest(".input-group").find(".password");
        let type = input.attr("type") === "password" ? "text" : "password";
        input.attr("type", type);
        $(this).find("i").toggleClass("fa-eye fa-eye-slash");
    });
});
</script>

</body>
</html>
