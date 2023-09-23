package com.jumpstart.controllers;

import java.math.BigDecimal;
import java.security.Principal;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jumpstart.apis.paypal.PaypalService;
import com.jumpstart.entities.Cart;
import com.jumpstart.entities.Purchase;
import com.jumpstart.entities.User;
import com.jumpstart.services.CartService;
import com.jumpstart.services.PurchaseService;
import com.jumpstart.services.ShippingFeeService;
import com.jumpstart.services.UserService;
import com.paypal.api.payments.Links;
import com.paypal.api.payments.Payment;
import com.paypal.base.rest.PayPalRESTException;

@Controller
public class PurchaseController {

	@Autowired
	UserService userService;
	
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
	
	
//	-------------
//	Checkout Page
//	-------------
	@GetMapping("/checkout")
	public String checkOutPage(Model model, Principal principal) {
		
		User user = getCurrentUser(principal);
		List<Cart> cartItems = cartService.getUserCart(user);
		
		if (!cartItems.isEmpty()) {
			
			BigDecimal shippingFee = shippingFeeService.getShippingFee().getShippingFee();

			model.addAttribute("shippingFee", shippingFee);
			model.addAttribute("cartItems", cartItems);
			model.addAttribute("user", user);
			return "User/checkout";
		}
		return "redirect:/cart";
	}
	
	
//	--------------
//	Paypal Payment
//	--------------
	@Autowired
	PaypalService paypalService;
	
	public static final String DELIVERY_SUCCESS_URL = "delivery-purchase-success";
	public static final String PICKUP_SUCCESS_URL = "pickup-purchase-success";
	public static final String CANCEL_URL = "paypal-cancel";
	
