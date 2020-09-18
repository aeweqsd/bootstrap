package com.SpringStarter.example.Controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.SpringStarter.example.Domain.*;
import com.SpringStarter.example.service.*;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;




@org.springframework.stereotype.Controller
public class Controller {
	
	private final Logger logger =  LoggerFactory.getLogger(this.getClass());
	@Autowired UserService userservice;
	@Autowired ObjectMapper objectmapper;
	@Autowired SubjectService subjectservice;
	@Autowired BoardService boardservice;
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
	@RequestMapping("/selectsubjectshow")
	public String readsubjectboard(Subject subject, Model model) {
		String subjectname = subject.getSubjectname();
		List<Board> list = boardservice.readBoard(subjectname);
		model.addAttribute("list",list);
		model.addAttribute("subjectname",subjectname);
		return "/boardshow";
	}
	@RequestMapping("/boardcreating")
	public String createboard(Board board) {
		board.setHit(0);
		board.setLikenum(0);
		boardservice.createBoard(board);
		return "/Success";
	}
	@RequestMapping("/selectboard")
	@ResponseBody
	public String selectboard(Thumbs_up thumb) throws JsonProcessingException{
		int idboard = thumb.getIdboard();
		boolean is = boardservice.isthumb(thumb);
		Board board = new Board();
		board = boardservice.readoneBoard(idboard);
		board.setIsthumb(is);
		String jsonString = objectmapper.writeValueAsString(board);
		return jsonString;
	}
	@RequestMapping("/likecreating")
	public String createlike(Thumbs_up thumb) {
		boardservice.createthumb(thumb);
		return "/Success";
	}
	@RequestMapping("/likedelete")
	public String deletelike(Thumbs_up thumb) {
		boardservice.deletethumb(thumb);
		return "/Success";
	}
	
	
}
