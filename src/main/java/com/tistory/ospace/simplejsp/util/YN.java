package com.tistory.ospace.simplejsp.util;

public enum YN {
	YES("Y", "사용"), NO("N", "미사용");
	
	public final String name;
	public final String value;
	
	private YN(String name, String value) {
		this.name = name;
		this.value = value;
	}
	
	public String getName() {
		return name;
	}
	public String getValue() {
		return value;
	}
}
