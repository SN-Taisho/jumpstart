package com.jumpstart.entities;

import java.util.HashSet;
import java.util.Objects;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;

@Entity
public class User {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
//	User Credentials
	private String fullname;
	private String username;
	private String password;
	
//	Account Verification
	private String OTP;
	private Boolean activated;
	
	
	@ManyToMany
    @JoinTable( name="user_role",
                joinColumns = @JoinColumn(name = "user_id"),
                inverseJoinColumns = @JoinColumn(name = "role_id"))
    private Set<Role> roles = new HashSet<>();

//	Contact Details
	private String email;
	private String mobile;
	private String address;
	
	
//  Constructors
    public User() {

    }

	public User(String username, String password) {
		super();
		this.username = username;
		this.password = password;
	}

	public User(String username, Set<Role> roles, String password) {
		super();
		this.username = username;
		this.roles = roles;
		this.password = password;
	}

	public User(String fullname, String username, Set<Role> roles, String password) {
		super();
		this.fullname = fullname;
		this.username = username;
		this.roles = roles;
		this.password = password;
	}

	public User(Long id, String fullname, String username, String password, String oTP, Boolean activated,
			Set<Role> roles, String email, String mobile, String address) {
		super();
		this.id = id;
		this.fullname = fullname;
		this.username = username;
		this.password = password;
		OTP = oTP;
		this.activated = activated;
		this.roles = roles;
		this.email = email;
		this.mobile = mobile;
		this.address = address;
	}

	
//	Getter Setters
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getFullname() {
		return fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getOTP() {
		return OTP;
	}

	public void setOTP(String oTP) {
		OTP = oTP;
	}

	public Boolean getActivated() {
		return activated;
	}

	public void setActivated(Boolean activated) {
		this.activated = activated;
	}

	public Set<Role> getRoles() {
		return roles;
	}

	public void setRoles(Set<Role> roles) {
		this.roles = roles;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	
	public String getAddress() {
		return address;
	}
	
	public void setAddress(String address) {
		this.address = address;
	}
	
	
// Equals and Hash
	@Override
	public boolean equals(Object o) {
	    if (this == o) return true;
	    if (o == null || getClass() != o.getClass()) return false;
	    User user = (User) o;
	    return username.equals(user.username) &&
	            password.equals(user.password);
	}
	
	@Override
	public int hashCode() {
	    return Objects.hash(username, password);
	}
	
	
//	To String
	@Override
	public String toString() {
		return "User [id=" + id + ", fullname=" + fullname + ", username=" + username + ", password=" + password
				+ ", OTP=" + OTP + ", activated=" + activated + ", roles=" + roles + ", email=" + email + ", mobile="
				+ mobile + "]";
	}
}
