package com.jumpstart.controllers;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jumpstart.entities.User;
import com.jumpstart.services.UserService;


@Controller
public class UserController {
	
	@Autowired
	UserService userService;

	@GetMapping("/dashboard")
	public String dashboard() {
		return "User/dashboard";
	}
	
	@GetMapping("/my-profile")
	public String myProfilePage(Principal principal, Model model) {
		
		if (principal.getName().equals(null)) {
			return "redirect:access-denied";
		}
		
		String username = principal.getName();
		User userdata = userService.findLoginUser(username);
		
		List<User> user = new ArrayList<User>();
		user.add(userdata);
		model.addAttribute("user", user);
		
		return "User/my-profile";
	}
	
//	-----------------------
//	UPDATE PERSONAL PROFILE
//	-----------------------
	@PostMapping("update_profile")
	public String updateProfileInfo(Principal principal, @ModelAttribute("user") User u, RedirectAttributes redir) {
		
		String username = principal.getName();
		
		User user = userService.findLoginUser(username);
		
		user.setFullname(u.getFullname());
		user.setEmail(u.getEmail());
		user.setMobile(u.getMobile());
		user.setAddress(u.getAddress());
		
		userService.updateUser(user);
		
		return "redirect:my-profile";
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
