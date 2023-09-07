package com.jumpstart.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AuthController {

	@GetMapping("/signup")
	public String reigstrationPage() {
		return "Auth/registration";
	}
	
	@GetMapping("/login")
	public String loginPage() {
		return "Auth/login";
	}
}
