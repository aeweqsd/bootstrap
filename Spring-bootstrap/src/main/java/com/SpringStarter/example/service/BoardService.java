package com.SpringStarter.example.service;

import java.util.List;

import com.SpringStarter.example.Domain.Board;
import com.SpringStarter.example.Domain.Thumbs_up;

public interface BoardService {
	public List<Board> readBoard(String subjectname);
	public void createBoard(Board board);
	public void deleteBoard(String boardname);
	public Board readoneBoard(int idboard);
	public void createthumb(Thumbs_up thumbs_up);
	public boolean isthumb(Thumbs_up thumbs_up);
	public void deletethumb(Thumbs_up thumbs_up);
}
