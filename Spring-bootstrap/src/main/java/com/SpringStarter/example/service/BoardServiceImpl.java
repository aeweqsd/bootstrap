package com.SpringStarter.example.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.SpringStarter.example.Domain.Board;
import com.SpringStarter.example.Domain.Thumbs_up;
import com.SpringStarter.example.mapper.BoardMapper;
import com.SpringStarter.example.mapper.SubjectMapper;
import com.SpringStarter.example.mapper.ThumbMapper;


@Service
public class BoardServiceImpl implements BoardService{
	@Autowired BoardMapper boardmapper;
	@Autowired ThumbMapper thumbmapper;
	@Autowired SubjectMapper subjectmapper;
	@Override
	public List<Board> readBoard(String subjectname) {
		subjectmapper.updatesubjectmembercount(subjectname);
		return boardmapper.readBoard(subjectname);
	}
	@Override
	public void createBoard(Board board) {
		String subject = board.getBoardsubject();
		subjectmapper.updatesubjectboardcount(subject);
		boardmapper.createBoard(board);
		
	}
	@Override
	public void deleteBoard(int idboard) {
		thumbmapper.deleteboard(idboard);
		boardmapper.deleteBoard(idboard);
	}
	@Override
	public Board readoneBoard(int idboard) {
		return boardmapper.readoneBoard(idboard);
	}
	@Override
	public void createthumb(Thumbs_up thumbs_up) {
		thumbmapper.createthumb(thumbs_up);
		boardmapper.updatelikenum(thumbs_up.getIdboard());
	}
	@Override
	public boolean isthumb(Thumbs_up thumbs_up) {
		return thumbmapper.isthumb(thumbs_up);
	}
	@Override
	public void deletethumb(Thumbs_up thumbs_up) {
		boardmapper.deletelikenum(thumbs_up.getIdboard());
		thumbmapper.deletethumb(thumbs_up);
		
	}
	@Override
	public int maxpage(String subjectname) {
		return boardmapper.maxpage(subjectname);
	}

}
