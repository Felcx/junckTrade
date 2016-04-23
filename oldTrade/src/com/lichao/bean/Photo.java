package com.lichao.bean;

/**
 * Photo entity. @author MyEclipse Persistence Tools
 */
public class Photo extends AbstractPhoto implements java.io.Serializable {

	// Constructors

	/** default constructor */
	public Photo() {
	}

	/** minimal constructor */
	public Photo(PhotoId id, String name) {
		super(id, name);
	}

	/** full constructor */
	public Photo(PhotoId id, String name, String photocol) {
		super(id, name, photocol);
	}

}
