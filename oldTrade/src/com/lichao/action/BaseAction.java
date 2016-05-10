package com.lichao.action;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.google.gson.Gson;
import com.lichao.entity.BaseEntity;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.interceptor.ParameterNameAware;

public class BaseAction extends ActionSupport implements SessionAware,ParameterNameAware{
	public static final Logger mLoger=LogManager.getLogger(BaseAction.class);
    public Map<String,Object> mSession;               //session工具
    public Gson mGson = new Gson();                    //json格式化工具
    public static BaseEntity<Object> mMessage=new BaseEntity<Object>();               //返回值
    ApplicationContext mContext= new ClassPathXmlApplicationContext("applicationContext.xml");;
    public static enum enumSession{
    	user,admin
    }
    private void clearMsg(){
    	mMessage.setCode("0");
    	mMessage.setCount(0);
    	mMessage.setDataset(null);
    	mMessage.setMessage("");
    	mMessage.setTotalCount("0");
    }
    public void errorMessage(String msg){
		mMessage.setMessage(msg);
		mMessage.setCode("-1");
		returnMapJson();
		clearMsg();
	}
    
    public void successMessage(String msg){
		mMessage.setMessage(msg);
		mMessage.setCode("0");
		returnMapJson();
		clearMsg();
	}
    
    public void successMessage(String msg,Object dataSet){
		mMessage.setMessage(msg);
		mMessage.setCode("0");
		mMessage.setDataset(dataSet);
		returnMapJson();
		clearMsg();
	}
    
    /**
	 * 把json格式化的内容返回请求方
	 */
	protected void returnMapJson() {

		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json;charset=UTF-8");
		try {
			response.getWriter().print(mGson.toJson(mMessage));
			mLoger.debug(mGson.toJson(mMessage));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
    
	@Override
	public void setSession(Map<String, Object> arg0) {
		// TODO Auto-generated method stub
		mSession=arg0;
	}
	@Override
	public boolean acceptableParameterName(String parameterName) {
	    
		
		boolean allowedParameterName=true;
		if(parameterName.contains("session")||parameterName.contains("request")){
			allowedParameterName=false;
		}
		return allowedParameterName;
	}

}
