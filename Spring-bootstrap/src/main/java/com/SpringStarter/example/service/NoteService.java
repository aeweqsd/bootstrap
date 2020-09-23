package com.SpringStarter.example.service;

import java.util.List;

import com.SpringStarter.example.Domain.Note;

public interface NoteService {
	public void createnote(Note note);
	public List<Note> readnotelist(Note note);
	public void deletenote(Note note);
	public int checkreceiver(String id);
	

}
