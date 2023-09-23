package com.jumpstart.services;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jumpstart.entities.Category;
import com.jumpstart.repositories.CategoryRepository;

@Service
@Transactional
public class CategoryService {

	@Autowired
	CategoryRepository categoryRepo;
	
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
}
