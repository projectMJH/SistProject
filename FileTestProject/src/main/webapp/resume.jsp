<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>이력서 - 사진 업로드</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        #profile-img {
            width: 150px; height: 200px; border: 1px solid #ddd;
            display: block; margin-bottom: 10px;
        }
    </style>
</head>
<body>

    <h2>이력서</h2>

    <div>
        <img id="profile-img" src="image.jsp?userId=testuser" alt="이력서 사진">
        <form id="uploadForm" enctype="multipart/form-data">
            <input type="file" name="file" id="fileInput" accept="image/*">
            <button type="submit">사진 업로드</button>
        </form>
    </div>

    <script>
        $(document).ready(function() {
            $("#uploadForm").on("submit", function(event) {
                event.preventDefault(); // 기본 폼 제출 방지

                var formData = new FormData();
                formData.append("file", $("#fileInput")[0].files[0]);
                formData.append("userId", "testuser"); // 실제 사용자의 ID로 변경

                $.ajax({
                    url: "upload.jsp",  
                    type: "POST",
                    data: formData,
                    contentType: false,
                    processData: false,
                    success: function(response) {
                        alert(response);
                        $("#profile-img").attr("src", "image.jsp?userId=testuser&rand=" + new Date().getTime());
                    },
                    error: function() {
                        alert("파일 업로드 실패!");
                    }
                });
            });
        });
    </script>

</body>
</html>
