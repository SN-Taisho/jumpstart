package com.jumpstart.controllers;

import java.io.UnsupportedEncodingException;
import java.security.Principal;
import java.util.Random;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jumpstart.entities.Role;
import com.jumpstart.entities.User;
import com.jumpstart.services.EmailService;
import com.jumpstart.services.RequestService;
import com.jumpstart.services.UserService;

@Controller
public class AuthController {
	
	@Autowired
	UserService userService;
	
	@Autowired
	EmailService emailService;
	
//	------------
//	Registration
//	------------
	@GetMapping("/signup")
	public String reigstrationPage() {
		return "Auth/registration";
	}
	
	@PostMapping("sign_up")
	public String registerNewUser(@ModelAttribute("user") User user, Model model, HttpServletRequest request) 
			throws UnsupportedEncodingException, MessagingException {
	    	
			Random rnd = new Random();
			int number = rnd.nextInt(999999);
			String code = String.format("%06d", number);
			String siteURL = RequestService.getSiteURL(request);
			
			if (userService.findUsername(user.getUsername()) == null
					|| userService.findUsername(user.getUsername()).getUsername() == null
					|| userService.findUsername(user.getUsername()).getEmail() == null) {
				user.setActivated(false);
				user.setOTP(code);
				userService.save(user);
				String verifyURL = siteURL + "/verify-registration?username=" + user.getUsername();
				String toEmail = user.getEmail();
				String subject = "Thank you joining Jumpstart";
				String body = "<p>Dear " + user.getFullname() + ",</p>";
				body += "<p>Thank you for joining Jumpstart, time to start your shopping for quality ethusiast grade products.</p>";
				body += "<p>To activate your account, please verify your account by entering the following code on the verification page:</p>";
				body += "<a href=\"" + verifyURL + "\">" + user.getOTP() + "</a>";
				body += "<p>This one-time-pin will expire in 24 hours, so please activate your account within the day.</p>";
				body += "<p>If you have any questions or issues, please contact our support team at it.support@jumpstart.com.</p>";
				body += "<p>We look forward in providing you the best products and experience.</p>";
				body += "<p>Sincerely,</p>";
				body += "<p>Jumpstart</p>";

				emailService.sendEmail(toEmail, subject, body);
				System.out.println("Verification code for user " + user.getUsername() + ": " + code);
				return "redirect:verify-registration?username=" + user.getUsername();
			}

			System.out.println("Username already exists");
			String errorMsg = "Username already exists";
			model.addAttribute("errorMsg", errorMsg);
			
			return "Auth/registration";
	}
	
//	----------------
//	REGISTRATION OTP
//	----------------
	@GetMapping("/verify-registration")
	public String registrationConfirmationPage(@Param("username") String username, Model model) {
		
		User user = userService.findUsername(username);
		model.addAttribute("username", user.getUsername());
		
		return "Auth/registration-verification";
	}
	
	@PostMapping("verify_registration")
	public String verifyRegistration(@RequestParam String OTP, @RequestParam String username, RedirectAttributes redir) {
		
		User user = userService.findUsername(username);
		
		if (user.getOTP().equals(OTP)) {
			userService.activate(user.getUsername());
			return "redirect:thank-you";
		} 
		else {
			String errorMsg = "Incorrect OTP";
			redir.addFlashAttribute("errorMsg", errorMsg);
			return "redirect:verify-registration";
		}
	}
	
	@GetMapping("/thank-you")
	public String registrationSuccessPage() {
		return "Public/registration-success";
	}
	
//	-----
//	Login
//	-----
	@GetMapping("/login")
	public String loginPage() {
		return "Auth/login";
	}
	
	@GetMapping("/login-success")
	public String loginSuccess(RedirectAttributes redir, Principal principal) {
		
		String username = principal.getName();
		User user = userService.findLoginUser(username);
		
		String[] role = user.getRoles().stream().map(Role::getName).toArray(String[]::new);
		String userRole = role[0];
		
		String[] roleNames = userService.getAllRoles().stream().map(Role::getName).toArray(String[]::new);
		
		for (String roleName : roleNames) {
			if (roleName == userRole) {

				if (userRole.equals("Admin")) {
					System.out.println("Logged as an Admin");
				}
				if (userRole.equals("Staff")) {
					System.out.println("Logged as a Staff Member");
					return "redirect:product-management";
				}
				if (userRole.equals("User")) {
					System.out.println("Logged as a User");
					return "redirect:dashboard";
				}
			}
		}
		
		System.out.println("Login failed");
		String errorMsg = "Login failed";
		redir.addFlashAttribute("errorMsg", errorMsg);
		return "redirect:login";
	}
	
