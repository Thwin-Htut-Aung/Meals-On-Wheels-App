package com.grouptwo.mow.dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;



@Entity
@Table(name="ordertable")
public class Orders {
	
	@Id
    @Column(name="order_id")
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    private Long orderId;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="order_date")
    private Date orderDate;

	@ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name="user_id")
    private Users user;
	
	@OneToMany(mappedBy = "order", orphanRemoval=true)
    private List<MenuOrder> meals = new ArrayList<MenuOrder>();

	@Column(name="picked_up")
	private boolean pickedUp;
	
	//added
	@ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name="rider_id")
    private RiderDetails rider;
	
	@Column(name="informed_rider")
	private boolean informed;
	
	@Column(name="rider_name", nullable=true)
	private String riderName;
	
	
	public Long getOrderId() {
		return orderId;
	}

	public void setOrderId(Long orderId) {
		this.orderId = orderId;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public Users getUser() {
		return user;
	}

	public void setUser(Users user) {
		this.user = user;
	}

	public List<MenuOrder> getMeals() {
		return meals;
	}

	public void setMeals(List<MenuOrder> meals) {
		this.meals = meals;
	}

	public boolean isPickedUp() {
		return pickedUp;
	}

	public void setPickedUp(boolean pickedUp) {
		this.pickedUp = pickedUp;
	}
	
	public boolean isInformed() {
		return informed;
	}

	public void setInformed(boolean informed) {
		this.informed = informed;
	}

	public String getRiderName() {
		return riderName;
	}

	public void setRiderName(String riderName) {
		this.riderName = riderName;
	}

	public RiderDetails getRider() {
		return rider;
	}

	public void setRider(RiderDetails rider) {
		this.rider = rider;
	}
	
	
}
