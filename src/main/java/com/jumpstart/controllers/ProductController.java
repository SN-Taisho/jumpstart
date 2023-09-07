package com.jumpstart.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ProductController {

	@GetMapping("/product-details")
	public String productDetailsPage() {
		return "Products/product-details";
	}
}
