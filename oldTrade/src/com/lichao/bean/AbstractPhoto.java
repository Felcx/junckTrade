package com.lichao.bean;

/**
 * AbstractPhoto entity provides the base persistence definition of the Photo
 * entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractPhoto implements java.io.Serializable {

	// Fields

	private Integer id;
	private Goods goods;
	private String name;
	private String photocol;

	// Constructors

	/** default constructor */
	public AbstractPhoto() {
	}

	/** minimal constructor */
	public AbstractPhoto(Goods goods, String name) {
		this.goods = goods;
		this.name = name;
	}

	/** full constructor */
	public AbstractPhoto(Goods goods, String name, String photocol) {
		this.goods = goods;
		this.name = name;
		this.photocol = photocol;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Goods getGoods() {
		return this.goods;
	}

	public void setGoods(Goods goods) {
		this.goods = goods;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhotocol() {
		return this.photocol;
	}

	public void setPhotocol(String photocol) {
		this.photocol = photocol;
	}

}