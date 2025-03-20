<%@ page import="java.io.*, jakarta.servlet.http.*, jakarta.servlet.annotation.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
String uploadPath = "C:/uploads";
File uploadDir = new File(uploadPath);
if (!uploadDir.exists()) uploadDir.mkdirs(); // 폴더가 없으면 생성

Part filePart = request.getPart("file");
String userId = request.getParameter("userId"); // 사용자 ID
String fileName = filePart.getSubmittedFileName();
String fileExtension = fileName.substring(fileName.lastIndexOf("."));
String newFileName = userId + fileExtension; // "사용자아이디.확장자"
String filePath = uploadPath + File.separator + newFileName;

// 파일 저장
try (InputStream fileContent = filePart.getInputStream();
     FileOutputStream fos = new FileOutputStream(filePath)) {

    byte[] buffer = new byte[1024];
    int bytesRead;
    while ((bytesRead = fileContent.read(buffer)) != -1) {
        fos.write(buffer, 0, bytesRead);
    }
    out.print("업로드 성공: " + newFileName);
} catch (Exception e) {
    out.print("업로드 오류: " + e.getMessage());
}
%>
