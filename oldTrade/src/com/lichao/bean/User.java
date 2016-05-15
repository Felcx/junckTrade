package com.lichao.bean;

import java.sql.Timestamp;
import java.util.Set;

import com.lichao.utill.CalendarUtil;

/**
 * User entity. @author MyEclipse Persistence Tools
 */
public class User extends AbstractUser implements java.io.Serializable {

	// Constructors
	private String currentLogin;
	private String currentCreate;
	private String rangeBuyCn;
	private String rangeSellCn;
	private String powerCn;
	public transient static String[] rangeBuys={"青铜","白银","黄金","钻石"};
	public transient static String[] powers={" ","可买卖","只可买","只可卖","功能被限制"};

	/** default constructor */
	public User() {
	}

	/** minimal constructor */
	public User(String name, String pwd) {
		super(name, pwd);
	}

	/** full constructor */
	public User(String name, String pwd, String phone, String head, Timestamp timeCreate, Timestamp timeCurrent,
			Integer rangeSell, Integer rangeBuy, Integer power, String bankCard, String email, String realName,
			String address,String sex, Set commentsForIdTarget, Set goodsesForIdOwner, Set commentsForIdAuthor,
			Set goodsesForIdBuyer, Set shellsForIdBuy, Set shellsForIdSell) {
		super(name, pwd, phone, head, timeCreate, timeCurrent, rangeSell, rangeBuy, power, bankCard, email, realName, address, sex, commentsForIdTarget, goodsesForIdOwner, commentsForIdAuthor, goodsesForIdBuyer, shellsForIdBuy, shellsForIdSell);
	}
	
	/**
	 * 设置4个set为空，不然转json时有问题
	 */
	public void setready(){
		setCommentsForIdAuthor(null);
		setCommentsForIdTarget(null);
		setGoodsesForIdBuyer(null);
		setGoodsesForIdOwner(null);
		setShellsForIdBuy(null);
		setShellsForIdSell(null);
		setRangeBuyCn();
		setRangeSellCn();
		setCurrentLogin();
		setCurrentCreate();
		setPowerCn();
	}

	/**
	 * 最近登录时间转译
	 * @return
	 */
	public String getCurrentLogin() {
		if(getTimeCurrent()!=null){
		return CalendarUtil.getDate(getTimeCurrent());
		}else{
			return "";
		}
	}

	public void setCurrentLogin() {
		if(getTimeCurrent()!=null){
			this.currentLogin = CalendarUtil.getDate(getTimeCurrent());
		}
	}

	@Override
	public User clone() {
		User o = null;
		try {
			o = (User) super.clone();
		} catch (CloneNotSupportedException e) {
			e.printStackTrace();
		}
		return o;
	}

	public String getRangeBuyCn() {
		return rangeBuyCn;
	}

	public void setRangeBuyCn() {         //1-9为青铜，10-19为白银，20-29为黄金，30以上为钻石
		if(getRangeBuy()>=40){
			this.rangeBuyCn = rangeBuys[3];
		}else{
		this.rangeBuyCn = rangeBuys[getRangeBuy()/10];
		}
	}

	public String getRangeSellCn() {
		return rangeSellCn;
	}

	public void setRangeSellCn() {
		if(getRangeBuy()>=40){
			this.rangeSellCn = rangeBuys[3];
		}else{
		this.rangeSellCn = rangeBuys[getRangeSell()/10];
		}
	}

	public String getPowerCn() {
		return powerCn;
	}

	public void setPowerCn() {
		this.powerCn = powers[getPower()];
	}

	public String getCurrentCreate() {
		return currentCreate;
	}

	public void setCurrentCreate() {
		this.currentCreate = CalendarUtil.getDate(getTimeCreate());
	}

}
