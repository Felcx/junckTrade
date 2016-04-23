package com.lichao.bean;

/**
 * AbstractPhotoId entity provides the base persistence definition of the
 * PhotoId entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractPhotoId implements java.io.Serializable {

	// Fields

	private Integer id;
	private Goods goods;

	// Constructors

	/** default constructor */
	public AbstractPhotoId() {
	}

	/** full constructor */
	public AbstractPhotoId(Integer id, Goods goods) {
		this.id = id;
		this.goods = goods;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Goods getGoods() {
		return this.goods;
	}

	public void setGoods(Goods goods) {
		this.goods = goods;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof AbstractPhotoId))
			return false;
		AbstractPhotoId castOther = (AbstractPhotoId) other;

		return ((this.getId() == castOther.getId())
				|| (this.getId() != null && castOther.getId() != null && this.getId().equals(castOther.getId())))
				&& ((this.getGoods() == castOther.getGoods()) || (this.getGoods() != null
						&& castOther.getGoods() != null && this.getGoods().equals(castOther.getGoods())));
	}

	public int hashCode() {
		int result = 17;

		result = 37 * result + (getId() == null ? 0 : this.getId().hashCode());
		result = 37 * result + (getGoods() == null ? 0 : this.getGoods().hashCode());
		return result;
	}

}