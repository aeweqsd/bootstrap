package com.SpringStarter.example.service;

import java.util.Collection;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.SpringStarter.example.Domain.User;
import com.SpringStarter.example.mapper.UserMapper;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	UserMapper usermapper;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		User user= usermapper.readUser(username);
		user.setAuthorities(getAuthorities(username));
		return user;
	}

	@Override
	public User readUser(String username) {
		return usermapper.readUser(username);
	}

	@Override
	public void createUser(User user) {
		usermapper.createUser(user);
		
	}

	@Override
	public void createAuthorities(User user) {
		usermapper.createAuthority(user);
		
	}

	@Override
	public Collection<GrantedAuthority> getAuthorities(String username) {
		List<GrantedAuthority> authorities = usermapper.readAuthorities(username);

		return authorities;
	}

}
