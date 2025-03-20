package com.sist.model;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.*;
import com.sist.vo.*;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class ResumeModel {
	@RequestMapping("resume/resume_detail.do")
	public String resume_detail(HttpServletRequest request,HttpServletResponse response)
	{
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		String name=(String)session.getAttribute("name");
		String email=(String)session.getAttribute("email");
		String sex=(String)session.getAttribute("sex");
		
		PersonalVO vo=PersonalDAO.personalGetInfo(id);
		String phone=vo.getPhone();
		String addr1=vo.getAddr1();
		String addr2=vo.getAddr2();
		String birth=vo.getBirth();
		String poster=vo.getPoster();
		
		ResumeVO rvo=new ResumeVO();
		rvo.setEmail(email);
		rvo.setName(name);
		rvo.setSex(sex);
		rvo.setAddress(addr1+" "+addr2);
		rvo.setPhone(phone);
		rvo.setBirth(birth);
		rvo.setPoster(poster);
		
		request.setAttribute("rvo", rvo);
		
		request.setAttribute("my_jsp", "../resume/resume_detail.jsp");
		request.setAttribute("main_jsp", "../mypage/my_main.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("resume/resume_insert.do")
	public String resume_insert(HttpServletRequest request,HttpServletResponse response)
	{
		request.setAttribute("my_jsp","../resume/resume_detail.jsp");
		request.setAttribute("main_jsp", "../mypage/my_main.jsp");
		return "../main/main.jsp";
	}
}
