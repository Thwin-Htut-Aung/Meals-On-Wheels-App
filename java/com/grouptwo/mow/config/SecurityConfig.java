package com.grouptwo.mow.config;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.BeanIds;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.authentication.logout.LogoutSuccessHandler;

import com.grouptwo.mow.service.MoWUserDetailsService;

@EnableWebSecurity	//secure unauthorized user without valid JWT
@Configuration		//enable configure class
@EnableGlobalMethodSecurity(
		securedEnabled = true,
		jsr250Enabled = true,
		prePostEnabled = true)
public class SecurityConfig extends WebSecurityConfigurerAdapter{
	
//	@Autowired
//	private CustomAuthenticationSuccessHandler successHandler;
	
//	@Autowired
//	private AuthenticationSuccessHandler successHandler;
	
	@Bean
	public AuthenticationSuccessHandler successHandler() {
		return new CustomAuthenticationSuccessHandler();
	}
	
	@Bean
	public UserDetailsService userDetailsService() {
		return new MoWUserDetailsService();
	}

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
    
    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
    	auth.userDetailsService(userDetailsService())
    		.passwordEncoder(passwordEncoder());
    }
    
    @Bean(BeanIds.AUTHENTICATION_MANAGER)
    @Override
    public AuthenticationManager authenticationManagerBean() throws Exception {
        return super.authenticationManagerBean();
    }
    
    @Override
    protected void configure(HttpSecurity http) throws Exception {
    	http
		.formLogin()
    		.loginPage("/login")
    		.loginProcessingUrl("/dologin")
//    		.successHandler(new AuthenticationSuccessHandler() {
//				@Override
//				public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
//						Authentication authentication) throws IOException, ServletException {
//					response.sendRedirect("/profile");
//				}
//			})
    		.successHandler(successHandler())
    		//.defaultSuccessUrl("/")
    		.failureHandler(new AuthenticationFailureHandler() {
				@Override
				public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
						AuthenticationException exception) throws IOException, ServletException {
					response.sendRedirect("/login_error");
				}
			})
		
		.and()
		.cors().and().csrf().disable()
		.authorizeRequests()
				.antMatchers("/",
			                "/error",
			                "/favicon.ico",
			                "/**/*.pdf",
			                "/**/*.png",
			                "/**/*.gif",
			                "/**/*.svg",
			                "/**/*.jpg",
			                "/**/*.html",
			                "/**/*.css",
			                "/**/*.js")
                			.permitAll()
                .antMatchers("/img/**").permitAll()
    			.antMatchers("/style/**").permitAll()
    			.antMatchers("/script/**").permitAll()
    	.and()
    	.logout()
    		.logoutUrl("/dologout")
    		.invalidateHttpSession(true)
    		.logoutSuccessHandler(new LogoutSuccessHandler() {
				@Override
				public void onLogoutSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication)
						throws IOException, ServletException {
					response.sendRedirect("/login");
				}
			});
    	
    }
	
}
