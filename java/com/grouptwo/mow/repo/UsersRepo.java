package com.grouptwo.mow.repo;


import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.grouptwo.mow.dao.Users;

@Repository
public interface UsersRepo extends JpaRepository<Users, Long> {
	
	Users findUserByEmail(String email);
	
	Optional<Users> findByEmail(String email);
	
	Boolean existsByEmail(String email);
	
	@Query(value = "SELECT u FROM Users u WHERE u.fullName LIKE '%' || :keyword || '%'"
			+ "OR u.email LIKE '%' || :keyword || '%'"
			+ "OR u.country LIKE '%' || :keyword || '%'"
			+ "OR u.city LIKE '%' || :keyword || '%'"
			+ "OR u.address LIKE '%' || :keyword || '%'")
	public List<Users> searchByParam(@Param("keyword") String keyword);
	

}
