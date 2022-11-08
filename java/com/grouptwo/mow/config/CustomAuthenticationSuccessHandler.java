package com.grouptwo.mow.config;

import java.io.IOException;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

public class CustomAuthenticationSuccessHandler implements AuthenticationSuccessHandler {

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		
		String redirectUrl = null;
		Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();
		
		for(GrantedAuthority grantedAuthority : authorities) {
			System.out.println("role " + grantedAuthority.getAuthority());
			if (grantedAuthority.getAuthority().equals("ROLE_MEMBER") || grantedAuthority.getAuthority().equals("ROLE_CAREGIVER")) {
				redirectUrl = "/view-menu";
				break;
			} else if (grantedAuthority.getAuthority().equals("ROLE_PARTNER") || grantedAuthority.getAuthority().equals("ROLE_VOLUNTEER")) {
				redirectUrl = "/view-menu";
				break;
			} else if(grantedAuthority.getAuthority().equals("ROLE_RIDER")) {
				redirectUrl = "/view-orders";
				break;
			} else if(grantedAuthority.getAuthority().equals("ROLE_ADMIN")) {
				redirectUrl = "/admin/list_users";
				break;
			}
		}
		System.out.println("redirectUrl " + redirectUrl);
		if (redirectUrl == null) {
			throw new IllegalStateException();
		}
		new DefaultRedirectStrategy().sendRedirect(request, response, redirectUrl);
		
	}

}
