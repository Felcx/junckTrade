package com.lichao.action;

import java.sql.Timestamp;
import java.util.List;

import com.lichao.bean.Types;
import com.lichao.bean.TypesDAO;
import com.lichao.bean.User;

public class TypeAction extends BaseAction {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String authCode;
	private Types type;
	private int pageNo;   
	private int pageSize;

	public Types getUser() {
		return type;
	}

	public void setUser(Types type) {
		this.type = type;
	}

	public String execute() throws Exception {
		mLoger.error("app start");
		return SUCCESS;
	}
	
	
	/**
	 * 查询全部类型
	 * @return
	 * @throws Exception
	 */
	public String queryAll() throws Exception {
		
			List<Types> users = typeDao.findAll();
		   for(Types cell:users){
			   cell.setready();
		   }
			successMessage("查询成功", users);
		
		return null;
	}
	
	/**
	 * 分页查询
	 * @return
	 * @throws Exception
	 */
	public String queryAllBySize() throws Exception {
		
		if(pageNo!=0&&pageSize!=0){
			List<Types> users = typeDao.findBySize(pageNo-1, pageSize);
		   for(Types cell:users){
			   cell.setready();
		   }
		    mMessage.setCount(users.size());
		    mMessage.setTotalCount(typeDao.findAll().size()+"");
			successMessage("查询成功", users);
		}else{
			errorMessage("无页号和页大小");
		}
		return null;
	}
	

	

	/**
	 * 删除类型
	 * @return
	 * @throws Exception
	 */
	public String delect() throws Exception {
		   if (type != null) {
				if (type.getId() != null) {
				    typeDao.delete(type);
				    successMessage("删除成功！");
				}
			}
		return null;
	}
	
	TypesDAO typeDao=(TypesDAO)mContext.getBean("TypesDAO");
	/**
	 * 添加
	 * @return
	 * @throws Exception
	 */
	public String insert() throws Exception {
		
				if (type != null) {
					if (type.getName() != null) {
						List<Types> users = typeDao.findByName(type.getName());
						if (users.size() == 0) {
							Timestamp currentTime=new Timestamp(System.currentTimeMillis());
							type.setTimeCreate(currentTime);
							
							typeDao.save(type);
							successMessage("添加成功！");
							return null;
						}else{
							errorMessage("此类型已添加！");
							return null;
						}
					}
				}
		return null;
	}



	public String getAuthCode() {
		return authCode;
	}

	public void setAuthCode(String authCode) {
		this.authCode = authCode;
	}
	public Types getType() {
		return type;
	}

	public void setType(Types type) {
		this.type = type;
	}

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

}
