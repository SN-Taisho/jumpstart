package com.jumpstart.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jumpstart.entities.Category;
import com.jumpstart.services.CategoryService;

@Controller
public class CategoryController {

	@Autowired
	CategoryService categoryService;
	
//	-----------------
//	Category Display
//	----------------
	@GetMapping("categories")
	public String categoryManagementPage(Model model) {
		
		List<Category> categories = categoryService.getAllCategories();
		model.addAttribute("categories", categories);
		
		return "Staff/category-management";
	}
	
//	---------------
//	Create Category
//	---------------
	@PostMapping("create_category")
	public String createCategory(@ModelAttribute Category category) {
		
		categoryService.save(category);
		return "redirect:/add-product";
	}

//	------------------
//	Category Management
//	-------------------
	@PostMapping("/edit_category")
	public String editCategory(@ModelAttribute("category") Category category, @RequestParam Long cId,
			RedirectAttributes redir) {
		
		Category thisCategory = categoryService.getByCategoryId(cId);
		
		thisCategory.setName(category.getName());
		thisCategory.setDescription(category.getDescription());
		
		categoryService.save(thisCategory);
		
		String successMsg = thisCategory.getName() + " category has been successfully updated";
		redir.addFlashAttribute("successMsg", successMsg);
		
		return "redirect:/categories";
	}
	
	@GetMapping("/delete_category")
	public String deleteProduct(@RequestParam Long cId, RedirectAttributes redir) {
		
		System.out.println(cId + "Don't forget to enable me (deletion)");
		
		String successMsg = "Product has been successfully deleted";
		redir.addFlashAttribute("successMsg", successMsg);
		
		return "redirect:/categories";
	}
}
