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
public class ProductService {

	@Autowired
	ProductRepository productRepo;
	
	@Autowired
	CategoryRepository categoryRepo;
	
	@Autowired
	PurchaseRepository purchaseRepo;
	
//	-------------
//	Add a Product
//	-------------
	public Product save(Product product) {
		
		return productRepo.save(product);
	}
	
//	---------------
//	Product Display
//	---------------
	public List<Product> getAllProducts() {
		return productRepo.findAll();
	}
	
	public Product findProduct(Long pId) {
		return productRepo.getById(pId);
	}
	
	public List<Product> getProductsByCategory(Category selectedCategory) {
		return productRepo.getByCategory(selectedCategory);
	}
	
	public List<Product> searchProducts(String keyword) {
		return productRepo.searchAllProducts(keyword);
	}
	
	public List<Product> filteredSearch(String keyword, Category selectedCategory) {
		return productRepo.filteredSearch(keyword, selectedCategory);
	}

//	------------------
//	Product Management
//	------------------
	public void deleteProduct(Long pId) {
		
		Product product = productRepo.getById(pId);
		List<Purchase> allPurchases = purchaseRepo.findByProduct(product);
		
		for (Purchase purchase : allPurchases) {
			purchaseRepo.delete(purchase);
		}
		
		productRepo.deleteById(pId);
	}
}