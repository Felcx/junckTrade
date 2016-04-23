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
	public Message(MessageId id, String message) {
		super(id, message);
	}

	/** full constructor */
	public Message(MessageId id, String message, Timestamp timeCreate, Boolean isHistory, Timestamp timeUpdate) {
		super(id, message, timeCreate, isHistory, timeUpdate);
	}

}
