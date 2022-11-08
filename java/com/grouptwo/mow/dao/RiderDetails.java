package com.grouptwo.mow.dao;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "riders")
public class RiderDetails {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column
	private long riderId;

	@Column(name="number_of_orders")
	private int numberOfOrders;
	
	@OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "user_id")
	private Users user;
	
	@OneToMany(mappedBy = "rider", orphanRemoval=true)
    private List<Orders> orders = new ArrayList<Orders>();

	public long getRiderId() {
		return riderId;
	}

	public void setRiderId(long riderId) {
		this.riderId = riderId;
	}

	public int getNumberOfOrders() {
		return numberOfOrders;
	}

	public void setNumberOfOrders(int numberOfOrders) {
		this.numberOfOrders = numberOfOrders;
	}

	public Users getUser() {
		return user;
	}

	public void setUser(Users user) {
		this.user = user;
	}

	public List<Orders> getOrders() {
		return orders;
	}

	public void setOrders(List<Orders> orders) {
		this.orders = orders;
	}
	
	
}
