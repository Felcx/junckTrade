package com.lichao.bean;

import java.sql.Timestamp;
import java.util.Set;

/**
 * User entity. @author MyEclipse Persistence Tools
 */
public class User extends AbstractUser implements java.io.Serializable {

	// Constructors

	/** default constructor */
	public User() {
	}

	/** minimal constructor */
	public User(String name, String pwd) {
		super(name, pwd);
	}

	/** full constructor */
	public User(String name, String pwd, String phone, String head, Timestamp timeCreate, Timestamp timeCurrent,
			Integer rangeSell, Integer rangeBuy, Integer power, String bankCard, String email, String realName,
			String address, Set commentsForIdTarget, Set goodsesForIdOwner, Set commentsForIdAuthor,
			Set goodsesForIdBuyer) {
		super(name, pwd, phone, head, timeCreate, timeCurrent, rangeSell, rangeBuy, power, bankCard, email, realName,
				address, commentsForIdTarget, goodsesForIdOwner, commentsForIdAuthor, goodsesForIdBuyer);
	}

}
