package com.jumpstart.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jumpstart.entities.Role;
import com.jumpstart.entities.User;
import com.jumpstart.services.UserService;

@Controller
public class AdminController {

	@Autowired
	UserService userService;
	
	private User findUser(String username) {
		return userService.findUsername(username);
	}
	
//	-----------------------
//	User Management Display
//	-----------------------
	@GetMapping("/user-management")
	public String userManagementPage(Model model) {
		
		List<User> users = userService.showAllUser();
		List<Role> roles = userService.getAllRoles();
		
		model.addAttribute("users", users);
		model.addAttribute("allRoles", roles);
		
		return "Admin/user-management";
	}
	
//	------------------
//	Reassign User Role
//	------------------
	@PostMapping("reassign_user")
	public void reassignUser(@RequestParam("username") String username, @RequestParam("roleString") String role) {
		
		User selectedUser = findUser(username);
		userService.assignNewRole(selectedUser, role);
		return;
	}
	
//	---------------------
//	Edit User Information
//	---------------------
	@PostMapping("edit_user_info")
	public String editUserInfo(@ModelAttribute("user") User user, @RequestParam String username,
			RedirectAttributes redir) {
		
		User selectedUser = findUser(username);
		
		selectedUser.setFullname(user.getFullname());
		selectedUser.setEmail(user.getEmail());
		selectedUser.setMobile(user.getMobile());
		selectedUser.setAddress(user.getAddress());
		
		userService.updateUser(selectedUser);
		
		String successMsg = "User: " + selectedUser.getFullname() + "'s information has been updated";
		redir.addFlashAttribute("successMsg", successMsg);
		
		return "redirect:/user-management";
	}
	
//	-----------
//	Delete User
//	-----------
    @GetMapping("delete_user")
    public String deleteUser(@RequestParam Long uId, RedirectAttributes redir) {
    	
    	System.out.println("User UID: " + uId + "deleted");
//		userService.deleteUser(uid);
    	
    	String successMsg = "User successfully deleted (inactive)";
		redir.addFlashAttribute("successMsg", successMsg);
	
	return "redirect:/user-management";
    }
}
