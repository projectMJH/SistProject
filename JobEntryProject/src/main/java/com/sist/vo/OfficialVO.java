package com.sist.vo;

import lombok.Data;

/*
 * 
CID        NOT NULL VARCHAR2(10)  
PW         NOT NULL VARCHAR2(10)  
EMAIL      NOT NULL VARCHAR2(30)  
CNAME      NOT NULL VARCHAR2(100) 
NAME       NOT NULL VARCHAR2(51)  
PHONE      NOT NULL VARCHAR2(20)  
BRNUMBER   NOT NULL VARCHAR2(20)  
STATE               NUMBER        
ACCESS_KEY          VARCHAR2(100) 
 */
@Data
public class OfficialVO {
	private int state;
	private String cid,pw,email,cname,name,phone,brnumber,access_key,msg;
}
