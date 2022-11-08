package com.grouptwo.mow.repo;


import java.util.Set;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.grouptwo.mow.dao.RoleName;
import com.grouptwo.mow.dao.Roles;

@Repository
public interface RolesRepo extends JpaRepository<Roles, Long>{
	
//	@Query( "select r from Roles r where r.name in :roles" )
//	Set<Roles> findBySpecificRoles(@Param("roles") String role);
	
	Set<Roles> findByName(RoleName roleName);

}
