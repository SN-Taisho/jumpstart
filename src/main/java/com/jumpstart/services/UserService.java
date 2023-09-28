package com.jumpstart.services;

import java.util.HashSet;
import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.jumpstart.entities.Purchase;
import com.jumpstart.entities.Role;
import com.jumpstart.entities.User;
import com.jumpstart.repositories.PurchaseRepository;
import com.jumpstart.repositories.RoleRepository;
import com.jumpstart.repositories.UserRepository;

@Service
@Transactional
public class UserService {

	@Autowired
	UserRepository userRepo;
	
	@Autowired
	RoleRepository roleRepo;
	
	@Autowired
	PurchaseRepository purchaseRepo;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
//	-----------------
//	USER REGISTRATION
//	-----------------
	public String save(User user) {
		
		String encodedPassword = passwordEncoder.encode(user.getPassword());
		user.setPassword(encodedPassword);
		user.setRoles(new HashSet<>(roleRepo.findBySpecificRoles("User")));
		
		userRepo.save(user);
		
		return "User saved successfully";
	}
//	ENCRYPT PASSWORD
	public String encodePassword(String password) {
		String encodedPassword = passwordEncoder.encode(password);
		return encodedPassword;
	}

//	--------------
//	OTP
//	--------------
	public Boolean activate(String username) {
		
		User user = userRepo.findByUsername(username);
		if (user == null || user.getActivated()) {
			return false;
		}
		else {
			userRepo.activate(user.getId());
			return true;
		}
	}
	
	public String updateOTP(User user) {
		userRepo.save(user);
		return "New OTP created";
	}
	
	
//	--------------
//	USER RETRIEVAL
//	--------------
	public List<User> showAllUser(){
		return userRepo.findAll();
	}
	
	public List<Role> getAllRoles() {
		return roleRepo.findAll();
	}
	
	public User findUsername(String username) {
		return userRepo.findByUsername(username);
	}
	
	public Optional<User> getUserInfo(long uid){
		return userRepo.findById(uid);
	}
	
	public User findEmail(String email) {
		return userRepo.findByEmail(email);
	}

	public User findLoginUser(String username) {
		return userRepo.findByUsername(username);
	}
	
//	---------------
//	USER MANAGEMENT
//	---------------
	public void updateUser(User user) {
		userRepo.save(user);
	}
	
	public void assignNewRole(User user, String role) {
		user.getRoles().clear();
		user.setRoles(new HashSet<>(roleRepo.findBySpecificRoles(role)));
		userRepo.save(user);
	}
	
	public void deleteUser(long uid) {
		User user = userRepo.getById(uid);
		List<Purchase> allUserPurchase= purchaseRepo.findByUser(user);
		
		for (Purchase purchase : allUserPurchase) {
			purchaseRepo.delete(purchase);
		}
		userRepo.deleteById(uid);
	}
}
