package com.lichao.bean;

import java.sql.Timestamp;

/**
 * AbstractComment entity provides the base persistence definition of the
 * Comment entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractComment implements java.io.Serializable {

	// Fields

	private Integer id;
	private User userByIdTarget;
	private User userByIdAuthor;
	private String message;
	private Boolean isHistory;
	private Timestamp timeCreate;
	private Timestamp timeUpdate;

	// Constructors

	/** default constructor */
	public AbstractComment() {
	}

	/** minimal constructor */
	public AbstractComment(User userByIdTarget, User userByIdAuthor, String message, Boolean isHistory) {
		this.userByIdTarget = userByIdTarget;
		this.userByIdAuthor = userByIdAuthor;
		this.message = message;
		this.isHistory = isHistory;
	}

	/** full constructor */
	public AbstractComment(User userByIdTarget, User userByIdAuthor, String message, Boolean isHistory,
			Timestamp timeCreate, Timestamp timeUpdate) {
		this.userByIdTarget = userByIdTarget;
		this.userByIdAuthor = userByIdAuthor;
		this.message = message;
		this.isHistory = isHistory;
		this.timeCreate = timeCreate;
		this.timeUpdate = timeUpdate;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public User getUserByIdTarget() {
		return this.userByIdTarget;
	}

	public void setUserByIdTarget(User userByIdTarget) {
		this.userByIdTarget = userByIdTarget;
	}

	public User getUserByIdAuthor() {
		return this.userByIdAuthor;
	}

	public void setUserByIdAuthor(User userByIdAuthor) {
		this.userByIdAuthor = userByIdAuthor;
	}

	public String getMessage() {
		return this.message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public Boolean getIsHistory() {
		return this.isHistory;
	}

	public void setIsHistory(Boolean isHistory) {
		this.isHistory = isHistory;
	}

	public Timestamp getTimeCreate() {
		return this.timeCreate;
	}

	public void setTimeCreate(Timestamp timeCreate) {
		this.timeCreate = timeCreate;
	}

	public Timestamp getTimeUpdate() {
		return this.timeUpdate;
	}

	public void setTimeUpdate(Timestamp timeUpdate) {
		this.timeUpdate = timeUpdate;
	}

}