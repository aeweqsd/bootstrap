package com.SpringStarter.example.mapper;

import java.util.List;

import com.SpringStarter.example.Domain.Board;
import com.SpringStarter.example.Domain.Search;
import com.SpringStarter.example.Domain.Subject;
import com.SpringStarter.example.Domain.User;

public interface SearchMapper {
	public List<Board> boardsearch(Search search);
	public List<User> Usersearch(Search search);
	public List<Subject> Subjectsearch(Search search);

}
