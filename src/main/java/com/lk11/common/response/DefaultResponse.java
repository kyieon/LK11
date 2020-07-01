package com.lk11.common.response;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

public class DefaultResponse<T> implements ResponseI<T> {

	private String message;
	private boolean result = true;
	private T data;
	
	public String getMessage() {
		return message;
	}
	
	@Override
	public ResponseI<T> setMessage(String message) {
		this.message = message;
		return this;
	}

	@Override
	public boolean isResult() {
		return result;
	}
	
	@Override
	public ResponseI<T> setResult(boolean result) {
		this.result = result;
		return this;
	}

	@Override
	public T getData() {
		return data; 
	}

	@Override
	public ResponseI<T> setData(T data) {
		this.data = data;
		return this;
	}
	
	@Override
	public String toString() {
		ObjectMapper mapper = new ObjectMapper();
		try {
			return mapper.writeValueAsString(this);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		return "";
	}
}