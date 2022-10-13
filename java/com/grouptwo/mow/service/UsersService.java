package com.grouptwo.mow.service;


import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.grouptwo.mow.dao.Users;


@Service
@Transactional
public interface UsersService {
	
	Boolean getByEmail(String email);
	Users findByEmail(String email);
	void updateUser(Users user, long id);
	
	public List<Users> getUsers();
	Users getUserById(Long id);
	void deleteUser(Long id);
	
	List<Users> searchByParam(String key);

}
