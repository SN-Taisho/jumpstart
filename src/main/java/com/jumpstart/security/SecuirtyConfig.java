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
                    .antMatchers(HttpMethod.GET, "/login").permitAll()
                    .antMatchers(HttpMethod.GET, "/registration").permitAll()
                    .antMatchers(HttpMethod.GET, "/about-us").permitAll()      
                    .antMatchers(HttpMethod.GET, "/contact-us").permitAll() 
                    .antMatchers(HttpMethod.GET, "/privacy-policy").permitAll() 
                    .antMatchers(HttpMethod.GET, "/terms-and-conditions").permitAll() 
                    
//                    .antMatchers(HttpMethod.GET, "/homepage").hasAnyRole("User", "Admin")
//                    .antMatchers(HttpMethod.GET, "/my-profile").hasAnyRole("User", "Admin")
//                    .antMatchers(HttpMethod.POST, "update_profile").hasAnyRole("User", "Admin")
//                    .antMatchers(HttpMethod.GET, "/view-profile").hasAnyRole("User", "Admin")
//                    .antMatchers(HttpMethod.GET, "/search").hasAnyRole("User", "Admin")
//                    .antMatchers(HttpMethod.GET, "/thread-search").hasAnyRole("User", "Admin")
//                    .antMatchers(HttpMethod.GET, "/job-search").hasAnyRole("User", "Admin")
//                    .antMatchers(HttpMethod.GET, "/user-results").hasAnyRole("User", "Admin")
//                    .antMatchers(HttpMethod.GET, "/thread-results").hasAnyRole("User", "Admin")
//                    .antMatchers(HttpMethod.GET, "/job-results").hasAnyRole("User", "Admin")
//                    .antMatchers(HttpMethod.GET, "/jobs").hasAnyRole("User", "Admin")
//                    .antMatchers(HttpMethod.GET, "/job-post").hasAnyRole("User", "Admin")
//                    .antMatchers(HttpMethod.POST, "/respond_job_post").hasAnyRole("User", "Admin")
//                    .antMatchers(HttpMethod.GET, "delete_response").hasAnyRole("User", "Admin")
//                    .antMatchers(HttpMethod.GET, "/create-thread").hasAnyRole("User", "Admin")
//                    .antMatchers(HttpMethod.POST, "create_thread").hasAnyRole("User", "Admin")
//                    .antMatchers(HttpMethod.POST, "update_thread").hasAnyRole("User", "Admin")
//                    .antMatchers(HttpMethod.GET, "delete_thread").hasAnyRole("User", "Admin")
//                    .antMatchers(HttpMethod.GET, "/thread").hasAnyRole("User", "Admin")
//                    .antMatchers(HttpMethod.POST, "reply_thread").hasAnyRole("User", "Admin")
//                    .antMatchers(HttpMethod.POST, "update_reply").hasAnyRole("User", "Admin")
//                    .antMatchers(HttpMethod.GET, "delete_reply").hasAnyRole("User", "Admin")
//                    
//                    .antMatchers(HttpMethod.GET, "/create-job-post").hasRole("Admin")
//                    .antMatchers(HttpMethod.POST, "create_job_post").hasRole("Admin")
//                    .antMatchers(HttpMethod.POST, "edit_job_post").hasRole("Admin")
//                    .antMatchers(HttpMethod.GET, "delete_job_post").hasRole("Admin")
//                    .antMatchers(HttpMethod.POST, "update_response").hasRole("Admin")
//                    .antMatchers(HttpMethod.GET, "delete_user_response").hasRole("Admin")
//                    .antMatchers(HttpMethod.GET, "/user-management").hasRole("Admin")
//                    .antMatchers(HttpMethod.POST, "reassign_user").hasRole("Admin")
//                    .antMatchers(HttpMethod.POST, "update_user_profile").hasRole("Admin")
//                    .antMatchers(HttpMethod.POST, "delete_user").hasRole("Admin")
//                    .antMatchers(HttpMethod.GET, "/bulk-mail").hasRole("Admin")
//                    .antMatchers(HttpMethod.GET, "/send-bulk-mail").hasRole("Admin")
//                    .antMatchers(HttpMethod.POST, "/send_bulk_mail").hasRole("Admin")
//                    .antMatchers(HttpMethod.GET, "/view-mail").hasRole("Admin")
                .and()
                .logout()
                    .logoutSuccessUrl("/logout")
                    .invalidateHttpSession(true);
        
        http.exceptionHandling().accessDeniedPage("/access-denied");
    }
}
