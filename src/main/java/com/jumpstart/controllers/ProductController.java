package com.jumpstart.controllers;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jumpstart.entities.Category;
import com.jumpstart.entities.Product;
import com.jumpstart.services.CategoryService;
import com.jumpstart.services.ProductService;

@Controller
public class ProductController {
	
	@Autowired
	CategoryService categoryService;
	
	@Autowired
	ProductService productService;

//	-----------------
//	Product's Display
//	-----------------
	@GetMapping("/product-details")
	public String productDetailsPage() {
		return "Products/product-details";
	}
	
//	------------------
//	Product Management
//	------------------
	@GetMapping("/product-management")
	public String staffDashboardPage(Model model) {
		
		List<Category> categories = categoryService.getAllCategories();
		model.addAttribute("categories", categories);
		
		List<Product> products = productService.getAllProducts();
		model.addAttribute("products", products);
		
		return "Staff/product-management";
	}
	
	@PostMapping("create_category")
	public String createCategory(@ModelAttribute Category category) {
		
		categoryService.save(category);
		return "redirect:/add-product";
	}
	
	@GetMapping("/add-product")
	public String addProductPage(Model model, @ModelAttribute("product") Product product) {
		
		List<Category> categories = categoryService.getAllCategories();
		model.addAttribute("categories", categories);
		
		return "Staff/add-product";
	}
	
	@PostMapping("/add_product")
	public String addProduct(@ModelAttribute("product") Product product, @RequestParam("category") String category, 
			@RequestParam("fileImage") MultipartFile multipartFile, RedirectAttributes redir) throws IOException {
		
		product.setSales(0);
		System.out.println(product.getName());
		System.out.println(product.getDescription());
		System.out.println(category);
		System.out.println(product.getStock());
		System.out.println(product.getPrice());
		
		String fileName = StringUtils.cleanPath(multipartFile.getOriginalFilename());
		product.setPhotos(fileName);
		
		Product savedProduct = productService.saveProduct(product, category);
		
		String uploadDir = "./src/main/resources/static/product-images/" + savedProduct.getId();
		Path uploadPath = Paths.get(uploadDir);
		
		if (!Files.exists(uploadPath)) {
			Files.createDirectories(uploadPath);
		}

		try (InputStream inputStream = multipartFile.getInputStream()) {
			Path filePath = uploadPath.resolve(fileName);
			System.out.println(filePath.toFile().getAbsolutePath());
			Files.copy(inputStream, filePath, StandardCopyOption.REPLACE_EXISTING);
		} 
		catch (IOException e) {
			throw new IOException("Could not save uploaded file: " + fileName);
		}
		
		product.setPhotoImagePath("/product-images/" + savedProduct.getId() + "/" + savedProduct.getPhotos());
		productService.saveProduct(product, category);
		
		String successMsg = "Product Successfully Added";
		redir.addFlashAttribute("successMsg", successMsg);
		return "redirect:/product-management";
	}
}
