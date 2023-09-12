package com.jumpstart.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PublicController {

//	------------
//	Public Pages
//	------------
	@GetMapping("/")
	public String landingHandler() {
		return "Public/landing";
	}
	
	@GetMapping("/home")
	public String landingPage() {
		return "Public/landing";
	}
	
	@GetMapping("/about-us")
	public String aboutUsPage() {
		return "Public/about-us";
	}
	
	@GetMapping("/contact-us")
	public String contactUsPage() {
		return "Public/contact-us";
	}
	
	@GetMapping("/privacy-policy")
	public String privacyPolicyPage() {
		return "Public/privacy-policy";
	}
	
	@GetMapping("/terms-and-conditions")
	public String termsAndConditionsPage() {
		return "Public/terms-and-conditions";
	}
}
