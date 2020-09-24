package com.SpringStarter.example.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.SpringStarter.example.Domain.Note;
import com.SpringStarter.example.mapper.NoteMapper;

@Service
public class NoteServiceImpl implements NoteService{
	@Autowired NoteMapper notemapper;

	@Override
	public void createnote(Note note) {
		notemapper.createnote(note);
		
	}

	@Override
	public List<Note> readnotelist(Note note) {
		List<Note> list = notemapper.readnotelist(note);
		return list;
	}

	@Override
	public void deletenote(List<Note> note) {
		notemapper.deletenote(note);
	}

	@Override
	public int checkreceiver(String id) {
		int a = notemapper.checkreceiver(id);
		return a;
	}


}
