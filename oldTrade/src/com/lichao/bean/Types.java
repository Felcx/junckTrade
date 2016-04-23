package com.lichao.bean;

import java.sql.Timestamp;
import java.util.Set;

/**
 * Types entity. @author MyEclipse Persistence Tools
 */
public class Types extends AbstractTypes implements java.io.Serializable {

	// Constructors

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

}
