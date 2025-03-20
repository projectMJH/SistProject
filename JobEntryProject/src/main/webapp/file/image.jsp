<%@ page import="java.io.*" %>
<%
    String userId = request.getParameter("userId");
    String uploadPath = "C:/uploads";
    String[] extensions = {".jpg", ".png", ".gif"};
    File imageFile = null;

    for (String ext : extensions) {
        File file = new File(uploadPath, userId + ext);
        if (file.exists()) {
            imageFile = file;
            response.setContentType("image/" + ext.substring(1));
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
        response.sendRedirect("default-icon.png");
    }
%>
