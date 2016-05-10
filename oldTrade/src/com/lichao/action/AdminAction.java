package com.lichao.action;

import java.sql.Timestamp;
import java.util.List;

import com.lichao.bean.Admin;
import com.lichao.bean.Message;
import com.lichao.bean.MessageDAO;
import com.lichao.bean.User;
import com.lichao.persistence.PersistenceAdmin;
import com.lichao.persistence.PersistenceUser;
import com.lichao.utill.CalendarUtil;
import com.lichao.utill.MD5Util;

public class AdminAction extends BaseAction {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String authCode;
	private Admin user;
	private Message message;
	private int authId;
	private MessageDAO messageDao = (MessageDAO) mContext.getBean("MessageDAO");
	private PersistenceAdmin persistenceLayer = (PersistenceAdmin) mContext.getBean("persistenceAdmin");
	private String oldPwd;
	
	/**
	 * 修改密码
	 * 
	 * @return
	 * @throws Exception
	 */
	public String chuangePwd() throws Exception {
		if (user != null) {
			if (user.getId() != null) {
				Admin userQuery = persistenceLayer.findUserById(user.getId());
				if (userQuery != null) {
					if (oldPwd != null) {
						String pwd = MD5Util.MD5(oldPwd);
						if (userQuery.getPwd().equals(pwd)) {
							userQuery.setPwd(MD5Util.MD5(user.getPwd()));
							persistenceLayer.updateUser(userQuery);
							successMessage("更改密码成功！");
						} else {
							errorMessage("输入的密码不正确！");
						}
					}

				}
			}
		}
		return null;
	}
	
	public Admin getUser() {
		return user;
	}

	public void setUser(Admin user) {
		this.user = user;
	}

	public String execute() throws Exception {
		mLoger.error("app start");
		return SUCCESS;
	}
	
	/**
	 * logout
	 * @return
	 * @throws Exception
	 */
	public String logout() throws Exception {
		   mSession.remove(BaseAction.enumSession.admin.toString());
		   
		return LOGIN;
	}
	
	/**
	 * 发布或更新公告
	 * @return
	 * @throws Exception
	 */
	public String notice() throws Exception {
		if(message!=null){
			if(message.getMessage()!=null){
				List<Message> messages=messageDao.findAll();
				if(messages!=null && messages.size()!=0){
					messages.get(0).setMessage(message.getMessage());
					messages.get(0).setTimeUpdate(new Timestamp(System.currentTimeMillis()));
					messageDao.merge(messages.get(0));
				}else{
					message.setTimeCreate(new Timestamp(System.currentTimeMillis()));
					message.setTimeUpdate(new Timestamp(System.currentTimeMillis()));
					Admin admin=new Admin();
					admin.setId(authId);
					message.setAdmin(admin);
					messageDao.save(message);
				}
				successMessage("发布成功！");
			}
		}
		return null;
	}
	
	public int getAuthId() {
		return authId;
	}

	public void setAuthId(int authId) {
		this.authId = authId;
	}

	/**
	 * 读取公告
	 * @return
	 * @throws Exception
	 */
	public String readNotice() throws Exception {
		List<Message> messages=messageDao.findAll();
		if(messages!=null && messages.size()!=0){
			messages.get(0).setAdmin(null);
			successMessage("读取成功", messages.get(0));
		}
		return null;
	}
	
	/**
	 * 登录
	 * @return
	 * @throws Exception
	 */
	public String login() throws Exception {
		if (mSession.get("yanzheng") != null) {
			String authSession = mSession.get("yanzheng").toString();
			if (authSession.equals(authCode)) {
				if (user != null) {
					
					if (user.getName() != null) {
						List<Admin> users = persistenceLayer.getUserDAO().findByName(user.getName());
						if(users.size()>0){
							if(users.get(0).getPwd().equals(MD5Util.MD5(user.getPwd()) )){
								Timestamp currentTime=new Timestamp(System.currentTimeMillis());
								users.get(0).setTimeCurrent(currentTime);
								persistenceLayer.updateUser(users.get(0));
								successMessage("用户登录成功！");
								users.get(0).getReady();
								mSession.put(BaseAction.enumSession.admin.toString(), users.get(0));
							}else{
								errorMessage("用户密码错误！");
								return null;
							}
						}else{
							errorMessage("无此用户！");
							return null;
						}
					}
				}
			} else {
				errorMessage("验证码错误！");
				return null;
			}
		} else {
			errorMessage("请输入验证码");
			return null;
		}
		return null;
	}

	/**
	 * 注册
	 * @return
	 * @throws Exception
	 */
	public String insert() throws Exception {
		
		if (mSession.get("yanzheng") != null) {
			String authSession = mSession.get("yanzheng").toString();
			if (authSession.equals(authCode)) {
				if (user != null) {
					if (user.getName() != null) {
						List<Admin> users = persistenceLayer.getUserDAO().findByName(user.getName());
						if (users.size() == 0) {
							Timestamp currentTime=new Timestamp(System.currentTimeMillis());
							user.setTimeCreate(currentTime);
							user.setTimeCurrent(currentTime);
							user.setPwd(MD5Util.MD5(user.getPwd()));
							//user.setCurrentLogin(CalendarUtil.getDate(currentTime));
							
							persistenceLayer.addUser(user);
							successMessage("注册成功！");
							mSession.put(BaseAction.enumSession.admin.toString(), user); //默认登录
							return null;
						}else{
							errorMessage("用户名已被占用！");
							return null;
						}
					}
				}
			} else {
				errorMessage("验证码错误！");
				return null;
			}
		} else {
			errorMessage("请输入验证码");
			return null;
		}
		return null;
	}



	public String getAuthCode() {
		return authCode;
	}

	public void setAuthCode(String authCode) {
		this.authCode = authCode;
	}

	public Message getMessage() {
		return message;
	}

	public void setMessage(Message message) {
		this.message = message;
	}

	public String getOldPwd() {
		return oldPwd;
	}

	public void setOldPwd(String oldPwd) {
		this.oldPwd = oldPwd;
	}

}
