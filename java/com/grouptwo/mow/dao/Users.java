package com.grouptwo.mow.dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.UniqueConstraint;


@Entity
@Table(name = "users", 
	   uniqueConstraints = {
			   @UniqueConstraint(columnNames = "email")
	   })
public class Users {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long userId;
	
	@Column(nullable = false)
	private String fullName;
	
	@Column(nullable = false, unique = true)
	private String email;
	
    @Column(nullable = false)
    private String password;
    
    @Column(nullable = false)
    private String phoneNumber;
    
    private String country;
    
    private String city;
    
    @Column(nullable = false)
    private String address;
    
//    @Temporal(TemporalType.DATE)
//    private Date dateOfBirth;
    
    private boolean verified = false;
    
    private String issue;
    
    //private String ownerName;
    
    private String organizationName;
    
    private long caregiverId;
    
    @Temporal(TemporalType.TIMESTAMP)
    private Date created;
    
    @ManyToMany(cascade = CascadeType.PERSIST, fetch = FetchType.EAGER)
    @JoinTable(
            name = "users_roles",
            joinColumns = @JoinColumn(name = "user_id"),
            inverseJoinColumns = @JoinColumn(name = "role_id")
            )
    private Set<Roles> roles = new HashSet<>();
    
    @OneToMany(mappedBy = "user", orphanRemoval = true)
    private Set<FileDB> files = new HashSet<>();
    
    @OneToMany(mappedBy = "user", orphanRemoval=true)
    private List<Orders> orders = new ArrayList<Orders>();
    
    // added
    @OneToMany(mappedBy = "user", orphanRemoval=true)
    private List<Subscription> subs = new ArrayList<Subscription>();
    
    @OneToOne(mappedBy = "user", orphanRemoval=true)
    private RiderDetails rider;

	public long getUserId() {
		return userId;
	}

	public void setUserId(long userId) {
		this.userId = userId;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

//	public Date getDateOfBirth() {
//		return dateOfBirth;
//	}
//
//	public void setDateOfBirth(Date dateOfBirth) {
//		this.dateOfBirth = dateOfBirth;
//	}

	public boolean isVerified() {
		return verified;
	}

	public void setVerified(boolean verified) {
		this.verified = verified;
	}

	public String getIssue() {
		return issue;
	}

	public void setIssue(String issue) {
		this.issue = issue;
	}

//	public String getOwnerName() {
//		return ownerName;
//	}
//
//	public void setOwnerName(String ownerName) {
//		this.ownerName = ownerName;
//	}

	public String getOrganizationName() {
		return organizationName;
	}

	public void setOrganizationName(String organizationName) {
		this.organizationName = organizationName;
	}

	public long getCaregiverId() {
		return caregiverId;
	}

	public void setCaregiverId(long caregiverId) {
		this.caregiverId = caregiverId;
	}

	public Date getCreated() {
		return created;
	}

	public void setCreated(Date created) {
		this.created = created;
	}

	public Set<Roles> getRoles() {
		return roles;
	}

	public void setRoles(Set<Roles> roles) {
		this.roles = roles;
	}

	public Set<FileDB> getFiles() {
		return files;
	}

	public void setFiles(Set<FileDB> files) {
		this.files = files;
	}

	public List<Orders> getOrders() {
		return orders;
	}

	public void setOrders(List<Orders> orders) {
		this.orders = orders;
	}
    
	public List<Subscription> getSubs() {
		return subs;
	}

	public void setSubs(List<Subscription> subs) {
		this.subs = subs;
	}

	public RiderDetails getRider() {
		return rider;
	}

	public void setRider(RiderDetails rider) {
		this.rider = rider;
	}
    
}
