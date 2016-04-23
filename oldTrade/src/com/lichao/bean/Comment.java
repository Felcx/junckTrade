package com.lichao.bean;

import java.sql.Timestamp;

/**
 * Comment entity. @author MyEclipse Persistence Tools
 */
public class Comment extends AbstractComment implements java.io.Serializable {

	// Constructors

	/** default constructor */
	public Comment() {
	}

	/** minimal constructor */
	public Comment(CommentId id, String message, Boolean isHistory) {
		super(id, message, isHistory);
	}

	/** full constructor */
	public Comment(CommentId id, String message, Boolean isHistory, Timestamp timeCreate, Timestamp timeUpdate) {
		super(id, message, isHistory, timeCreate, timeUpdate);
	}

}
