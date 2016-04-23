package com.lichao.bean;

/**
 * MessageId entity. @author MyEclipse Persistence Tools
 */
public class MessageId extends AbstractMessageId implements java.io.Serializable {

	// Constructors

	/** default constructor */
	public MessageId() {
	}

	/** full constructor */
	public MessageId(Integer id, Admin admin) {
		super(id, admin);
	}

}
