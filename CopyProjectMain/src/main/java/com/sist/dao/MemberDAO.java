package com.sist.dao;
import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.vo.*;
import com.sist.commons.*;
public class MemberDAO {
	private static SqlSessionFactory ssf;
	static
	{
		ssf=CreateSqlSessionFactory.getSsf();
	}
	
	public static int memberIdcheck(String email)
	{
		SqlSession session=ssf.openSession();
		int count=session.selectOne("memberIdcheck",email);
		session.close();
		return count;
	}
	public static void memberInsert(MemberVO vo)
	{
		SqlSession session=ssf.openSession(true);
		session.insert("memberInsert",vo);
		session.close();
	}
	public static MemberVO memberLogin(String email,String pwd)
	{
		MemberVO vo=new MemberVO();
		SqlSession session=ssf.openSession();
		int count=session.selectOne("memberIdCheckCount",email);
		if(count==0)
		{
			vo.setMsg("NOID");
		}
		else
		{
			vo=session.selectOne("memberGetPassword",email);
			if(pwd.equals(vo.getPw()))
			{
				vo.setMsg("OK");
			}
			else
			{
				vo.setMsg("NOPWD");
			}
		}
		
		session.close();
		return vo;
	}

}
