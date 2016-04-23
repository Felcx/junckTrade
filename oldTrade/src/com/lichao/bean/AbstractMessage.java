package com.lichao.bean;

import java.sql.Timestamp;

/**
 * AbstractMessage entity provides the base persistence definition of the
 * Message entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractMessage implements java.io.Serializable {

	// Fields

	private MessageId id;
	private String message;
	private Timestamp timeCreate;
	private Boolean isHistory;
	private Timestamp timeUpdate;

	// Constructors

	/** default constructor */
	public AbstractMessage() {
	}

	/** minimal constructor */
	public AbstractMessage(MessageId id, String message) {
		this.id = id;
		this.message = message;
	}

	/** full constructor */
	public AbstractMessage(MessageId id, String message, Timestamp timeCreate, Boolean isHistory,
			Timestamp timeUpdate) {
		this.id = id;
		this.message = message;
		this.timeCreate = timeCreate;
		this.isHistory = isHistory;
		this.timeUpdate = timeUpdate;
	}

	// Property accessors

	public MessageId getId() {
		return this.id;
	}

	public void setId(MessageId id) {
		this.id = id;
	}

	public String getMessage() {
		return this.message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public Timestamp getTimeCreate() {
		return this.timeCreate;
	}

	public void setTimeCreate(Timestamp timeCreate) {
		this.timeCreate = timeCreate;
	}

	public Boolean getIsHistory() {
		return this.isHistory;
	}

	public void setIsHistory(Boolean isHistory) {
		this.isHistory = isHistory;
	}

	public Timestamp getTimeUpdate() {
		return this.timeUpdate;
	}

	public void setTimeUpdate(Timestamp timeUpdate) {
		this.timeUpdate = timeUpdate;
	}

}