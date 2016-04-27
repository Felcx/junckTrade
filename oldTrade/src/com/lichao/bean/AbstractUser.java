package com.lichao.bean;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

/**
 * AbstractUser entity provides the base persistence definition of the User
 * entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractUser implements java.io.Serializable {

	// Fields

	private Integer id;
	private String name;
	private String pwd;
	private String phone;
	private String head;
	private Timestamp timeCreate;
	private Timestamp timeCurrent;
	private Integer rangeSell;
	private Integer rangeBuy;
	private Integer power;
	private String bankCard;
	private String email;
	private String realName;
	private String address;
	private Set commentsForIdTarget = new HashSet(0);
	private Set goodsesForIdOwner = new HashSet(0);
	private Set commentsForIdAuthor = new HashSet(0);
	private Set goodsesForIdBuyer = new HashSet(0);

	// Constructors

	/** default constructor */
	public AbstractUser() {
	}

	/** minimal constructor */
	public AbstractUser(String name, String pwd) {
		this.name = name;
		this.pwd = pwd;
	}

	/** full constructor */
	public AbstractUser(String name, String pwd, String phone, String head, Timestamp timeCreate, Timestamp timeCurrent,
			Integer rangeSell, Integer rangeBuy, Integer power, String bankCard, String email, String realName,
			String address, Set commentsForIdTarget, Set goodsesForIdOwner, Set commentsForIdAuthor,
			Set goodsesForIdBuyer) {
		this.name = name;
		this.pwd = pwd;
		this.phone = phone;
		this.head = head;
		this.timeCreate = timeCreate;
		this.timeCurrent = timeCurrent;
		this.rangeSell = rangeSell;
		this.rangeBuy = rangeBuy;
		this.power = power;
		this.bankCard = bankCard;
		this.email = email;
		this.realName = realName;
		this.address = address;
		this.commentsForIdTarget = commentsForIdTarget;
		this.goodsesForIdOwner = goodsesForIdOwner;
		this.commentsForIdAuthor = commentsForIdAuthor;
		this.goodsesForIdBuyer = goodsesForIdBuyer;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPwd() {
		return this.pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getHead() {
		return this.head;
	}

	public void setHead(String head) {
		this.head = head;
	}

	public Timestamp getTimeCreate() {
		return this.timeCreate;
	}

	public void setTimeCreate(Timestamp timeCreate) {
		this.timeCreate = timeCreate;
	}

	public Timestamp getTimeCurrent() {
		return this.timeCurrent;
	}

	public void setTimeCurrent(Timestamp timeCurrent) {
		this.timeCurrent = timeCurrent;
	}

	public Integer getRangeSell() {
		return this.rangeSell;
	}

	public void setRangeSell(Integer rangeSell) {
		this.rangeSell = rangeSell;
	}

	public Integer getRangeBuy() {
		return this.rangeBuy;
	}

	public void setRangeBuy(Integer rangeBuy) {
		this.rangeBuy = rangeBuy;
	}

	public Integer getPower() {
		return this.power;
	}

	public void setPower(Integer power) {
		this.power = power;
	}

	public String getBankCard() {
		return this.bankCard;
	}

	public void setBankCard(String bankCard) {
		this.bankCard = bankCard;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getRealName() {
		return this.realName;
	}

	public void setRealName(String realName) {
		this.realName = realName;
	}

	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Set getCommentsForIdTarget() {
		return this.commentsForIdTarget;
	}

	public void setCommentsForIdTarget(Set commentsForIdTarget) {
		this.commentsForIdTarget = commentsForIdTarget;
	}

	public Set getGoodsesForIdOwner() {
		return this.goodsesForIdOwner;
	}

	public void setGoodsesForIdOwner(Set goodsesForIdOwner) {
		this.goodsesForIdOwner = goodsesForIdOwner;
	}

	public Set getCommentsForIdAuthor() {
		return this.commentsForIdAuthor;
	}

	public void setCommentsForIdAuthor(Set commentsForIdAuthor) {
		this.commentsForIdAuthor = commentsForIdAuthor;
	}

	public Set getGoodsesForIdBuyer() {
		return this.goodsesForIdBuyer;
	}

	public void setGoodsesForIdBuyer(Set goodsesForIdBuyer) {
		this.goodsesForIdBuyer = goodsesForIdBuyer;
	}

	@Override
	public String toString() {
		return "AbstractUser [id=" + id + ", name=" + name + ", pwd=" + pwd + ", phone=" + phone + ", head=" + head
				+ ", timeCreate=" + timeCreate + ", timeCurrent=" + timeCurrent + ", rangeSell=" + rangeSell
				+ ", rangeBuy=" + rangeBuy + ", power=" + power + ", bankCard=" + bankCard + ", email=" + email
				+ ", realName=" + realName + ", address=" + address + ", commentsForIdTarget=" + commentsForIdTarget
				+ ", goodsesForIdOwner=" + goodsesForIdOwner + ", commentsForIdAuthor=" + commentsForIdAuthor
				+ ", goodsesForIdBuyer=" + goodsesForIdBuyer + "]";
	}

}