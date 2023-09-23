package com.jumpstart.controllers;

import java.security.Principal;
import java.util.List;

import javax.websocket.server.PathParam;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jumpstart.entities.Cart;
import com.jumpstart.entities.Product;
import com.jumpstart.entities.Purchase;
import com.jumpstart.entities.ShippingFee;
import com.jumpstart.entities.User;
import com.jumpstart.services.CartService;
import com.jumpstart.services.CategoryService;
import com.jumpstart.services.ProductService;
import com.jumpstart.services.PurchaseService;
import com.jumpstart.services.ShippingFeeService;
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
	
	@Autowired
	ShippingFeeService shippingFeeService;
	
	@Autowired
	PurchaseService purchaseService;

	private User getCurrentUser(Principal principal) {
		String username = principal.getName();
		User currentUser = userService.findLoginUser(username);
		return currentUser;
	}
	
//	--------------------
//	Display User Profile
//	--------------------
	@GetMapping("/my-profile")
	public String myProfilePage(Principal principal, Model model) {
		
		if (principal.getName().equals(null)) {
			return "redirect:access-denied";
		}
		
		User user = getCurrentUser(principal);
		
		Page<Purchase> recentPurchases = purchaseService.getMostRecentPurchase(user);
		List<Purchase> recentPurchaseList = recentPurchases.getContent();
		
		model.addAttribute("recentPurchases", recentPurchaseList);
		model.addAttribute("user", user);
		
		return "User/my-profile";
	}
	
//	-----------------------
//	Update Personal Profile
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
		
		ShippingFee shippingFee = shippingFeeService.getShippingFee();
		
		model.addAttribute("shippingFee", shippingFee.getShippingFee());
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
		selectedProduct.setStock(selectedProduct.getStock() - 1);
		
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
	
	@GetMapping("/remove_from_cart")
	public String removeFromCart(@RequestParam Long cId, RedirectAttributes redir) {
		
		cartService.removeFromCart(cId);
		
		String successMsg = "Item successfully removed";
		redir.addFlashAttribute("successMsg", successMsg);
		
		return "redirect:/cart";
	}
	
//	-----------------
//	Ongoign Purchases
//	-----------------
	@GetMapping("/ongoing-purchases")
	public String ongoingPurchases(Principal principal, Model model) {
		
		User user = getCurrentUser(principal);
		
		List<Purchase> ongoingPurchases = purchaseService.getUserOngoingPurchases(user);
		
		model.addAttribute("ongoingPurchases", ongoingPurchases);
		return "User/ongoing-purchases";
	}
	
//	----------------
//	Purchase History
//	----------------
	@GetMapping("/purchase-history")
	public String purchaseHistory(Principal principal, Model model,
			@RequestParam(name = "search", required = false) String keyword) {
		
		User user = getCurrentUser(principal);
		List<Purchase> allCompletedPurchases = null;
		
		if (keyword == null || keyword == "") {
			allCompletedPurchases = purchaseService.getUserCompletedPurchases(user);
		}
   	
		if (keyword != null && keyword != "") {
			allCompletedPurchases = purchaseService.searchUserCompletedPurchases(user, keyword);
		}
		
		model.addAttribute("purchases", allCompletedPurchases);
		model.addAttribute("search", keyword);
		return "User/purchase-history";
	}
	
}
