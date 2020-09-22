package com.SpringStarter.example.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.SpringStarter.example.Domain.Note;

@Mapper
public interface NoteMapper {
	public void createnote(Note note);
	public void readnote(Note note);
	public void deletenote(Note note);
	public List<Note> readnotelist(Note note);
	public int checkreceiver(String username);
}
