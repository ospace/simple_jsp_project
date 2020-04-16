package com.tistory.ospace.simplejsp.util;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;

public class DateUtils {
	private static final String EMPTY = "";
	private static DateTimeFormatter fmtDateTime = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
	
	public static String now() {
		return new Date().toString();
	}
	
	public static String toString(LocalDateTime date) {
		if(null == date) return EMPTY;
		return date.format(fmtDateTime);
	}
	
	public static LocalDateTime toLocalDateTime(String str) {
		if(null == str) return null;
		return LocalDateTime.parse(str, fmtDateTime);
	}
}
