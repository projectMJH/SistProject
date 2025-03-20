<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>사진 업로드</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"></script>
    <style>
        .upload-box {
            width: 150px;
            height: 150px;
            border-radius: 15px;
            background-color: #f8f9fa;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            border: 2px dashed #dee2e6;
            transition: all 0.3s ease-in-out;
        }
        .upload-box:hover {
            background-color: #e9ecef;
        }
        .upload-box img {
            max-width: 100%;
            max-height: 100%;
            object-fit: cover;
            border-radius: 15px;
        }
    </style>
</head>
<body class="d-flex justify-content-center align-items-center vh-100">

    <div class="text-center">
        <!-- 업로드 박스 -->
        <label for="imageUpload" class="upload-box" id="uploadLabel">
            <i class="bi bi-image fs-1 text-secondary" id="uploadIcon"></i>
            <p class="text-secondary mb-0" id="uploadText">사진 업로드</p>
            <small class="text-muted" id="uploadHint">(선택)</small>
        </label>

        <!-- 파일 업로드 input (숨김) -->
        <input type="file" id="imageUpload" accept="image/*" class="d-none">
    </div>

    <script>
        const imageUpload = document.getElementById("imageUpload");
        const uploadLabel = document.getElementById("uploadLabel");
        const uploadIcon = document.getElementById("uploadIcon");
        const uploadText = document.getElementById("uploadText");
        const uploadHint = document.getElementById("uploadHint");

        imageUpload.addEventListener("change", function(event) {
            const file = event.target.files[0];
            if (file) {
                const reader = new FileReader();
                reader.onload = function(e) {
                    uploadLabel.innerHTML = `<img src="${e.target.result}" alt="Uploaded Image">`;
                };
                reader.readAsDataURL(file);
            }
        });

        // 클릭 시 파일 업로드 창 열기
        uploadLabel.addEventListener("click", () => imageUpload.click());
    </script>

</body>
</html>