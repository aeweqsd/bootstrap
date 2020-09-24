package com.SpringStarter.example.Controller;



import java.security.Principal;
import java.util.ArrayList;
import java.util.List;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.SpringStarter.example.Domain.*;
import com.SpringStarter.example.service.*;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;





@org.springframework.stereotype.Controller
public class Controller {
	
	private final Logger logger =  LoggerFactory.getLogger(this.getClass());
	@Autowired UserService userservice;
	@Autowired ObjectMapper objectmapper;
	@Autowired SubjectService subjectservice;
	@Autowired BoardService boardservice;
	@Autowired NoteService noteservice;
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
	public String read_subejct(@RequestParam("val") int value,Model model) {
		
		List<Subject> list = subjectservice.readSubject(value);
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
		subject.setmaxpage(boardservice.maxpage(subjectname));
		if(subject.getcurrentpage() ==0) {
			subject.setcurrentpage(1);
		}
		List<Board> list = boardservice.readBoard(subject);
		model.addAttribute("list",list);
		model.addAttribute("subjectname",subjectname);
		model.addAttribute("maxpage",subject.getmaxpage());
		return "/boardshow";
	}
	@RequestMapping("/boardcreating")
	public String createboard(@RequestParam("Data") String data) throws JsonMappingException, JsonProcessingException {
		Board board = new Board();
		board = objectmapper.readValue(data,Board.class);
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
	@RequestMapping(value="/likedelete", method = RequestMethod.DELETE)
	public String deletelike(Thumbs_up thumb) {
		boardservice.deletethumb(thumb);
		return "/Success";
	}
	@RequestMapping("/deleteboard")
	public String deleteboard(Board board) {
		boardservice.deleteBoard(board.getIdboard());
		return "/Success";
	}
	@RequestMapping("/boardmodified")
	@ResponseBody
	public String boardmodified(Board board) throws JsonProcessingException {
		board =boardservice.readoneBoard(board.getIdboard());
		String a = objectmapper.writeValueAsString(board);
		return a;
	}
	@RequestMapping("/mydata")
	public String mydata() {
		
		return "/mydata";
	}
	@RequestMapping("/shownote")
	public String shownote(Principal principal,Model model) {
		User user = new User();
		user = (User)((Authentication) principal).getPrincipal();
		model.addAttribute("usernumber", user.getUsernumber());
		return "/shownote";
	}
	@RequestMapping("/check_id")
	@ResponseBody
	public String checkid(@RequestParam("id")String id) throws JsonProcessingException {
		Note note = new Note();
		int idreceiver  = noteservice.checkreceiver(id);
		note.setIdreceiver(idreceiver);
		String s = objectmapper.writeValueAsString(note);
		return s;
	}
	@RequestMapping("/sendmessage")
	@ResponseBody
	public String sendmessage(Note note) throws JsonProcessingException {
		noteservice.createnote(note);
		String s= objectmapper.writeValueAsString(note);
		return s;
	}
	@RequestMapping("/readnote")
	public String readnote(@RequestParam("usernumber") int usernumber,Model model) {
		Note note = new Note();
		note.setIdreceiver(usernumber);
		List<Note> list = noteservice.readnotelist(note);
		model.addAttribute("list", list);
		return "/notelist";
	}
	@RequestMapping("/deletenote")
	@ResponseStatus(value = HttpStatus.OK)
	public String deletenote(@RequestBody List<Note> note) {
		noteservice.deletenote(note);
		return "/";
	}
	
}
