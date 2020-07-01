package com.lk11.common.response;

public class ResponseBuilder {
	
	public static <T> ResponseI<T> build() {
		return new DefaultResponse<T>();
	}
}
