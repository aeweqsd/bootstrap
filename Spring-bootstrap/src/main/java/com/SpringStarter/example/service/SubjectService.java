package com.SpringStarter.example.service;

import java.util.List;

import com.SpringStarter.example.Domain.Subject;

public interface SubjectService {
	public List<Subject> readSubject(int num);
	public void createSubject(Subject subject);
	public void deleteSubject(Subject subject);

}
