package com.lichao.bean;

import java.sql.Timestamp;

/**
 * Message entity. @author MyEclipse Persistence Tools
 */
public class Message extends AbstractMessage implements java.io.Serializable {

	// Constructors

	/** default constructor */
	public Message() {
	}

	/** minimal constructor */
	public Message(Admin admin, String message) {
		super(admin, message);
	}

	/** full constructor */
	public Message(Admin admin, String message, Timestamp timeCreate, Boolean isHistory, Timestamp timeUpdate) {
		super(admin, message, timeCreate, isHistory, timeUpdate);
	}

}
