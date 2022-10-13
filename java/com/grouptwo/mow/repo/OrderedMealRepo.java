package com.grouptwo.mow.repo;

import org.springframework.data.jpa.repository.JpaRepository;

import com.grouptwo.mow.dao.MenuOrder;


public interface OrderedMealRepo extends JpaRepository<MenuOrder, Long>{

}
