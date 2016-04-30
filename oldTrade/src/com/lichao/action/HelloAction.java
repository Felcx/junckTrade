package com.lichao.action;



public class HelloAction extends BaseAction {
	private static int helloCount=0;
	private String userName;
	private String session;

	

	public String execute() throws Exception{
		mLoger.error(session);
		mLoger.error("app start");
		return SUCCESS;
	}
	
	
	
	public String getSession() {
		return session;
	}

	public void setSession(String session) {
		this.session = session;
	}
	
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	
	
	public int getHelloCount() {
		return helloCount;
	}

	public void setHelloCount(int helloCount) {
		HelloAction.helloCount = helloCount;
	}


	
}
