package com.sist.test;
import java.net.*;
public class TestClass {

	public TestClass()
	{
		URL resource=null;
		try {
			resource = getClass().getClassLoader().getResource("../mapper/emp-mapper.xml");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(resource);
		
	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		TestClass test=new TestClass();
	}

}
