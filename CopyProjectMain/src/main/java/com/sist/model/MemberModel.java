package com.sist.model;

import java.io.PrintWriter;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.MemberDAO;
import com.sist.vo.MemberVO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class MemberModel {
	@RequestMapping("member/join.do")
	public String member_join(HttpServletRequest request,HttpServletResponse response)
	{
		request.setAttribute("main_jsp","../member/join.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("member/emailcheck.do")
	public String member_emailcheck(HttpServletRequest request,HttpServletResponse response)
	{
		// include
		return "../member/emailcheck.jsp";
	}
	@RequestMapping("member/emailcheck_ok.do")
	public void member_idcheck_ok(HttpServletRequest request,HttpServletResponse response)
	{
		// void => 일반 데이터 (String , int)
		// => JSON
		// data:{"id":id.trim()} ?id=aaa
		String email=request.getParameter("email");
		int count=MemberDAO.memberIdcheck(email);
		
		try 
		{
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.write(String.valueOf(count));
		}catch(Exception ex){}
		
	}
	@RequestMapping("member/join_ok.do")
	public String member_join_ok(HttpServletRequest request,HttpServletResponse response)
	{
		String pw=request.getParameter("pw");
		String name=request.getParameter("name");
		String sex=request.getParameter("sex");
		String birth=request.getParameter("birth");
		String email=request.getParameter("email");
		String addr1=request.getParameter("addr1");
		String addr2=request.getParameter("addr2");
		String phone1=request.getParameter("phone1");
		String phone2=request.getParameter("phone2");
		
		MemberVO vo=new MemberVO();
		vo.setPw(pw);
		vo.setName(name);
		vo.setSex(sex);
		vo.setBirth(birth);
		vo.setEmail(email);
		vo.setAddr1(addr1);
		vo.setAddr2(addr2);
		vo.setPhone(phone1+"-"+phone2);
		MemberDAO.memberInsert(vo);
				
		return "redirect:../main/main.do";
	}
	@RequestMapping("member/login.do")
	public String member_login(HttpServletRequest request,HttpServletResponse response)
	{
		return "../member/login.jsp";
	}
	@RequestMapping("member/login_ok.do")
	public void member_login_ok(HttpServletRequest request,HttpServletResponse response)
	{
		String email=request.getParameter("email");
		String pw=request.getParameter("pw");
		MemberVO vo=MemberDAO.memberLogin(email, pw);
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
	@RequestMapping("member/logout.do")
	public String member_logout(HttpServletRequest request,HttpServletResponse response)
	{
		HttpSession session=request.getSession();
		session.invalidate();
		return "redirect:../main/main.do";
	}
}
