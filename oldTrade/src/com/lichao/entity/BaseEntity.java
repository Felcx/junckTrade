package com.lichao.entity;


/**
 * 返回值框架
 * @param <T>
 */
public class BaseEntity<T> {
	private T dataset;
	
	private String message; 
	
	private String code;
	
	private int count;
	
	public String totalCount;
	
	public void setTotalCount(String totalCount) {
		this.totalCount = totalCount;
	}
	public String getTotalCount() {
		return totalCount;
	}
	
	public T getDataset() {
		return dataset;
	}
	public void setDataset(T dataset) {
		this.dataset = dataset;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	/** // 0为成功，其他数值为错误码*/
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
}
