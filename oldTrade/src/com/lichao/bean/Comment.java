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
	public Comment(User userByIdTarget, User userByIdAuthor, String message, Boolean isHistory) {
		super(userByIdTarget, userByIdAuthor, message, isHistory);
	}

	/** full constructor */
	public Comment(User userByIdTarget, User userByIdAuthor, String message, Boolean isHistory, Timestamp timeCreate,
			Timestamp timeUpdate) {
		super(userByIdTarget, userByIdAuthor, message, isHistory, timeCreate, timeUpdate);
	}

}
