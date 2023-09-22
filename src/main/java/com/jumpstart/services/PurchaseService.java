package com.jumpstart.services;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.jumpstart.entities.Purchase;
import com.jumpstart.entities.User;
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
	
//	----------------
//	Purchase Display
//	----------------
	public Page<Purchase> getMostRecentPurchase(User user) {
		
		return purchaseRepository.getMostRecentPurchases(user, PageRequest.of(0, 5));
	}

	public List<Purchase> getUserOngoingPurchases(User user) {
		return purchaseRepository.getUserOngoingPurchases(user);
	}
}
