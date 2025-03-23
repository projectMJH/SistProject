package com.sist.vo;
/*
 * RNO        NOT NULL NUMBER        
ID         NOT NULL VARCHAR2(10)  
NAME       NOT NULL VARCHAR2(51)  
EMAIL      NOT NULL VARCHAR2(30)  
PHONE      NOT NULL VARCHAR2(20)  
BIRTH      NOT NULL DATE          
DISCLOSURE          VARCHAR2(8)   
SCHOLAR             CLOB          
SKILL               CLOB          
CARREER             CLOB          
SELF_INTRO          CLOB          
TITLE               VARCHAR2(100) 
ISBASIC             CHAR(1) 

 */
import java.util.*;

import lombok.Data;
@Data
public class ResumeVO {
	private int rno;
	private String id,name,email,phone,birth,disclosure,scholar,skill,carreer,self_intro,title;
	private String address,sex,poster;
	private char isbasic;
}
