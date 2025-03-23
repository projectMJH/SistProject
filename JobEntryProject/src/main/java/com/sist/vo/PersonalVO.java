package com.sist.vo;
/*
 * 
ID                 NOT NULL VARCHAR2(10)  
PW                 NOT NULL VARCHAR2(10)  
EMAIL              NOT NULL VARCHAR2(30)  
NAME               NOT NULL VARCHAR2(51)  
SEX                         VARCHAR2(8)   
PHONE                       VARCHAR2(20)  
FINDJOB                     VARCHAR2(100) 
ADDR1                       VARCHAR2(200) 
ADDR2                       VARCHAR2(200) 
DESIRED_OCCUPATION          VARCHAR2(100) 
EXPECTED_SALARY             VARCHAR2(100) 
NICKNAME                    VARCHAR2(60)  
ISADMIN            NOT NULL NUMBER        
BIRTH                       VARCHAR2(20)  
POSTER                      VARCHAR2(200)  
 */

import lombok.Data;
@Data
public class PersonalVO {
	private int isadmin;
	private String id,pw,email,name,sex,phone,findjob,addr1,addr2,desired_occupation,expected_salary,nickname,birth,poster;
	private String msg;
}