	@PostMapping("pay_with_paypal")
	public String paypalPayment(Principal principal, RedirectAttributes redir,
			@RequestParam(name = "method", required = true) String method) {
		
		User user = getCurrentUser(principal);
		List<Cart> userCart = cartService.getUserCart(user);
		BigDecimal shippingFee = shippingFeeService.getShippingFee().getShippingFee();
		
		double totalPrice = 0.00;
		int totalItems = 0;
		for (Cart cartItem : userCart) {
			totalItems += cartItem.getCount();
			 totalPrice += (cartItem.getProduct().getPrice().doubleValue() * cartItem.getCount());
		}
		
		double totalWithShipping = totalPrice;
		
		if (totalItems > 4) {
			totalWithShipping += shippingFee.doubleValue() * 2;
		}
		else if (totalItems <= 4) {
			totalWithShipping += shippingFee.doubleValue();
		}
		
		
		if (method.equals("Delivery")) {
			try {
				Payment payment = paypalService.createPayment(totalWithShipping, "USD", "paypal",
						"sale", "Jumpstart sale with paypal", "http://localhost:8080/" + CANCEL_URL,
						"http://localhost:8080/" + DELIVERY_SUCCESS_URL);
				
				 for (Links link : payment.getLinks()) {
					 
					 if (link.getRel().equals("approval_url")) {
						 return "redirect:" + link.getHref();
					 }
				 }
				
			} catch (PayPalRESTException e) {
				e.printStackTrace();
			}
		}
		
		else if (method.equals("Pickup")) {
			try {
				Payment payment = paypalService.createPayment(totalPrice, "USD", "paypal",
						"sale", "Jumpstart sale with paypal", "http://localhost:8080/" + CANCEL_URL,
						"http://localhost:8080/" + PICKUP_SUCCESS_URL);
				
				 for (Links link : payment.getLinks()) {
					 
					 if (link.getRel().equals("approval_url")) {
						 return "redirect:" + link.getHref();
					 }
				 }
				
			} catch (PayPalRESTException e) {
				e.printStackTrace();
			}
		}
			
		
		return "redirect:/cart";
	}

//	-----------
//	Cancel Link
//	-----------
	@GetMapping(value = CANCEL_URL)
    public String cancelPay(RedirectAttributes redir) {
		
		String errorMsg = "Purchase canceled";
		redir.addFlashAttribute("successMsg", errorMsg);
        return "redirect:/cart";
    }
	

//	---------------------
//	Delivery Success Link
//	---------------------
    @GetMapping(value = DELIVERY_SUCCESS_URL)
    public String deliverySuccessPage(Principal principal, Model model,
    		@RequestParam("paymentId") String paymentId, @RequestParam("PayerID") String payerId) {
    	
		try {
			Payment payment = paypalService.executePayment(paymentId, payerId);
			System.out.println(payment.toJSON());

			if (payment.getState().equals("approved")) {

				User user = getCurrentUser(principal);
				List<Cart> userCart = cartService.getUserCart(user);

				String referenceCode = UUID.randomUUID().toString();
				
				for (Cart cartItem : userCart) {

					Purchase newPurchase = new Purchase();

					newPurchase.setUser(user);
					newPurchase.setProduct(cartItem.getProduct());
					newPurchase.setCount(cartItem.getCount());
					newPurchase.setReference(referenceCode);
					newPurchase.setMethod("Delivery");

					purchaseService.save(newPurchase);
					cartItem.getProduct().setSales(cartItem.getProduct().getSales() + cartItem.getCount());
					cartItem.getProduct().setStock(cartItem.getProduct().getStock() - cartItem.getCount());
					
					cartService.removeFromCart(cartItem.getId());
				}
				System.out.println("Successful Delivery Purchase");
				
				String succesMsg = "Purchase has been placed for delivery, you may now view the order in my purchases";
				model.addAttribute("successMsg", succesMsg);
				model.addAttribute("method", "Delivery");
				return "User/payment-success";
            }
            
        } catch (PayPalRESTException e) {
         System.out.println(e.getMessage());
        }
        return "redirect:/cart";
    }
    
    
//	---------------------
//	Delivery Success Link
//	---------------------
    @GetMapping(value = PICKUP_SUCCESS_URL)
    public String pickupSuccessPage(Principal principal, Model model,
    		@RequestParam("paymentId") String paymentId, @RequestParam("PayerID") String payerId) {
    	
		try {
			Payment payment = paypalService.executePayment(paymentId, payerId);
			System.out.println(payment.toJSON());

			if (payment.getState().equals("approved")) {

				User user = getCurrentUser(principal);
				List<Cart> userCart = cartService.getUserCart(user);

				String referenceCode = UUID.randomUUID().toString();

				for (Cart cartItem : userCart) {

					Purchase newPurchase = new Purchase();

					newPurchase.setUser(user);
					newPurchase.setProduct(cartItem.getProduct());
					newPurchase.setCount(cartItem.getCount());
					newPurchase.setReference(referenceCode);
					newPurchase.setMethod("Pickup");

					purchaseService.save(newPurchase);
					
					cartItem.getProduct().setSales(cartItem.getProduct().getSales() + cartItem.getCount());
					cartItem.getProduct().setStock(cartItem.getProduct().getStock() - cartItem.getCount());
					
					cartService.removeFromCart(cartItem.getId());
				}
				System.out.println("Successfull Pickup Purchase");
				String succesMsg = "Purchase has been placed for pickup, you may now view the order in my purchases";
				model.addAttribute("successMsg", succesMsg);
				model.addAttribute("method", "Pickup");
				return "User/payment-success";
            }
            
        } catch (PayPalRESTException e) {
         System.out.println(e.getMessage());
        }
        return "redirect:/cart";
    }
    
//	-----------------
//	Pickup Management
//	-----------------
    @GetMapping("/pickup-management")
    public String pickupManagementPage(Model model) {
    	
    	return "Staff/pickup-management";
    }
    
    @GetMapping("/delivery-management")
    public String deliveryManagementPage(Model model) {
    	
    	return "Staff/pickup-management";
    }
}
