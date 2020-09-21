package com.SpringStarter.example.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import com.SpringStarter.example.Domain.Subject;
@Mapper
public interface SubjectMapper {
	public List<Subject> readSubject(int num);
	public void createSubject(Subject subject);
	public void deleteSubject(Subject subject);
	public void updatesubjectboardcount(String subjectname);
	public void updatesubjectmembercount(String subjectname);
}
