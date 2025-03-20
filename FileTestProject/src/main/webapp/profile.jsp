<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.io.File" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    // 로그인 ID (테스트용, 실제 구현 시 세션에서 가져올 것)
    String userId = "testuser";

    // 상대경로 설정
    String uploadDir = application.getRealPath("c:\\uploads/");
    File userImage = new File(uploadDir, userId + ".jpg");

    // 이미지 URL 설정
    String imageUrl = userImage.exists() ? "c:\\uploads/" + userId + ".jpg" : "default-icon.png";

    // JSP 변수 → EL로 변환
    request.setAttribute("userId", userId);
    request.setAttribute("imageUrl", imageUrl);
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>프로필 사진</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function() {
            // 이미지 클릭 시 파일 업로드 창 열기
            $("#profileImage").click(function() {
                $("#fileInput").click();
            });

            // 파일 선택 시 자동 업로드 (AJAX 사용)
            $("#fileInput").change(function() {
                var formData = new FormData();
                formData.append("file", $("#fileInput")[0].files[0]);
                formData.append("userId", "${userId}");

                $.ajax({
                    url: "UploadServlet",
                    type: "POST",
                    data: formData,
                    contentType: false,
                    processData: false,
                    success: function() {
                        alert("업로드 성공!");
                        $("#profileImage").attr("src", "c:\\uploads/${userId}.jpg?" + new Date().getTime()); // 캐싱 방지
                    },
                    error: function() {
                        alert("업로드 실패!");
                    }
                });
            });
        });
    </script>
</head>
<body>
    <h2>프로필 사진</h2>

    <!-- 프로필 사진 or 기본 아이콘 -->
    <img id="profileImage" src="${imageUrl}" alt="Profile Image" width="150" height="150" style="border-radius: 50%; cursor: pointer;">

    <input type="file" id="fileInput" accept="image/*" style="display: none;">
</body>
</html>
