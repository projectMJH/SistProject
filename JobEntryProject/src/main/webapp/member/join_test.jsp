<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>이력서 - 사진 업로드</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        #profile-img { width: 150px; height: 200px; border: 1px solid #ddd; display: block; margin-bottom: 10px; }
    </style>
</head>
<body>

    <h2>이력서</h2>

    <div>
        <img id="profile-img" src="../file/image.jsp?userId=testuser" alt="이력서 사진">
        <form id="uploadForm" enctype="multipart/form-data">
            <input type="file" name="file" id="fileInput" accept="image/*">
            <button type="submit">사진 업로드</button>
        </form>
    </div>

    <script>
        $(document).ready(function() {
        	$("#uploadForm").on("submit", function(event) {
                var formData = new FormData();
                formData.append("file", $("#fileInput")[0].files[0]);
                formData.append("userId", "testuser"); // 실제 사용자 ID

                $.ajax({
                    url: "../UploadServlet",  
                    type: "POST",
                    data: formData,
                    contentType: false,
                    processData: false,
                    success: function(response) {
                        alert(response);
                        $("#profile-img").attr("src", "../file/image.jsp?userId=testuser&t=" + new Date().getTime());
                    },
                    error: function(jqXHR, textStatus, errorThrown) {
                    	alert("업로드 실패")
                        console.log("AJAX 요청 실패!");
                        console.log("상태 코드: " + jqXHR.status); // HTTP 상태 코드 (예: 404, 500)
                        console.log("응답 텍스트: " + jqXHR.responseText); // 서버에서 반환한 오류 메시지
                        console.log("에러 내용: " + errorThrown); // 예외 정보
                        alert("업로드 실패! 오류 코드: " + jqXHR.status);                    }
                });
            });
        });
    </script>

</body>
</html>
