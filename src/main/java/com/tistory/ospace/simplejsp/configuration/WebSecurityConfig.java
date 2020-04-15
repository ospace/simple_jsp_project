package com.tistory.ospace.simplejsp.configuration;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.RememberMeServices;
import org.springframework.security.web.authentication.rememberme.TokenBasedRememberMeServices;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;


@Configuration
@EnableWebSecurity
public class WebSecurityConfig  extends WebSecurityConfigurerAdapter {
	@Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		PasswordEncoder pwdEncoder = passwordEncoder();
		auth.inMemoryAuthentication()
			.withUser("admin").password(pwdEncoder.encode("1111")).roles("ADMIN")
			.and()
			.withUser("user").password(pwdEncoder.encode("1111")).roles("USER");
    }

	@Override
	public void configure( WebSecurity web ) throws Exception {
		web.ignoring()
		   .antMatchers("/assets/**", "/css/**", "/js/**", "/favicon.ico");
	}
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http
		.csrf().disable()
		.headers()
			// click hijacking 방지 - X-Frame-Options 셋팅 , 크로스 사이트 스크립트 방지 해재 default 'DENY' 
			.frameOptions().sameOrigin()
			.and()
		.authorizeRequests()
		 	.antMatchers( "/login**" ).permitAll()
			//.antMatchers("/**").hasAnyRole("ADMIN","USER")
		 	.anyRequest().authenticated()
			.and()
		.formLogin()
			.loginPage( "/login" )
	        .loginProcessingUrl( "/loginProc" )
	        .defaultSuccessUrl( "/" )
	        .failureUrl( "/login?err=1" )
//	        .usernameParameter( "username" )
//	        .passwordParameter( "password" )
	        .and()
		.logout()
			.logoutRequestMatcher( new AntPathRequestMatcher( "/logout" ) )
			.logoutSuccessUrl( "/" )
			.deleteCookies( "JSESSIONID" )
			.deleteCookies( "REMEMBER_ME_COOKE" )
			.invalidateHttpSession( true )
			.and()
		.rememberMe()
			.key("REMEBMER_ME_KEY")
	        .rememberMeServices(tokenBasedRememberMeServices())
			.and()
        // 중복로그인 방지	session-registry-alias : 접속자 정보보기
//		.sessionManagement() 
//			.maximumSessions(1)
//			.expiredUrl("/expireSession")
//			.sessionRegistry(sessionRegistry())
		;
	}
	
	/**
	 *  REMEMBER_ME
	 * @return
	 */
	@Bean
	public RememberMeServices tokenBasedRememberMeServices() {
		TokenBasedRememberMeServices tokenBasedRememberMeServices = new TokenBasedRememberMeServices("REMEBMER_ME_KEY", userDetailsService());
		// 체크박스 클릭안해도 무조건 유지
//		tokenBasedRememberMeServices.setAlwaysRemember(true);
		tokenBasedRememberMeServices.setTokenValiditySeconds(60 * 60 * 24 * 30); //30일
		tokenBasedRememberMeServices.setCookieName("REMEMBER_ME_COOKE");
		return tokenBasedRememberMeServices;
	}
	
	/*
	@Bean
	public SessionRegistryImpl sessionRegistry() {
		return new SessionRegistryImpl();
	}
	*/
	
	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}
}