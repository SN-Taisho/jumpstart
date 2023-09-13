package com.jumpstart.services;

import java.util.HashSet;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	public Product saveProduct(Product product, String category) {
		
		product.setCategories(new HashSet<>(categoryRepo.findBySpecificCateogry(category)));
		return productRepo.save(product);
	}
	
//	---------------
//	Product Display
//	---------------
	public List<Product> getAllProducts() {
		return productRepo.findAll();
	}
}