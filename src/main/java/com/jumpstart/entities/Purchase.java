package com.jumpstart.entities;

import java.time.LocalDateTime;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.PrePersist;

import org.springframework.data.annotation.CreatedDate;

@Entity
public class Purchase {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	private String reference;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "user_id")
	private User user;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "product_id")
	private Product product;
	private int count;
	
	private String method;
	
	@CreatedDate
	private LocalDateTime ordered;
	
	@PrePersist
	public void onCreate() {
	    ordered = LocalDateTime.now();
	}
	
	
	private LocalDateTime received;
	
	
//	Constructors
	 public Purchase() {
		 
	}

	public Purchase(Long id, String reference, User user, Product product, int count, String method, LocalDateTime ordered, LocalDateTime received) {
		super();
		this.id = id;
		this.reference = reference;
		this.user = user;
		this.product = product;
		this.count = count;
		this.method = method;
		this.ordered = ordered;
		this.received = received;
	}

	
//	Getter Setters
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}

	public String getReference() {
		return reference;
	}
	public void setReference(String reference) {
		this.reference = reference;
	}

	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}

	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}

	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	
	public String getMethod() {
		return method;
	}
	public void setMethod(String method) {
		this.method = method;
	}

	public LocalDateTime getOrdered() {
		return ordered;
	}
	public void setOrdered(LocalDateTime ordered) {
		this.ordered = ordered;
	}

	public LocalDateTime getReceived() {
		return received;
	}
	public void setReceived(LocalDateTime received) {
		this.received = received;
	}	
}
