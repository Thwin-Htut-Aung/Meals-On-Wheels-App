package com.grouptwo.mow.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.grouptwo.mow.dao.Users;
import com.grouptwo.mow.repo.UsersRepo;

public class MoWUserDetailsService implements UserDetailsService{
	
	@Autowired
	private UsersRepo usersRepo;

	@Override
	public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
		Users user = usersRepo.findByEmail(email)
				.orElseThrow(() -> new UsernameNotFoundException("This email cannot be found " + email));
		return new MoWUserDetails(user);
	}

}
