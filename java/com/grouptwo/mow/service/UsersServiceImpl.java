package com.grouptwo.mow.service;


import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.grouptwo.mow.dao.Users;
import com.grouptwo.mow.repo.UsersRepo;

@Service
@Transactional
public class UsersServiceImpl implements UsersService{
	
	@Autowired
	private UsersRepo usersRepo;

	@Override
	public Boolean getByEmail(String email) {
		if(usersRepo.existsByEmail(email)) {
			return true;
		}
		return false;
	}

	@Override
	public Users findByEmail(String email) {
		return usersRepo.findByEmail(email).get();
	}

	@Override
	public void updateUser(Users user, long id) {
		Users edit = usersRepo.findById(id).get();
		edit.setFullName(user.getFullName());
		edit.setOrganizationName(user.getOrganizationName());
		edit.setCountry(user.getCountry());
		edit.setCity(user.getCity());
		edit.setAddress(user.getAddress());
		edit.setPhoneNumber(user.getPhoneNumber());
		edit.setIssue(user.getIssue());
		usersRepo.save(edit);
	}

	@Override
	public List<Users> getUsers() {
		return usersRepo.findAll(Sort.by(Sort.Direction.ASC, "userId"));
	}

	public Users getUserById(Long id) {
		return usersRepo.findById(id).get();
	}
	
	public void deleteUser(Long id) {
		usersRepo.deleteById(id);
	}

	@Override
	public List<Users> searchByParam(String key) {
		return usersRepo.searchByParam(key);
	}


}
