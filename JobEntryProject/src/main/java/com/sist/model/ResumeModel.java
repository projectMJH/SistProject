package com.sist.model;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class ResumeModel {
	@RequestMapping("resume/resume.do")
	public String main_resume(HttpServletRequest request,HttpServletResponse response)
	{
		request.setAttribute("my_jsp", "../resume/resume.jsp");
		request.setAttribute("main_jsp", "../mypage/my_main.jsp");
		return "../main/main.jsp";
	}
}
