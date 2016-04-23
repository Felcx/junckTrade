package com.lichao.bean;

import java.sql.Timestamp;
import java.util.Set;

/**
 * Goods entity. @author MyEclipse Persistence Tools
 */
public class Goods extends AbstractGoods implements java.io.Serializable {

	// Constructors

	/** default constructor */
	public Goods() {
	}

	/** minimal constructor */
	public Goods(GoodsId id, String name) {
		super(id, name);
	}

	/** full constructor */
	public Goods(GoodsId id, User userByIdBuyer, String name, Timestamp timeCreate, Integer timeCanUser, Double price,
			Double priceNew, String description, Integer state, Integer rangeOld, String class_, String goodscol,
			Set photos) {
		super(id, userByIdBuyer, name, timeCreate, timeCanUser, price, priceNew, description, state, rangeOld, class_,
				goodscol, photos);
	}

}
