package com.lichao.bean;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

/**
 * AbstractTypes entity provides the base persistence definition of the Types
 * entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractTypes implements java.io.Serializable {

	// Fields

	private Integer id;
	private String name;
	private Timestamp timeCreate;
	private Integer isShowFirst;
	private Set goodses = new HashSet(0);

	// Constructors

	/** default constructor */
	public AbstractTypes() {
	}

	/** minimal constructor */
	public AbstractTypes(String name) {
		this.name = name;
	}

	/** full constructor */
	public AbstractTypes(String name, Timestamp timeCreate, Integer isShowFirst, Set goodses) {
		this.name = name;
		this.timeCreate = timeCreate;
		this.isShowFirst = isShowFirst;
		this.goodses = goodses;
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

	public Timestamp getTimeCreate() {
		return this.timeCreate;
	}

	public void setTimeCreate(Timestamp timeCreate) {
		this.timeCreate = timeCreate;
	}

	public Integer getIsShowFirst() {
		return this.isShowFirst;
	}

	public void setIsShowFirst(Integer isShowFirst) {
		this.isShowFirst = isShowFirst;
	}

	public Set getGoodses() {
		return this.goodses;
	}

	public void setGoodses(Set goodses) {
		this.goodses = goodses;
	}

}