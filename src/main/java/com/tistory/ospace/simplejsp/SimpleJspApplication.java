package com.tistory.ospace.simplejsp;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

@SpringBootApplication
public class SimpleJspApplication extends SpringBootServletInitializer {
	private static Class<?> app = SimpleJspApplication.class;

	public static void main(String[] args) {
		SpringApplication.run(app, args);
	}

	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
		return application.sources(app);
	}
}
