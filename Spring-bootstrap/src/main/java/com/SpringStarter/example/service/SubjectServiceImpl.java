package com.SpringStarter.example.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.SpringStarter.example.Domain.Subject;
import com.SpringStarter.example.mapper.SubjectMapper;

@Service
public class SubjectServiceImpl implements SubjectService{
	@Autowired SubjectMapper subjectmapper;

	@Override
	public List<Subject> readSubject(int num) {
		return subjectmapper.readSubject(num);
	}

	@Override
	public void createSubject(Subject subject) {
		subject.setSubjectboardcount(0);
		subject.setSubjectmembercount(0);
		subjectmapper.createSubject(subject);
	}

	@Override
	public void deleteSubject(Subject subject) {
		subjectmapper.deleteSubject(subject);
	}

}
