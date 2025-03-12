package com.sist.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.commons.*;
import com.sist.vo.*;

public class OfficialDAO {
	private static SqlSessionFactory ssf;
	static
	{
		ssf=CreateSqlSessionFactory.getSsf();
	}
	
	public static int officialIdcheck(String email)
	{
		SqlSession session=ssf.openSession();
		int count=session.selectOne("officialIdcheck",email);
		session.close();
		return count;
	}
	public static void officialInsert(OfficialVO vo)
	{
		SqlSession session=ssf.openSession(true);
		session.insert("officialInsert",vo);
		session.close();
	}
	public static OfficialVO officialLogin(String email,String pwd)
	{
		OfficialVO vo=new OfficialVO();
		SqlSession session=ssf.openSession();
		int count=session.selectOne("officialIdCheckCount",email);
		if(count==0)
		{
			vo.setMsg("NOID");
		}
		else
		{
			vo=session.selectOne("officialGetPassword",email);
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
