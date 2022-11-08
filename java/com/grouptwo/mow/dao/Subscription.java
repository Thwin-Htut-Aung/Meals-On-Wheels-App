package com.grouptwo.mow.dao;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="subscription")
public class Subscription {

	@Id
    @Column(name="sub_id")
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    private Long subId;
	
	@Column(name="sub_name")
	private String subName;
	
	@Column(name="sub_type")
	private String subType;
	
	@Column(name="start_date")
    private String startDate;
	
	@Column(name="end_date")
    private String endDate;
	
	@ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name="user_id")
    private Users user;

	public Long getSubId() {
		return subId;
	}

	public void setSubId(Long subId) {
		this.subId = subId;
	}

	public String getSubName() {
		return subName;
	}

	public void setSubName(String subName) {
		this.subName = subName;
	}

	public String getSubType() {
		return subType;
	}

	public void setSubType(String subType) {
		this.subType = subType;
	}


	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public Users getUser() {
		return user;
	}

	public void setUser(Users user) {
		this.user = user;
	}
	
	
}
