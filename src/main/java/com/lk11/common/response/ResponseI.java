package com.lk11.common.response;

public interface ResponseI<T> {

	String getMessage();
	boolean isResult();
	T getData();
	
	ResponseI<T> setMessage(String message);
	ResponseI<T> setResult(boolean result);
	ResponseI<T> setData(T data);
}
