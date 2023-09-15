package com.jumpstart.controllers;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import javax.websocket.server.PathParam;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jumpstart.entities.Cart;
import com.jumpstart.entities.Product;
import com.jumpstart.entities.User;
import com.jumpstart.services.CartService;
import com.jumpstart.services.CategoryService;
import com.jumpstart.services.ProductService;
import com.jumpstart.services.UserService;


@Controller
public class UserController {
	
	@Autowired
	UserService userService;
	
	@Autowired
	CategoryService categoryService;
	
	@Autowired
	ProductService productService;
	
	@Autowired
	CartService cartService;

	private User getCurrentUser(Principal principal) {
		String username = principal.getName();
		User currentUser = userService.findLoginUser(username);
		return currentUser;
	}
	
	@GetMapping("/my-profile")
	public String myProfilePage(Principal principal, Model model) {
		
		if (principal.getName().equals(null)) {
			return "redirect:access-denied";
		}
		
		List<User> user = new ArrayList<User>();
		user.add(getCurrentUser(principal));
		model.addAttribute("user", user);
		
		return "User/my-profile";
	}
	
//	-----------------------
//	UPDATE PERSONAL PROFILE
//	-----------------------
	@PostMapping("update_profile")
	public String updateProfileInfo(Principal principal, @ModelAttribute("user") User u, RedirectAttributes redir) {
		
		User user = getCurrentUser(principal);
		
		user.setFullname(u.getFullname());
		user.setEmail(u.getEmail());
		user.setMobile(u.getMobile());
		user.setAddress(u.getAddress());
		
		userService.updateUser(user);
		
		return "redirect:my-profile";
	}
	
//	------------
//	Cart Display
//	------------
	@GetMapping("/cart")
	public String myCartPage(Principal principal, Model model) {
		
		User currentUser = getCurrentUser(principal);
		List<Cart> cartItems = cartService.getUserCart(currentUser);
		
		model.addAttribute("cartItems", cartItems);
		return "User/cart";
	}
	
//	-----------
//	Add to Cart
//	-----------
	@PostMapping("/add_to_cart")
	public void addToCart(@ModelAttribute Product product, Model model, Principal principal) {
		
		User currentUser = getCurrentUser(principal);
		List<Cart> cartItems = cartService.getUserCart(currentUser);
		
		Cart newCartItem = new Cart();
		Product selectedProduct = productService.findProduct(product.getId());
		
		for (Cart cartItem : cartItems) {
			
			if (cartItem.getProduct() == selectedProduct) {
				
				cartItem.setCount(cartItem.getCount() + 1);
				
				System.out.println(cartItem.getCount());
				cartService.saveCart(cartItem);
				return;
			}
		}
		newCartItem.setCount(1);
		newCartItem.setProduct(selectedProduct);
		newCartItem.setUser(currentUser);
		
		cartService.saveCart(newCartItem);
		return;
	}

//	---------------
//	Cart Management
//	---------------
	@GetMapping("/remove_from_cart")
	public String removeFromCart(@RequestParam Long cId, RedirectAttributes redir) {
		
		cartService.removeFromCart(cId);
		
		String successMsg = "Item successfully removed";
		redir.addFlashAttribute("successMsg", successMsg);
		
		return "redirect:/cart";
	}
	
	@PostMapping("/edit_cartItem_amount")
	public String editCartItem(@ModelAttribute("cartItem") Cart cartItem, 
			@PathParam("cId") Long cId, RedirectAttributes redir) {
		
		Cart thisCartItem = cartService.findCartItem(cId);
		thisCartItem.setCount(cartItem.getCount());
		
		cartService.saveCart(thisCartItem);
		
		String successMsg = "Item amount changed";
		redir.addFlashAttribute("successMsg", successMsg);
		
		return "redirect:/cart";
	}
	
}
