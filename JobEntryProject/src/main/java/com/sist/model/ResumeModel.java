package com.sist.model;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import java.util.*;
import com.sist.dao.*;
import com.sist.vo.*;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class ResumeModel {
	@RequestMapping("resume/resume.do")
	public String resume(HttpServletRequest request,HttpServletResponse response)
	{
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		int count=ResumeDAO.resumeCount(id);
		if(count==0)
		{
			String name=(String)session.getAttribute("name");
			String email=(String)session.getAttribute("email");
			PersonalVO vo=PersonalDAO.personalGetInfo(id);
			String phone=vo.getPhone();
			String addr1=vo.getAddr1();
			String addr2=vo.getAddr2();
			String birth=vo.getBirth();
			String poster=vo.getPoster();

			ResumeVO rvo=new ResumeVO();
			rvo.setId(id);
			rvo.setName(name);
			rvo.setEmail(email);
			rvo.setPhone(phone);
			rvo.setAddress(addr1+" "+addr2);
			rvo.setBirth(birth);
			rvo.setPoster(poster);
			rvo.setIsbasic('y');
			
			ResumeDAO.resumeInsert(rvo);
		}
		
		List<ResumeVO> list=ResumeDAO.resumeListData(id);
		request.setAttribute("id", id);
		request.setAttribute("list", list);
		request.setAttribute("count", count);
		
		request.setAttribute("my_jsp", "../resume/resume_list.jsp");
		request.setAttribute("main_jsp", "../mypage/my_main.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("resume/resume_detail.do")
	public String resume_detail(HttpServletRequest request,HttpServletResponse response)
	{
		ResumeVO rvo=new ResumeVO();
		String rno=request.getParameter("rno");
		if(rno==null)
		{
			HttpSession session=request.getSession();
			String id=(String)session.getAttribute("id");
			String name=(String)session.getAttribute("name");
			String email=(String)session.getAttribute("email");
			PersonalVO vo=PersonalDAO.personalGetInfo(id);
			String phone=vo.getPhone();
			String addr1=vo.getAddr1();
			String addr2=vo.getAddr2();
			String birth=vo.getBirth();
			String poster=vo.getPoster();
			System.out.println("JobEntryProject>ResumeModel>vo.getPoster()(null)"+vo.getPoster());

			rvo.setId(id);
			rvo.setName(name);
			rvo.setEmail(email);
			rvo.setPhone(phone);
			rvo.setAddress(addr1+" "+addr2);
			rvo.setBirth(birth);
			rvo.setPoster(poster);
			rvo.setTitle("제목 없음");
			rvo.setIsbasic('n');
		}
		else
		{
			rvo=ResumeDAO.resumeDetailData(Integer.parseInt(rno));
			String id=request.getParameter("id");
			PersonalVO vo=PersonalDAO.personalGetInfo(id);
			rvo.setPoster(vo.getPoster());
			System.out.println("JobEntryProject>ResumeModel>vo.getPoster()(not null)"+vo.getPoster());
			rvo.setAddress(vo.getAddr1()+" "+vo.getAddr2());
			rvo.setSex(vo.getSex());
			System.out.println("JobEntryProject>ResumeModel>rvo.getIsbasic()(not null)"+rvo.getIsbasic());
		}
		request.setAttribute("rvo", rvo);
		
		request.setAttribute("my_jsp", "../resume/resume_detail.jsp");
		request.setAttribute("main_jsp", "../mypage/my_main.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("resume/resume_delete.do")
	public String resume_delete(HttpServletRequest request,HttpServletResponse response)
	{
		String rno=request.getParameter("rno");
		ResumeDAO.resumeDelete(Integer.parseInt(rno));
		
		return "redirect:../resume/resume.do";
	}
/*	
	@RequestMapping("resume/resume_insert.do")
	public String resume_insert(HttpServletRequest request,HttpServletResponse response)
	{
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		String name=(String)session.getAttribute("name");
		String email=(String)session.getAttribute("email");
		
		ResumeVO rvo=new ResumeVO();
		rvo.setId(id);
		rvo.setName(name);
		rvo.setEmail(email);
		int count=ResumeDAO.resumeCount(id);
		if(count==0)
		{
			rvo.setIsbasic('y');
		}
		else
		{
			rvo.setIsbasic('n');
		}
		
		PersonalVO vo=PersonalDAO.personalGetInfo(id);
		
		String phone=vo.getPhone();
		String addr1=vo.getAddr1();
		String addr2=vo.getAddr2();
		String birth=vo.getBirth();
		String poster=vo.getPoster();
		
		rvo.setPhone(phone);
		rvo.setAddress(addr1+" "+addr2);
		rvo.setBirth(birth);
		rvo.setPoster(poster);
		
		ResumeDAO.resumeInsert(rvo);
		
		return "redirect:../resume/resume.do";
	}
*/	
	@RequestMapping("resume/resume_edit.do")
	public String resume_edit(HttpServletRequest request,HttpServletResponse response)
	{
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		String phone=request.getParameter("phone");
		String birth=request.getParameter("birth");
		String scholar=request.getParameter("scholar");
		String skill=request.getParameter("skill");
		String carreer=request.getParameter("carreer");
		String self_intro=request.getParameter("self_intro");
		String title=request.getParameter("title");
			if(title==null)
				title="제목 없음";	
		String isbasic=request.getParameter("isbasic");
		String poster=request.getParameter("poster");
		String rno=request.getParameter("rno");
		System.out.println("JobEntryProject>ResumeModel>rno"+rno);
			
		ResumeVO vo=new ResumeVO();
		vo.setId(id);
		vo.setName(name==null?"":name);
		vo.setEmail(email==null?"":email);
		vo.setPhone(phone==null?"":phone);
		vo.setBirth(birth==null?"":birth);
		vo.setScholar(scholar==null?"":scholar);
		vo.setSkill(skill==null?"":skill);
		vo.setCarreer(carreer==null?"":carreer);
		vo.setSelf_intro(self_intro==null?"":self_intro);
		vo.setTitle(title==null?"":title);
		vo.setIsbasic(isbasic.charAt(0));
		vo.setPoster(poster);
		
		if(rno==null||"0".equals(rno))
		{
			ResumeDAO.resumeInsert(vo);
		}
		else
		{
			ResumeDAO.resumeUpdate(vo);
		}
		
		return "redirect:../resume/resume.do";
	}
}
