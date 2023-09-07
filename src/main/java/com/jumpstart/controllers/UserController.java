package com.jumpstart.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class UserController {

	@GetMapping("/dashboard")
	public String dashboard() {
		return "User/dashboard";
	}
	
	@GetMapping("/my-profile")
	public String myProfilePage() {
		return "User/my-profile";
	}
	
	@GetMapping("/cart")
	public String cartPage() {
		return "User/cart";
	}
	
	@GetMapping("/search")
	public String searchPage() {
		return "User/search";
	}
}
