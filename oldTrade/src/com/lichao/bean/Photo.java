package com.lichao.bean;

/**
 * Photo entity. @author MyEclipse Persistence Tools
 */
public class Photo extends AbstractPhoto implements java.io.Serializable {

	// Constructors

	/** default constructor */
	public Photo() {
	}

	/** minimal constructor */
	public Photo(Goods goods, String name) {
		super(goods, name);
	}

	/** full constructor */
	public Photo(Goods goods, String name, String photocol) {
		super(goods, name, photocol);
	}

}
