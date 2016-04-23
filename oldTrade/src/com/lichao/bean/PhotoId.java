package com.lichao.bean;

/**
 * PhotoId entity. @author MyEclipse Persistence Tools
 */
public class PhotoId extends AbstractPhotoId implements java.io.Serializable {

	// Constructors

	/** default constructor */
	public PhotoId() {
	}

	/** full constructor */
	public PhotoId(Integer id, Goods goods) {
		super(id, goods);
	}

}
