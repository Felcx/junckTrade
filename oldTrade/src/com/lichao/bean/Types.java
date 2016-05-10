package com.lichao.bean;

import java.sql.Timestamp;
import java.util.Set;

import com.lichao.utill.CalendarUtil;

/**
 * Types entity. @author MyEclipse Persistence Tools
 */
public class Types extends AbstractTypes implements java.io.Serializable {

	// Constructors

	private String currentCreate;
	
	/** default constructor */
	public Types() {
	}

	/** minimal constructor */
	public Types(String name) {
		super(name);
	}

	/** full constructor */
	public Types(String name, Timestamp timeCreate, Integer isShowFirst, Set goodses) {
		super(name, timeCreate, isShowFirst, goodses);
	}

	
	/**
	 * 设置4个set为空，不然转json时有问题
	 */
	public void setready(){
		setGoodses(null);
		setCurrentCreate();
	}

	public String getCurrentCreate() {
		return currentCreate;
	}

	public void setCurrentCreate() {
		if(getTimeCreate()!=null){
			this.currentCreate = CalendarUtil.getDate(getTimeCreate());
		}
	}
}
