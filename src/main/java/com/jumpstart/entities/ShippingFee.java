package com.jumpstart.entities;

import java.math.BigDecimal;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class ShippingFee {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	private BigDecimal shippingFee;
	
	
//	Constructor
	public ShippingFee() {
		
	}
	
	public ShippingFee(Long id, BigDecimal shippingFee) {
		this.id = id;
		this.shippingFee = shippingFee;
	}
	
	
//	Getter Setters
	public Long getId() {
		return id;
	}
	
	public void setId(Long id) {
		this.id = id;
	}
	
	public BigDecimal getShippingFee() {
		return shippingFee;
	}
	
	public void setShippingFee(BigDecimal shippingFee) {
		this.shippingFee = shippingFee;
	}
}
