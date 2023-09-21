package com.jumpstart.services;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jumpstart.entities.ShippingFee;
import com.jumpstart.repositories.ShippingFeeRepository;

@Service
@Transactional
public class ShippingFeeService {

	@Autowired
	ShippingFeeRepository shippingFeeRepo;
	
//	-----------------
//	Save Shipping Fee
//	-----------------
	public ShippingFee save(ShippingFee shippingFee) {
		return shippingFeeRepo.save(shippingFee);
		
	}
	
//	-------------------
//	Shipping Fee Dsplay
//	-------------------
	public ShippingFee getShippingFee() {
		return shippingFeeRepo.getById((long) 1);
	}
	
//	-----------------------
//	Shipping Fee Management
//	-----------------------
}
