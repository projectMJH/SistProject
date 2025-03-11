package com.sist.vo;
/*
 * 
ID                 NOT NULL VARCHAR2(10)  
PW                 NOT NULL VARCHAR2(10)  
EMAIL              NOT NULL VARCHAR2(30)  
NAME               NOT NULL VARCHAR2(51)  
SEX                         VARCHAR2(8)   
BIRTH                       VARCHAR2(20)          
PHONE                       VARCHAR2(20)  
FINDJOB                     VARCHAR2(100) 
ADDR1                       VARCHAR2(200) 
ADDR2                       VARCHAR2(200) 
DESIRED_OCCUPATION          VARCHAR2(100) 
EXPECTED_SALARY             VARCHAR2(100) 
POSTER                      VARCHAR2(200) 
NICKNAME                    VARCHAR2(60)  
ISADMIN            NOT NULL NUMBER    
 */

import lombok.Data;
@Data
public class MemberVO {
	private String id,pw,email,name,sex,birth,addr1,addr2,phone,isadmin,msg;
}