	@GetMapping("/login-error")
	public String loginError(RedirectAttributes redir) {
		
		System.out.println("Incorrect Password or Username");
		
		String errorMsg = "Incorrect Credentials";
		redir.addFlashAttribute("errorMsg", errorMsg);
		return "redirect:login";
	}
	
	@GetMapping("logout")
	public String logout(Model model, RedirectAttributes redir) {
		return "redirect:home";
	}
	
//	---------------
//	FORGOT PASSWORD
//	---------------
	@GetMapping("/forgot-password")
	public String forgotPasswordPage() {
		return "Auth/forgot-password";
	}
	
	@PostMapping("reset_request")
	public String verifyUserEmail(@RequestParam String email, HttpServletRequest request, RedirectAttributes redir)
		throws UnsupportedEncodingException, MessagingException {
		
		if (!(userService.findEmail(email) == null)) {
			User user = userService.findEmail(email);
			String siteURL = RequestService.getSiteURL(request);
			Random rnd = new Random();
			int number = rnd.nextInt(999999);
			String code = String.format("%06d", number);
			user.setOTP(code);
			userService.updateOTP(user);
			String verifyURL = siteURL + "/verify-email?email=" + user.getEmail();
			String toEmail = user.getEmail();
			String subject = "ABC Jobs | Password reset";
			String body = "<p>Dear " + user.getFullname() + ",</p>";
			body += "<p>We have received a request to reset your password for your account. To verify your identity, please enter the one-time-pin to reset your password:</p>";
			body += "<a href=\"" + verifyURL + "\">" + user.getOTP() + "</a>";
			body += "<p>This OTP will expire in 24 hours, so please verify your identity within the day</p>";
			body += "<p>If this request was not made by you, please contact our support team at support@abcjobs.com.</p>";

			emailService.sendEmail(toEmail, subject, body);
			return "redirect:verify-identity?email=" + user.getEmail();
		} 
		else {
			System.out.println("User Not Found");
			String errorMsg = "No account uses this email";
			redir.addFlashAttribute("errorMsg", errorMsg);
			return "redirect:forgot-password";
		}
	}
	
//	-------------------
//	FORGOT PASSWORD OTP
//	-------------------
	@GetMapping("/verify-identity")
	public String passwordResetOTPPage(@Param("email") String email, Model model) {
		User user = userService.findEmail(email);
		model.addAttribute("email", user.getEmail());
		return "Auth/identity-verification";
	}
	
	@PostMapping("verify_identity")
	public String verifyIdentity(@RequestParam String OTP, @RequestParam String email, RedirectAttributes redir) {
		User user = userService.findEmail(email);
    	
    	if(user.getOTP().equals(OTP)) {
    		redir.addFlashAttribute("email", user.getEmail());
        	return "redirect:reset-password";
    	} 
    	else if (!(OTP.length() == 6)) {
			String errorMsg = "Code must be atleast 6 digits.";
			redir.addFlashAttribute("errorMsg", errorMsg);
        	return "redirect:verify-identity?email=" + user.getEmail();
    	} 
    	else {
			String errorMsg = "Incorrect code.";
			redir.addFlashAttribute("errorMsg", errorMsg);
        	return "redirect:verify-identity?email=" + user.getEmail();
    	}
	}
	
	@GetMapping("/reset-password")
	public String resetPasswordPage() {
		return "Auth/reset-password";
	}
	
	@PostMapping("reset_password")
	public String resetPassword(@RequestParam String email, @RequestParam String password) {
		
		User user = userService.findEmail(email);
		user.setPassword(userService.encodePassword(password));
		userService.updateUser(user);
		
		return "redirect:password-changed";
	}
	
	@GetMapping("/password-changed")
	public String paswordChanged() {
		return "Public/password-changed";
	}
	
//	-------------
//	ACCESS DENIED
//	-------------
	@GetMapping("/access-denied")
	public String accessDeniedPage() {
		return "Public/access-denied";
	}
}
