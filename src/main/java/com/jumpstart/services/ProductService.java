package com.jumpstart.services;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jumpstart.entities.Category;
import com.jumpstart.entities.Product;
import com.jumpstart.repositories.CategoryRepository;
import com.jumpstart.repositories.ProductRepository;

@Service
@Transactional
public class ProductService {

	@Autowired
	ProductRepository productRepo;
	
	@Autowired
	CategoryRepository categoryRepo;
	
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

//	------------------
//	Product Management
//	------------------
	public void deleteProduct(Long pId) {
		productRepo.deleteById(pId);
	}
}