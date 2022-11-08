package com.grouptwo.mow.dao;

import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MapsId;
import javax.persistence.Table;

@Entity
@Table(name="menu_order")
public class MenuOrder {
	
	@EmbeddedId
	MenuOrderKey id;

	@ManyToOne
    @MapsId("menuId")
    @JoinColumn(name = "menu_id")
    private Menu menu;

    @ManyToOne
    @MapsId("orderId")
    @JoinColumn(name = "order_id")
    private Orders order;

    @Column(name="meal_quantity")
    private int quantity;
    
    @Column(name="seasoning", nullable=true)
    private String seasoning;
    
    @Column(name="special_request", nullable=true)
    private String request;



	public MenuOrderKey getId() {
		return id;
	}

	public void setId(MenuOrderKey id) {
		this.id = id;
	}

	public Menu getMenu() {
		return menu;
	}

	public void setMenu(Menu menu) {
		this.menu = menu;
	}

	public Orders getOrder() {
		return order;
	}

	public void setOrder(Orders order) {
		this.order = order;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public String getSeasoning() {
		return seasoning;
	}

	public void setSeasoning(String seasoning) {
		this.seasoning = seasoning;
	}

	public String getRequest() {
		return request;
	}

	public void setRequest(String request) {
		this.request = request;
	}

    
}
