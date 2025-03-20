<%@ page import="java.io.*, jakarta.servlet.*" %>
<%
    String userId = request.getParameter("userId");
	//userId="testuser";
    String uploadPath = "C:/uploads";

    // JPG, PNG, GIF 순서대로 체크하여 존재하는 파일을 찾음
    String[] extensions = {".jpg", ".png", ".gif"};
    File imageFile = null;
    for (String ext : extensions) {
    	
        File file = new File(uploadPath, userId + ext);
        if (file.exists()) {
            imageFile = file;
            response.setContentType("image/" + ext.substring(1)); // MIME 타입 설정
            break;
        }
    }

    if (imageFile != null) {
        FileInputStream fis = new FileInputStream(imageFile);
        byte[] buffer = new byte[(int) imageFile.length()];
        fis.read(buffer);
        fis.close();
        response.getOutputStream().write(buffer);
    } else {
        response.sendRedirect("default-icon.png"); // 기본 이미지
    }
%>
