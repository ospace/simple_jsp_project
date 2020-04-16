package com.tistory.ospace.simplejsp.util;

import java.io.IOException;
import java.io.StringWriter;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.SimpleTagSupport;

public class TitleTag extends SimpleTagSupport {
	private String message = null;
	
	public void setMessage(String message) {
		this.message = message;
	}
	
	public void doTag() throws JspException, IOException {
		if(null == message && null != getJspBody()) {
			StringWriter sw = new StringWriter();
			getJspBody().invoke(sw);
			getJspContext().getOut().println("<h1>"+sw.toString()+"</h1>");
		} else {
			JspWriter out = getJspContext().getOut();
			out.println("<h1>"+message+"</h1>");
		}
	}
}
