package com.SpringStarter.example.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.SpringStarter.example.Domain.User;
import com.SpringStarter.example.service.UserService;




@org.springframework.stereotype.Controller
public class Controller {
	
	@Autowired UserService userservice;
	
	
	
	@RequestMapping("/")
	public String main() {
		return "/Index";
		
	}
	@RequestMapping("/beforeSignUp")
	public String beforeSignUp() {
		return "/signup";
	}
	@RequestMapping("/CreateMember")
	public String signUp(User user) {
		String encodedPassword = new BCryptPasswordEncoder().encode(user.getPassword());
		user.setPassword(encodedPassword);
		user.setAccountNonExpired(true);
		user.setEnabled(true);
		user.setAccountNonLocked(true);
		user.setCredentialsNonExpired(true);
		user.setAuthorities(AuthorityUtils.createAuthorityList("Role_USER"));
		user.setAuthorities(AuthorityUtils.createAuthorityList("Role_ADMIN"));
		userservice.createUser(user);
		userservice.createAuthorities(user);
		return"/Success";
	}
	@RequestMapping("/login")
	public String beforelogin(Model model) {
		return "/login";
	}
}
