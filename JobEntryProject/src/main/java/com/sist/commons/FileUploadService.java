package com.sist.commons;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import jakarta.servlet.http.Part;

public class FileUploadService {
    private static final String UPLOAD_DIR = "C:/uploads/";

    public String saveFile(String userId, Part filePart) {
        File uploadFolder = new File(UPLOAD_DIR);
        if (!uploadFolder.exists()) uploadFolder.mkdirs();

        String fileName = filePart.getSubmittedFileName();
        String fileExtension = fileName.substring(fileName.lastIndexOf("."));
        String newFileName = userId + fileExtension;
        String filePath = UPLOAD_DIR + newFileName;

        try (InputStream fileContent = filePart.getInputStream();
             FileOutputStream fos = new FileOutputStream(filePath)) {

            byte[] buffer = new byte[1024];
            int bytesRead;
            while ((bytesRead = fileContent.read(buffer)) != -1) {
                fos.write(buffer, 0, bytesRead);
            }
            return "업로드 성공: " + newFileName;
        } catch (IOException e) {
            return "업로드 오류: " + e.getMessage();
        }
    }
}
