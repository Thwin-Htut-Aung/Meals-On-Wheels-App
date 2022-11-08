package com.grouptwo.mow.dao;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;


@Entity
@Table(name="menu")
public class Menu {
	
	@Id
    @Column(name="meal_id")
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    private Long mealId;

    @Column(name="meal_name")
    private String mealName;

    @Column(name="description")
    private String mealDescription;
    

    @OneToMany(mappedBy = "menu", orphanRemoval=true)
    private Set<MenuOrder> orders = new HashSet<MenuOrder>();



	public Long getMealId() {
		return mealId;
	}


	public void setMealId(Long mealId) {
		this.mealId = mealId;
	}


	public String getMealName() {
		return mealName;
	}


	public void setMealName(String mealName) {
		this.mealName = mealName;
	}


	public String getMealDescription() {
		return mealDescription;
	}


	public void setMealDescription(String mealDescription) {
		this.mealDescription = mealDescription;
	}


	public Set<MenuOrder> getOrders() {
		return orders;
	}


	public void setOrders(Set<MenuOrder> orders) {
		this.orders = orders;
	}

  



}
