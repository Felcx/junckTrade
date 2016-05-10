package com.lichao.bean;

import java.sql.Timestamp;
import java.util.Set;

import com.lichao.utill.CalendarUtil;

/**
 * Admin entity. @author MyEclipse Persistence Tools
 */
public class Admin extends AbstractAdmin implements java.io.Serializable {

	// Constructors

	private String currentLogin;
	
	/** default constructor */
	public Admin() {
	}

	/** full constructor */
	public Admin(String name, String pwd, String head, Timestamp timeCreate, Timestamp timeCurrent, Set messages) {
		super(name, pwd, head, timeCreate, timeCurrent, messages);
	}
	
	public String getCurrentLogin() {
		return currentLogin;
	}
	
	public void getReady(){
		setMessages(null);
		setCurrentLogin();
	}

	public void setCurrentLogin() {
		if(getTimeCurrent()!=null){
			this.currentLogin = CalendarUtil.getDate(getTimeCurrent());
		}
	}

}
