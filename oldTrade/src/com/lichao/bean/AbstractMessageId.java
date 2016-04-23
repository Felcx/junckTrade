package com.lichao.bean;

/**
 * AbstractMessageId entity provides the base persistence definition of the
 * MessageId entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractMessageId implements java.io.Serializable {

	// Fields

	private Integer id;
	private Admin admin;

	// Constructors

	/** default constructor */
	public AbstractMessageId() {
	}

	/** full constructor */
	public AbstractMessageId(Integer id, Admin admin) {
		this.id = id;
		this.admin = admin;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Admin getAdmin() {
		return this.admin;
	}

	public void setAdmin(Admin admin) {
		this.admin = admin;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof AbstractMessageId))
			return false;
		AbstractMessageId castOther = (AbstractMessageId) other;

		return ((this.getId() == castOther.getId())
				|| (this.getId() != null && castOther.getId() != null && this.getId().equals(castOther.getId())))
				&& ((this.getAdmin() == castOther.getAdmin()) || (this.getAdmin() != null
						&& castOther.getAdmin() != null && this.getAdmin().equals(castOther.getAdmin())));
	}

	public int hashCode() {
		int result = 17;

		result = 37 * result + (getId() == null ? 0 : this.getId().hashCode());
		result = 37 * result + (getAdmin() == null ? 0 : this.getAdmin().hashCode());
		return result;
	}

}