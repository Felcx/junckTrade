package com.lichao.bean;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

/**
 * AbstractGoods entity provides the base persistence definition of the Goods
 * entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractGoods implements java.io.Serializable {

	// Fields

	private GoodsId id;
	private User userByIdBuyer;
	private String name;
	private Timestamp timeCreate;
	private Integer timeCanUser;
	private Double price;
	private Double priceNew;
	private String description;
	private Integer state;
	private Integer rangeOld;
	private String class_;
	private String goodscol;
	private Set photos = new HashSet(0);

	// Constructors

	/** default constructor */
	public AbstractGoods() {
	}

	/** minimal constructor */
	public AbstractGoods(GoodsId id, String name) {
		this.id = id;
		this.name = name;
	}

	/** full constructor */
	public AbstractGoods(GoodsId id, User userByIdBuyer, String name, Timestamp timeCreate, Integer timeCanUser,
			Double price, Double priceNew, String description, Integer state, Integer rangeOld, String class_,
			String goodscol, Set photos) {
		this.id = id;
		this.userByIdBuyer = userByIdBuyer;
		this.name = name;
		this.timeCreate = timeCreate;
		this.timeCanUser = timeCanUser;
		this.price = price;
		this.priceNew = priceNew;
		this.description = description;
		this.state = state;
		this.rangeOld = rangeOld;
		this.class_ = class_;
		this.goodscol = goodscol;
		this.photos = photos;
	}

	// Property accessors

	public GoodsId getId() {
		return this.id;
	}

	public void setId(GoodsId id) {
		this.id = id;
	}

	public User getUserByIdBuyer() {
		return this.userByIdBuyer;
	}

	public void setUserByIdBuyer(User userByIdBuyer) {
		this.userByIdBuyer = userByIdBuyer;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Timestamp getTimeCreate() {
		return this.timeCreate;
	}

	public void setTimeCreate(Timestamp timeCreate) {
		this.timeCreate = timeCreate;
	}

	public Integer getTimeCanUser() {
		return this.timeCanUser;
	}

	public void setTimeCanUser(Integer timeCanUser) {
		this.timeCanUser = timeCanUser;
	}

	public Double getPrice() {
		return this.price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public Double getPriceNew() {
		return this.priceNew;
	}

	public void setPriceNew(Double priceNew) {
		this.priceNew = priceNew;
	}

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Integer getState() {
		return this.state;
	}

	public void setState(Integer state) {
		this.state = state;
	}

	public Integer getRangeOld() {
		return this.rangeOld;
	}

	public void setRangeOld(Integer rangeOld) {
		this.rangeOld = rangeOld;
	}

	public String getClass_() {
		return this.class_;
	}

	public void setClass_(String class_) {
		this.class_ = class_;
	}

	public String getGoodscol() {
		return this.goodscol;
	}

	public void setGoodscol(String goodscol) {
		this.goodscol = goodscol;
	}

	public Set getPhotos() {
		return this.photos;
	}

	public void setPhotos(Set photos) {
		this.photos = photos;
	}

}