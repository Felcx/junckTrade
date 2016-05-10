package com.lichao.action;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.List;

import com.lichao.bean.TypesDAO;
import com.lichao.bean.User;
import com.lichao.bean.UserDAO;
import com.lichao.persistence.PersistenceUser;
import com.lichao.utill.CalendarUtil;
import com.lichao.utill.MD5Util;

public class UserAction extends BaseAction {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private PersistenceUser persistenceLayer = (PersistenceUser) mContext.getBean("persistenceUser");
	private UserDAO userDao=(UserDAO)mContext.getBean("UserDAO");
	private static int helloCount = 0;
	private String authCode;
	private User user;
	private String oldPwd;
	private int pageNo;
	private int pageSize;

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public String execute() throws Exception {
		mLoger.error("app start");
		return SUCCESS;
	}

	/**
	 * 根据id查询用户信息
	 * 
	 * @return
	 * @throws Exception
	 */
	public String findById() throws Exception {
		if (user != null) {
			if (user.getId() != null) {
				User userQuery = userDao.findById(user.getId());
				if (userQuery != null) {
                      userQuery.setready();
					successMessage("查询成功！",userQuery);

				}
			}
		}
		return null;
	}
	
	/**
	 * 补充用户信息
	 * 
	 * @return
	 * @throws Exception
	 */
	public String update() throws Exception {
		if (user != null) {
			if (user.getId() != null) {
				User userQuery = persistenceLayer.findUserById(user.getId());
				if (userQuery != null) {
					        userQuery.setAddress(user.getAddress());
					        userQuery.setPhone(user.getPhone());
					        userQuery.setBankCard(user.getBankCard());
					        userQuery.setEmail(user.getEmail());
					        userQuery.setRealName(user.getRealName());
					        userQuery.setSex(user.getSex());
							persistenceLayer.updateUser(userQuery);
							successMessage("上传用户信息成功！");
					}
			
				}
			
		}
		return null;
	}

	/**
	 * 修改密码
	 * 
	 * @return
	 * @throws Exception
	 */
	public String chuangePwd() throws Exception {
		if (user != null) {
			if (user.getId() != null) {
				User userQuery = persistenceLayer.findUserById(user.getId());
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

	/**
	 * 设置权限
	 * 
	 * @return
	 * @throws Exception
	 */
	public String setPower() throws Exception {
		if (user != null) {
			if (user.getId() != null) {
				User userQuery = persistenceLayer.findUserById(user.getId());
				if (userQuery != null) {
					userQuery.setPower(user.getPower());
					persistenceLayer.updateUser(userQuery);
					successMessage("更新成功！");
				}
			}
		}
		return null;
	}

	/**
	 * 删除用户
	 * 
	 * @return
	 * @throws Exception
	 */
	public String delect() throws Exception {
		if (user != null) {
			if (user.getId() != null) {
				persistenceLayer.deleteUser(user);
				successMessage("删除成功！");
			}
		}
		return null;
	}

	/**
	 * 登出
	 * 
	 * @return
	 * @throws Exception
	 */
	public String logout() throws Exception {
		mSession.remove(BaseAction.enumSession.user.toString());

		return LOGIN;
	}

	/**
	 * 登录
	 * 
	 * @return
	 * @throws Exception
	 */
	public String login() throws Exception {
		if (mSession.get("yanzheng") != null) {
			String authSession = mSession.get("yanzheng").toString();
			if (authSession.equals(authCode)) {
				if (user != null) {
					if (user.getName() != null) {
						List<User> users = persistenceLayer.getUserDAO().findByName(user.getName());
						if (users.size() > 0) {
							if (users.get(0).getPwd().equals(MD5Util.MD5(user.getPwd()))) {
								Timestamp currentTime = new Timestamp(System.currentTimeMillis());
								users.get(0).setTimeCurrent(currentTime);
								persistenceLayer.updateUser(users.get(0));
								successMessage("用户登录成功！");
								users.get(0).setready();

								// user.setCurrentLogin(CalendarUtil.getDate(currentTime));
								mSession.put(BaseAction.enumSession.user.toString(), users.get(0));
							} else {
								errorMessage("用户密码错误！");
								return null;
							}
						} else {
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
	 * 分页查询
	 * 
	 * @return
	 * @throws Exception
	 */
	public String queryAllBySize() throws Exception {

		if (pageNo != 0 && pageSize != 0) {
			StringBuilder builder = new StringBuilder();
			List<User> users = persistenceLayer.getUserDAO().findBySize(pageNo - 1, pageSize);
			// ArrayList<User> tempUsers=new ArrayList<User>();
			for (User cell : users) {
				cell.setready();
			}
			mMessage.setCount(users.size());
			mMessage.setTotalCount(persistenceLayer.getUserDAO().findAll().size() + "");
			successMessage("查询成功", users);
		} else {
			errorMessage("无页号和页大小");
		}
		return null;
	}

	/**
	 * 注册
	 * 
	 * @return
	 * @throws Exception
	 */
	public String insert() throws Exception {

		if (mSession.get("yanzheng") != null) {
			String authSession = mSession.get("yanzheng").toString();
			if (authSession.equals(authCode)) {
				if (user != null) {
					if (user.getName() != null) {
						List<User> users = persistenceLayer.getUserDAO().findByName(user.getName());
						if (users.size() == 0) {
							Timestamp currentTime = new Timestamp(System.currentTimeMillis());
							user.setTimeCreate(currentTime);
							user.setTimeCurrent(currentTime);
							user.setPwd(MD5Util.MD5(user.getPwd()));
							// user.setCurrentLogin(CalendarUtil.getDate(currentTime));
							user.setPower(1);
							user.setRangeBuy(1);
							user.setRangeSell(1);

							persistenceLayer.addUser(user);
							successMessage("注册成功！");
							mSession.put(BaseAction.enumSession.user.toString(), user); // 默认登录
							return null;
						} else {
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

	public int getHelloCount() {
		return helloCount;
	}

	public void setHelloCount(int helloCount) {
		UserAction.helloCount = helloCount;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getAuthCode() {
		return authCode;
	}

	public void setAuthCode(String authCode) {
		this.authCode = authCode;
	}

	public String getOldPwd() {
		return oldPwd;
	}

	public void setOldPwd(String oldPwd) {
		this.oldPwd = oldPwd;
	}

}
