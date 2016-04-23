package com.lichao.bean;

/**
 * GoodsId entity. @author MyEclipse Persistence Tools
 */
public class GoodsId extends AbstractGoodsId implements java.io.Serializable {

	// Constructors

	/** default constructor */
	public GoodsId() {
	}

	/** full constructor */
	public GoodsId(Integer id, User user, Types types) {
		super(id, user, types);
	}

}
