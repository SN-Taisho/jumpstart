package com.jumpstart.security;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@Configuration
@EnableWebSecurity
public class SecuirtyConfig extends WebSecurityConfigurerAdapter {

	@Bean
    public UserDetailsService userDetailsService() {
        return new UserDetailsServiceImpl();
    }

    @Bean
    public BCryptPasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
    
    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
    	System.out.println("At authentication configure");
        auth.userDetailsService(userDetailsService()).passwordEncoder(passwordEncoder());
    }
    
    @Override
    protected void configure(HttpSecurity http) throws Exception {
 
    	System.out.println("At security configure");
        http
        		
                .formLogin()
                    .loginPage("/login")
                    .loginProcessingUrl("/login")
                    .failureUrl("/login-error")
                    .permitAll()
                    .defaultSuccessUrl("/login-success", true)
                .and()
                .csrf()
                .and()
                .authorizeRequests()
                    .antMatchers("/").permitAll()
                    .antMatchers("/css/**").permitAll()
                    .antMatchers("/images/**").permitAll()
                    .antMatchers("/js/**").permitAll()
                    .antMatchers(HttpMethod.GET, "/favicon.*").permitAll()
                    .antMatchers(HttpMethod.GET, "/home").permitAll()
//                    Login
                    .antMatchers(HttpMethod.GET, "/login").permitAll()
                    .antMatchers(HttpMethod.GET, "/login-success").permitAll()
                    
//                    Forgot Password
                    .antMatchers(HttpMethod.GET, "/forgot-password").permitAll()
                    .antMatchers(HttpMethod.POST, "/reset_request").permitAll()
                    .antMatchers(HttpMethod.GET, "/verify-identity").permitAll()
                    .antMatchers(HttpMethod.POST, "/verify_identity").permitAll()
                    .antMatchers(HttpMethod.GET, "/reset-password").permitAll()
                    .antMatchers(HttpMethod.POST, "/reset_password").permitAll()
                    .antMatchers(HttpMethod.GET, "/password-changed").permitAll() 
                    
//                    Registration
                    .antMatchers(HttpMethod.GET, "/signup").permitAll()
                    .antMatchers(HttpMethod.GET, "/sign_up").permitAll()
                    .antMatchers(HttpMethod.GET, "/verify-registration").permitAll()
                    .antMatchers(HttpMethod.POST, "/verify_registration").permitAll()
                    .antMatchers(HttpMethod.GET, "/thank-you").permitAll()
                    
//                    Public Pages
                    .antMatchers(HttpMethod.GET, "/about-us").permitAll()      
                    .antMatchers(HttpMethod.GET, "/contact-us").permitAll() 
                    .antMatchers(HttpMethod.GET, "/privacy-policy").permitAll() 
                    .antMatchers(HttpMethod.GET, "/terms-and-conditions").permitAll() 
                    
//                    All Roles
                    .antMatchers(HttpMethod.GET, "/my-profile").hasAnyRole("User", "Staff", "Admin")
                    .antMatchers(HttpMethod.GET, "/update_profile").hasAnyRole("User", "Staff", "Admin")
                    .antMatchers(HttpMethod.GET, "/products").hasAnyRole("User", "Staff", "Admin")
                    .antMatchers(HttpMethod.GET, "/product-details").hasAnyRole("User", "Staff", "Admin")
                    .antMatchers(HttpMethod.GET, "/search").hasAnyRole("User", "Staff", "Admin")
                    
                    
//                    User Only
                    .antMatchers(HttpMethod.GET, "/cart").hasRole("User")
                    .antMatchers(HttpMethod.POST, "/add_to_cart").hasRole("User")
                    .antMatchers(HttpMethod.POST, "/edit_cartItem_amount").hasRole("User")
                    .antMatchers(HttpMethod.GET, "/remove_from_cart").hasRole("User")
                    .antMatchers(HttpMethod.GET, "/ongoing-purchases").hasRole("User")
                    .antMatchers(HttpMethod.GET, "/purchases-history").hasRole("User")
                    
//                    User Checkout to Payment
                    .antMatchers(HttpMethod.GET, "/checkout").hasRole("User")
                    .antMatchers(HttpMethod.POST, "/pay_with_paypal").hasRole("User")
                    .antMatchers(HttpMethod.GET, "/paypal-cancel").hasRole("User")
                    .antMatchers(HttpMethod.GET, "/delivery-purchase-success").hasRole("User")
                    .antMatchers(HttpMethod.GET, "/pickup-purchase-success").hasRole("User")
                    
                    
//                    Staff + Admin Only
                    .antMatchers(HttpMethod.GET, "/categories").hasAnyRole("Staff", "Admin")
                    .antMatchers(HttpMethod.POST, "/create_category").hasAnyRole("Staff", "Admin")
                    .antMatchers(HttpMethod.POST, "/edit_category").hasAnyRole("Staff", "Admin")
                    .antMatchers(HttpMethod.GET, "/delete_category").hasAnyRole("Staff", "Admin")
                    
                    .antMatchers(HttpMethod.GET, "/product-management").hasAnyRole("Staff", "Admin")
                    .antMatchers(HttpMethod.GET, "/add-product").hasAnyRole("Staff", "Admin")
                    .antMatchers(HttpMethod.POST, "/add_product").hasAnyRole("Staff", "Admin")
                    .antMatchers(HttpMethod.GET, "/edit-product").hasAnyRole("Staff", "Admin")
                    .antMatchers(HttpMethod.POST, "/edit_product").hasAnyRole("Staff", "Admin")
                    .antMatchers(HttpMethod.POST, "/delete_product").hasAnyRole("Staff", "Admin")
                    
                    .antMatchers(HttpMethod.GET, "/pickup-management").hasAnyRole("Staff", "Admin")
                    .antMatchers(HttpMethod.GET, "/pickup_received").hasAnyRole("Staff", "Admin")
                    .antMatchers(HttpMethod.GET, "/delivery-management").hasAnyRole("Staff", "Admin")
                    .antMatchers(HttpMethod.GET, "/delivery_received").hasAnyRole("Staff", "Admin")
                    
                    
//                    Admin Only
                    .antMatchers(HttpMethod.GET, "/user-management").hasRole("Admin")
                    .antMatchers(HttpMethod.POST, "/reassign_user").hasRole("Admin")
                    .antMatchers(HttpMethod.POST, "/edit_user_info").hasRole("Admin")
                    .antMatchers(HttpMethod.POST, "/delete_user").hasRole("Admin")
                .and()
                .logout()
                    .logoutSuccessUrl("/logout")
                    .invalidateHttpSession(true);
        
        http.exceptionHandling().accessDeniedPage("/access-denied");
    }
}
