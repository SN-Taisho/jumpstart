package com.jumpstart.controllers;

import java.math.BigDecimal;
import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.jumpstart.entities.Cart;
import com.jumpstart.entities.User;
import com.jumpstart.services.CartService;
import com.jumpstart.services.ShippingFeeService;
import com.jumpstart.services.UserService;

@Controller
public class PurchaseController {

	@Autowired
	UserService userService;
	
	@Autowired
	CartService cartService;
	
	@Autowired
	ShippingFeeService shippingFeeService;
	
	private User getCurrentUser(Principal principal) {
		String username = principal.getName();
		User currentUser = userService.findLoginUser(username);
		return currentUser;
	}
	
//	-------------
//	Checkout Page
//	-------------
	@GetMapping("/checkout")
	public String checkOutPage(Model model, Principal principal) {
		
		User user = getCurrentUser(principal);
		List<Cart> cartItems = cartService.getUserCart(user);
		BigDecimal shippingFee = shippingFeeService.getShippingFee().getShippingFee();

		model.addAttribute("shippingFee", shippingFee);
		model.addAttribute("cartItems", cartItems);
		return "User/checkout";
	}
	
//	-----------------
//	Payment Selection
//	-----------------
	@PostMapping("/proceed_with_payment")
	public String paymentSelection() {
		return "User/payment-selection";
	}
	
}
