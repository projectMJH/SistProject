package com.sist.commons;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@WebServlet("/UploadServlet")
@MultipartConfig
public class UploadServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String fileName = request.getParameter("fileName");
        if (fileName == null || fileName.isEmpty()) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            return;
        }

        // 상대경로 설정
        //String uploadPath = getServletContext().getRealPath("uploads/");
        String uploadPath = "c:\\uploads";
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }

        for (Part part : request.getParts()) {
            String realName = Paths.get(part.getSubmittedFileName()).getFileName().toString();
            System.out.println("JobEntryProject>fileName: "+realName);
            if (realName != null && !realName.isEmpty()) {
                String filePath = uploadPath + File.separator + fileName; // 파일이름으로 저장
                part.write(filePath);
                response.setStatus(HttpServletResponse.SC_OK);
                return;
            }
        }

        response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
    }
}
