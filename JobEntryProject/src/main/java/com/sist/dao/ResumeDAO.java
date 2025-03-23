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
			session=ssf.openSession();
			session.insert("resumeInsert",vo);
			if(vo.getPoster()!=null)
			{
				session.update("personalPosterUpdate",vo);
			}
			session.commit();
		}catch(Exception ex)
		{
			ex.printStackTrace();
			session.rollback();
		}
		finally
		{
			if(session!=null)
				session.close();
		}		
	}
	public static List<ResumeVO> resumeListData(String id)
	{
		SqlSession session=null;
		List<ResumeVO> list=null;
		try
		{
			session=ssf.openSession();
			list=session.selectList("resumeListData",id);
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			if(session!=null)
				session.close();
		}	
		return list;
	}
	public static ResumeVO resumeDetailData(int rno)
	{
		SqlSession session=null;
		ResumeVO vo=null;
		try
		{
			session=ssf.openSession();
			vo=session.selectOne("resumeDetailData",rno);
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			if(session!=null)
				session.close();
		}	
		return vo;
	}
	public static void resumeUpdate(ResumeVO vo)
	{
		SqlSession session=null;
		try
		{
			session=ssf.openSession();
			session.update("resumeUpdate",vo);
			if(vo.getPoster()!=null)
			{
				session.update("personalPosterUpdate",vo);
			}
			session.commit();
		}catch(Exception ex)
		{
			ex.printStackTrace();
			session.rollback();
		}
		finally
		{
			if(session!=null)
				session.close();
		}		
	}
	public static void resumeDelete(int rno)
	{
		SqlSession session=null;
		try
		{
			session=ssf.openSession(true);
			session.delete("resumeDelete",rno);
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
	public static int resumeCount(String id)
	{
		SqlSession session=null;
		int count=0;
		try
		{
			session=ssf.openSession();
			count=session.selectOne("resumeCount",id);
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally
		{
			if(session!=null)
				session.close();
		}	
		return count;
	}
}
