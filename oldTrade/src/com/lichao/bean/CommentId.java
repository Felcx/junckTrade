package com.lichao.bean;

/**
 * CommentId entity. @author MyEclipse Persistence Tools
 */
public class CommentId extends AbstractCommentId implements java.io.Serializable {

	// Constructors

	/** default constructor */
	public CommentId() {
	}

	/** full constructor */
	public CommentId(Integer id, User user, User user_1) {
		super(id, user, user_1);
	}

}
