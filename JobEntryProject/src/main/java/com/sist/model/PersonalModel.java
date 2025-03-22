package com.sist.model;

import java.io.PrintWriter;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.*;
import com.sist.vo.*;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class PersonalModel {
	@RequestMapping("personal/join.do")
	public String personal_join(HttpServletRequest request,HttpServletResponse response)
	{
		request.setAttribute("main_jsp","../member/join.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("personal/emailcheck.do") 
	public String personal_emailcheck(HttpServletRequest request,HttpServletResponse response)
	{
		// include
		return "../member/emailcheck.jsp";
	}
	@RequestMapping("personal/emailcheck_ok.do")
	public void personal_idcheck_ok(HttpServletRequest request,HttpServletResponse response)
	{
		// void => 일반 데이터 (String , int)
		// => JSON
		// data:{"id":id.trim()} ?id=aaa
		String email=request.getParameter("email");
		int count=PersonalDAO.personalIdcheck(email);
		
		try 
		{
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.write(String.valueOf(count));
		}catch(Exception ex){}
		
	}
	@RequestMapping("personal/join_ok.do")
	public String personal_join_ok(HttpServletRequest request,HttpServletResponse response)
	{
		String pw=request.getParameter("pw");
		String email=request.getParameter("email");
		String name=request.getParameter("name");
		String poster=request.getParameter("poster");
		if(poster==null)
			poster="";
		else
			poster="c:\\uploads\\"+poster;
		String sex=request.getParameter("sex");
		String birth=request.getParameter("birth");
		String addr1=request.getParameter("addr1");
		String addr2=request.getParameter("addr2");
		String phone1=request.getParameter("phone1");
		String phone2=request.getParameter("phone2");
		
		PersonalVO vo=new PersonalVO();
		vo.setPw(pw);
		vo.setName(name);
		vo.setPoster(poster);
		vo.setSex(sex);
		vo.setBirth(birth);
		vo.setEmail(email);
		vo.setAddr1(addr1);
		vo.setAddr2(addr2);
		vo.setPhone(phone1+"-"+phone2);
		PersonalDAO.personalInsert(vo);
				
		return "redirect:../main/main.do";
	}
	@RequestMapping("personal/login.do") 
	public String personal_login(HttpServletRequest request,HttpServletResponse response) 
	{
		return "../member/login.jsp";
	}
	@RequestMapping("personal/login_ok.do")
	public void personal_login_ok(HttpServletRequest request,HttpServletResponse response)
	{
		String email=request.getParameter("email");
		String pw=request.getParameter("pw");
		PersonalVO vo=PersonalDAO.personalLogin(email, pw);
		if(vo.getMsg().equals("OK"))
		{
			HttpSession session=request.getSession();
			session.setAttribute("id", vo.getId());
			session.setAttribute("name", vo.getName());
			session.setAttribute("email", email);
			session.setAttribute("sex", vo.getSex());
			session.setAttribute("isadmin", vo.getIsadmin());
			// post, addr1, addr2
		}
		try
		{
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.write(vo.getMsg());
		}catch(Exception ex) {}
	}
	//로그아웃
	@RequestMapping("personal/logout.do")
	public String personal_logout(HttpServletRequest request,HttpServletResponse response)
	{
		HttpSession session=request.getSession();
		session.invalidate();
		return "redirect:../main/main.do";
	}
}
