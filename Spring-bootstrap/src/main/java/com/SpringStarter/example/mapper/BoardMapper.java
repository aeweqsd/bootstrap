package com.SpringStarter.example.mapper;

import java.util.List;
import com.SpringStarter.example.Domain.Board;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BoardMapper {
	public List<Board> readBoard(String subjectname);
	public void createBoard(Board board);
	public void deleteBoard(String boardname);
	public void updateBoard(Board board);
	public void updatelikenum(int Idboard);
	public Board readoneBoard(int Idboard);
}
