package com.lichao.bean;

/**
 * AbstractPhoto entity provides the base persistence definition of the Photo
 * entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractPhoto implements java.io.Serializable {

	// Fields

	private PhotoId id;
	private String name;
	private String photocol;

	// Constructors

	/** default constructor */
	public AbstractPhoto() {
	}

	/** minimal constructor */
	public AbstractPhoto(PhotoId id, String name) {
		this.id = id;
		this.name = name;
	}

	/** full constructor */
	public AbstractPhoto(PhotoId id, String name, String photocol) {
		this.id = id;
		this.name = name;
		this.photocol = photocol;
	}

	// Property accessors

	public PhotoId getId() {
		return this.id;
	}

	public void setId(PhotoId id) {
		this.id = id;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhotocol() {
		return this.photocol;
	}

	public void setPhotocol(String photocol) {
		this.photocol = photocol;
	}

}