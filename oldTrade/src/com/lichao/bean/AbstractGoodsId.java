package com.lichao.bean;

/**
 * AbstractGoodsId entity provides the base persistence definition of the
 * GoodsId entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractGoodsId implements java.io.Serializable {

	// Fields

	private Integer id;
	private User user;
	private Types types;

	// Constructors

	/** default constructor */
	public AbstractGoodsId() {
	}

	/** full constructor */
	public AbstractGoodsId(Integer id, User user, Types types) {
		this.id = id;
		this.user = user;
		this.types = types;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Types getTypes() {
		return this.types;
	}

	public void setTypes(Types types) {
		this.types = types;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof AbstractGoodsId))
			return false;
		AbstractGoodsId castOther = (AbstractGoodsId) other;

		return ((this.getId() == castOther.getId())
				|| (this.getId() != null && castOther.getId() != null && this.getId().equals(castOther.getId())))
				&& ((this.getUser() == castOther.getUser()) || (this.getUser() != null && castOther.getUser() != null
						&& this.getUser().equals(castOther.getUser())))
				&& ((this.getTypes() == castOther.getTypes()) || (this.getTypes() != null
						&& castOther.getTypes() != null && this.getTypes().equals(castOther.getTypes())));
	}

	public int hashCode() {
		int result = 17;

		result = 37 * result + (getId() == null ? 0 : this.getId().hashCode());
		result = 37 * result + (getUser() == null ? 0 : this.getUser().hashCode());
		result = 37 * result + (getTypes() == null ? 0 : this.getTypes().hashCode());
		return result;
	}

}