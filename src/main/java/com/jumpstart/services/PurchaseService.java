package com.jumpstart.services;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jumpstart.entities.Purchase;
import com.jumpstart.repositories.PurchaseRepository;

@Service
@Transactional
public class PurchaseService {

	@Autowired
	PurchaseRepository purchaseRepository;
	
//	-------------
//	Save Purchase
//	-------------
	public void save(Purchase purhcase) {
		purchaseRepository.save(purhcase);
	}
}
