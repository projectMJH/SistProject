package com.sist.commons;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@WebServlet("/upload")
@MultipartConfig
public class FileUploadServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private FileUploadService fileUploadService = new FileUploadService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("upload 시작");
    	String userId = request.getParameter("userId");
        Part filePart = request.getPart("file");
        

        if (userId == null || filePart == null) {
            response.getWriter().write("잘못된 요청입니다.");
            return;
        }

        String result = fileUploadService.saveFile(userId, filePart);
        response.getWriter().write(result);
    }
}
