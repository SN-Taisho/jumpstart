package com.jumpstart.services;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jumpstart.entities.Category;
import com.jumpstart.entities.Product;
import com.jumpstart.entities.Purchase;
import com.jumpstart.repositories.CategoryRepository;
import com.jumpstart.repositories.ProductRepository;
import com.jumpstart.repositories.PurchaseRepository;

@Service
@Transactional
public class CategoryService {

	@Autowired
	CategoryRepository categoryRepo;
	
	@Autowired
	ProductRepository productRepo;
	
	@Autowired
	PurchaseRepository purchaseRepo;
	
//	-----------------
//	Category Creation
//	-----------------
	public Category save(Category category) {
		return categoryRepo.save(category);
	}
	
	public Category findByName(String category) {
		return categoryRepo.findByName(category);
	}

//	-----------------------------
//	Category Management / Display
//	-----------------------------
	public List<Category> getAllCategories() {
		return categoryRepo.findAllByOrderByNameAsc();
	}
	
	public Category getByCategoryId(Long cId) {
		return categoryRepo.getById(cId);
	}
	
	public void deleteCategoryById(Long cId) {
		
		Category category = categoryRepo.getById(cId);
		
		List<Product> allProducts = productRepo.getByCategory(category);
		
		for (Product product : allProducts) {
			List<Purchase> allPurchase = purchaseRepo.findByProduct(product);
			
			for (Purchase purchase : allPurchase) {
				purchaseRepo.delete(purchase);
			}
			productRepo.delete(product);
		}
		categoryRepo.deleteById(cId);
	}
}
