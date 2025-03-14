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
public class OfficialModel {
	@RequestMapping("official/emailcheck.do") 
	public String official_emailcheck(HttpServletRequest request,HttpServletResponse response)
	{
		// include
		return "../member/emailcheck.jsp";
	}
	@RequestMapping("official/emailcheck_ok.do")
	public void official_idcheck_ok(HttpServletRequest request,HttpServletResponse response)
	{
		// void => 일반 데이터 (String , int)
		// => JSON
		// data:{"id":id.trim()} ?id=aaa
		String email=request.getParameter("email");
		int count=OfficialDAO.officialIdcheck(email);
		
		try 
		{
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.write(String.valueOf(count));
		}catch(Exception ex){}
		
	}
	@RequestMapping("official/join_ok.do")
	public String official_join_ok(HttpServletRequest request,HttpServletResponse response)
	{
		String pw=request.getParameter("pw");
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		String phone1=request.getParameter("phone1");
		String phone2=request.getParameter("phone2");
		String cname=request.getParameter("cname");
		String brnumber1=request.getParameter("brnumber1");
		String brnumber2=request.getParameter("brnumber2");
		String brnumber3=request.getParameter("brnumber3");
		
		OfficialVO vo=new OfficialVO();
		vo.setPw(pw);
		vo.setName(name);
		vo.setEmail(email);
		vo.setPhone(phone1+"-"+phone2);
		vo.setCname(cname);
		vo.setBrnumber(brnumber1+"-"+brnumber2+"-"+brnumber3);
		OfficialDAO.officialInsert(vo);
				
		return "redirect:../main/main.do";
	}
	@RequestMapping("official/login.do") 
	public String official_login(HttpServletRequest request,HttpServletResponse response) 
	{
		return "../member/login.jsp";
	}
	@RequestMapping("official/login_ok.do")
	public void official_login_ok(HttpServletRequest request,HttpServletResponse response)
	{
		String email=request.getParameter("email");
		String pw=request.getParameter("pw");
		OfficialVO vo=OfficialDAO.officialLogin(email, pw);
		if(vo.getMsg().equals("OK"))
		{
			HttpSession session=request.getSession();
			session.setAttribute("cid", vo.getCid()); 
			session.setAttribute("name", vo.getName());
			session.setAttribute("email", email);
			session.setAttribute("state", vo.getState());
			session.setAttribute("access_key", vo.getAccess_key());
			// phone, brnumber,state
		}
		try
		{
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.write(vo.getMsg());
		}catch(Exception ex) {}
	}
	//로그아웃
	@RequestMapping("official/logout.do")
	public String official_logout(HttpServletRequest request,HttpServletResponse response)
	{
		HttpSession session=request.getSession();
		session.invalidate();
		return "redirect:../main/main.do";
	}

}
