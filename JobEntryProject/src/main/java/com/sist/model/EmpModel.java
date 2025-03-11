package com.sist.model;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class EmpModel {
	@RequestMapping("emp/emp_list.do")
	public String emp_list(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("main_jsp", "../emp/emp_list.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("emp/emp_detail.do")
	public String emp_detail(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("main_jsp", "../emp/emp_detail.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("emp/emp_find.do")
	public String emp_find(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("main_jsp", "../emp/emp_find.jsp");
		return "../main/main.jsp";
	}
}
