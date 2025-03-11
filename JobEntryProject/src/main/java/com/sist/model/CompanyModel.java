package com.sist.model;

import java.util.*;
import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.sist.vo.*;
import com.sist.dao.*;

@Controller
public class CompanyModel {
	@RequestMapping("company/com_list.do")
	public String com_list(HttpServletRequest request, HttpServletResponse response) {

		String page=request.getParameter("page");
		if(page==null)
			page="1";
		int curpage=Integer.parseInt(page);
		Map map=new HashMap();
		map.put("start", (curpage*12)-11);
		map.put("end",curpage*12);
		List<CompanyVO> list=CompanyDAO.companyListData(map);
		int totalpage=CompanyDAO.companyTotalPage();
	  
		final int BLOCK=10;
		int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
	  
		if(endPage>totalpage)
			endPage=totalpage;
	  
		request.setAttribute("list", list);
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("main_jsp", "../company/com_list.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("company/com_detail_before.do")
	public String com_detail_before(HttpServletRequest request,HttpServletResponse response)
	{
		String cid=request.getParameter("cid_int");
		Cookie cookie=new Cookie("com_"+cid, cid);
		cookie.setPath("/");
		cookie.setMaxAge(60*60*24);
		// 전송	 
		response.addCookie(cookie);
  
		// 화면 이동 
		return "redirect:com_detail.do?cid="+cid;
	}
	@RequestMapping("company/com_detail.do")
	public String com_detail(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("main_jsp", "../company/com_detail.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("company/com_find.do")
	public String com_find(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("main_jsp", "../company/com_find.jsp");
		return "../main/main.jsp";
	}
}
