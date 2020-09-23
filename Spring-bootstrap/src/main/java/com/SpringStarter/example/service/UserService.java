package com.SpringStarter.example.service;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetailsService;

import com.SpringStarter.example.Domain.User;

public interface UserService extends UserDetailsService {
	public User readUser(String username);
	public void createUser(User user);
	public void createAuthorities(User user);
	Collection<GrantedAuthority> getAuthorities(String username);
	public int readnote(int userid);
}
