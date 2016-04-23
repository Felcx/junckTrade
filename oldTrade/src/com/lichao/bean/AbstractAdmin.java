package com.lichao.bean;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

/**
 * AbstractAdmin entity provides the base persistence definition of the Admin
 * entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractAdmin implements java.io.Serializable {

	// Fields

	private Integer id;
	private String name;
	private String pwd;
	private String head;
	private Timestamp timeCreate;
	private Timestamp timeCurrent;
	private Set typeses = new HashSet(0);
	private Set messages = new HashSet(0);

	// Constructors

	/** default constructor */
	public AbstractAdmin() {
	}

	/** full constructor */
	public AbstractAdmin(String name, String pwd, String head, Timestamp timeCreate, Timestamp timeCurrent, Set typeses,
			Set messages) {
		this.name = name;
		this.pwd = pwd;
		this.head = head;
		this.timeCreate = timeCreate;
		this.timeCurrent = timeCurrent;
		this.typeses = typeses;
		this.messages = messages;
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

	public Set getTypeses() {
		return this.typeses;
	}

	public void setTypeses(Set typeses) {
		this.typeses = typeses;
	}

	public Set getMessages() {
		return this.messages;
	}

	public void setMessages(Set messages) {
		this.messages = messages;
	}

}