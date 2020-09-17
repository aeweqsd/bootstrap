package com.SpringStarter.example.Controller;


import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.SpringStarter.example.Domain.Subject;
import com.SpringStarter.example.Domain.User;
import com.SpringStarter.example.service.SubjectService;
import com.SpringStarter.example.service.UserService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;




@org.springframework.stereotype.Controller
public class Controller {
	
	private final Logger logger =  LoggerFactory.getLogger(this.getClass());
	@Autowired UserService userservice;
	@Autowired ObjectMapper objectmapper;
	@Autowired SubjectService subjectservice;
	
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
		user.setAuthorities(AuthorityUtils.createAuthorityList("ROLE_USER"));
	
		userservice.createUser(user);
		userservice.createAuthorities(user);
		return"/Success";
	}
	@RequestMapping("/login")
	public String beforelogin(Model model) {
		return "/Index";
	}
	@RequestMapping("/Check_overlap")
	@ResponseBody
	public String idcheck(User user) throws JsonProcessingException {
		String username = user.getUsername();
		user = userservice.readUser(username);
		String jsonString = objectmapper.writeValueAsString(user);
		return jsonString;
		
	}
	@RequestMapping("/admin")
	public String admin() {
		return "/admin";
	}
	@RequestMapping("/read_subject")
	public String read_subejct(Model model) {
		List<Subject> list = subjectservice.readSubject(0);
		model.addAttribute("list", list);
		return "/subjectlist";
	}
	@RequestMapping("/create_subject")
	public String create_subject(Subject subject) {
		subjectservice.createSubject(subject);
		return "/Success";
	}
	
	
}
