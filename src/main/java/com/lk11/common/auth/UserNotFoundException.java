package com.lk11.common.auth;

public class UserNotFoundException extends Exception {

	/**
	 * 
	 */
	private static final long serialVersionUID = -4225352253502335703L;
	
	public UserNotFoundException(String message) {
		super(message);
	}
}
