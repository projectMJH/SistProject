package com.sist.dao;
import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.vo.*;
import com.sist.commons.*;
/*
	SqlSession session=null;
try
{
	session=ssf.openSession();
}catch(Exception ex)
{
	ex.printStackTrace();
}
finally
{
	if(session!=null)
		session.close();
}
*/
public class ResumeDAO {
	private static SqlSessionFactory ssf;
	static
	{
		ssf=CreateSqlSessionFactory.getSsf();
	}
	
	public static void resumeInsert(ResumeVO vo)
	{
		SqlSession session=null;
		try
		{
			session=ssf.openSession(true);
			session.insert("resumeInsert",vo);
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			if(session!=null)
				session.close();
		}		
	}
	public static void resumeUpdate(ResumeVO vo)
	{
		SqlSession session=null;
		try
		{
			session=ssf.openSession(true);
			session.update("resumeUpdate",vo);
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			if(session!=null)
				session.close();
		}		
	}
}
