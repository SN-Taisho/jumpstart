package com.jumpstart.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AuthController {

//	------------
//	Registration
//	------------
	@GetMapping("/signup")
	public String reigstrationPage() {
		return "Auth/registration";
	}
	
	@GetMapping("/registration-confirmation")
	public String registrationConfirmation() {
		return "Auth/registration-confirmation";
	}
	
	@GetMapping("/thank-you")
	public String registrationSuccessPage() {
		return "Public/registration-success";
	}
	
	@GetMapping("/login")
	public String loginPage() {
		return "Auth/login";
	}
}
