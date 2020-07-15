package com.lk11.common.response;

public interface ResponseI<T> {

	String getMessage();
	boolean isSuccess();
	T getData();
	
	ResponseI<T> setMessage(String message);
	ResponseI<T> setSuccess(boolean success);
	ResponseI<T> setData(T data);
}
