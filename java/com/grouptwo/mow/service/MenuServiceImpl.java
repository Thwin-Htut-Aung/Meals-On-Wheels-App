package com.grouptwo.mow.service;


import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.grouptwo.mow.dao.Menu;
import com.grouptwo.mow.dao.MenuOrder;
import com.grouptwo.mow.dao.Orders;
import com.grouptwo.mow.repo.MenuRepo;
import com.grouptwo.mow.repo.OrderRepo;
import com.grouptwo.mow.repo.OrderedMealRepo;

@Service
@Transactional
public class MenuServiceImpl implements MenuService{
	
	@Autowired
	private MenuRepo menuRepo;
	
	@Autowired
	private OrderRepo orderRepo;
	
	@Autowired 
	private OrderedMealRepo orderedMealRepo;
	
	@Override
	public Menu getMeal(long id) {
		return menuRepo.findById(id).get();
	}

	@Override
	public void deleteMeal(long id) {
		menuRepo.deleteById(id);
	}

	@Override
	public List<Menu> viewMeals() {
		return menuRepo.findAll();
	}

	@Override
	public void saveMeal(Menu meal) {
		menuRepo.save(meal);
		
	}

	@Override
	public List<Orders> viewOrders() {
		return orderRepo.findAll();
	}

	@Override
	public Menu getMealById(long id) {
		return menuRepo.getById(id);
	}

	@Override
	public Orders getOrderById(long id) {
		return orderRepo.getById(id);
	}

	@Override
	public void saveOrder(Orders order) {
		orderRepo.save(order);
		
	}

	@Override
	public void saveOrderedMeal(MenuOrder orderedMeal) {
		orderedMealRepo.save(orderedMeal);
		
	}

	@Override
	public List<Menu> searchMeals(String keyword) {
		return menuRepo.searchByKey(keyword);
	}

	
	
	

}
