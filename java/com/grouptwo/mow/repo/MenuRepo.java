package com.grouptwo.mow.repo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.grouptwo.mow.dao.Menu;

@Repository
public interface MenuRepo extends JpaRepository<Menu, Long>{

	@Query(value = "SELECT m FROM Menu m WHERE mealName LIKE '%' || :keyword || '%' " +  
			"OR mealDescription LIKE '%' || :keyword || '%'")
	public List<Menu> searchByKey(@Param("keyword")String keyword);
	
}
