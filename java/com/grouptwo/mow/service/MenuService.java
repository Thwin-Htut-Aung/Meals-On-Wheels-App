package com.grouptwo.mow.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.grouptwo.mow.dao.Menu;
import com.grouptwo.mow.dao.MenuOrder;
import com.grouptwo.mow.dao.Orders;

@Service
@Transactional
public interface MenuService {

	public Menu getMeal(long id);
	public void deleteMeal(long id);
	
	public List<Menu> viewMeals();
	public List<Orders> viewOrders();
	
	public void saveMeal(Menu meal);
	public void saveOrder(Orders order);
	
	public void saveOrderedMeal(MenuOrder orderedMeal);
	public Menu getMealById(long id);
	
	public Orders getOrderById(long id);
	public List<Menu> searchMeals(String keyword);
}
