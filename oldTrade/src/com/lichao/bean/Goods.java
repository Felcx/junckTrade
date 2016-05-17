package com.lichao.bean;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

import com.lichao.utill.CalendarUtil;

/**
 * Goods entity. @author MyEclipse Persistence Tools
 */
public class Goods extends AbstractGoods implements java.io.Serializable {

	// Constructors
	
	// Constructors
	
		private String currentCreate;
		private String currentState;
		private String currentType;
		public transient static String[] statesStr={"","上架","下架","被限制","已预订","已付款","已发货","已收货","卖家已评价","买家已评价","双方已评价"};
		/** default constructor */

	/** default constructor */
	public Goods() {
	}

	/** minimal constructor */
	public Goods(User userByIdOwner, Types types, String name) {
		super(userByIdOwner, types, name);
	}

	/** full constructor */
	public Goods(User userByIdOwner, Types types, User userByIdBuyer, String name, Timestamp timeCreate,
			Integer timeCanUser, Double price, Double priceNew, String description, Integer state, Integer rangeOld,
			String class_, String goodscol, Set photos) {
		super(userByIdOwner, types, userByIdBuyer, name, timeCreate, timeCanUser, price, priceNew, description, state,
				rangeOld, class_, goodscol, photos);
	}
	
	/**
	 * 设置4个set为空，不然转json时有问题
	 */
	public void setready(){
		setPhotos(new HashSet<String>());
		setCurrentCreate();
		setCurrentState();
		setCurrentType();
	}
	
	public void setready2(){
		setCurrentCreate();
		setCurrentState();
		setCurrentType();
	}

	public String getCurrentCreate() {
		return currentCreate;
	}

	public void setCurrentCreate() {
		if(getTimeCreate()!=null){
			this.currentCreate = CalendarUtil.getDate(getTimeCreate());
		}
	}

	public String getCurrentState() {
		return currentState;
	}

	public void setCurrentState() {
		if(getState()!=null){
		this.currentState = statesStr[getState()];
		}else{
			this.currentState = statesStr[0];
		}
	}

	public String getCurrentType() {
		return currentType;
	}

	public void setCurrentType() {
		
		if(getTypes()!=null){
	    
		this.currentType = getTypes().getName();
		}
	}


}
