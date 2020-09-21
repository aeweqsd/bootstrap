package com.SpringStarter.example.Domain;



public class Subject {
	private int idsubject;
	private String subjectname;
	private int subjectboardcount;
	private int currentpage;
	private int maxpage;
	public int getCurrentpage() {
		return currentpage;
	}
	public void setCurrentpage(int currentpage) {
		this.currentpage = currentpage;
	}
	public int getMaxpage() {
		return maxpage;
	}
	public void setMaxpage(int maxpage) {
		this.maxpage = maxpage;
	}
	public int getSubjectboardcount() {
		return subjectboardcount;
	}
	public void setSubjectboardcount(int subjectboardcount) {
		this.subjectboardcount = subjectboardcount;
	}
	public int getSubjectmembercount() {
		return subjectmembercount;
	}
	public void setSubjectmembercount(int subjectmembercount) {
		this.subjectmembercount = subjectmembercount;
	}
	private int subjectmembercount;
	public int getIdsubject() {
		return idsubject;
	}
	public void setIdsubject(int idsubject) {
		this.idsubject = idsubject;
	}
	public String getSubjectname() {
		return subjectname;
	}
	public void setSubjectname(String subjectname) {
		this.subjectname = subjectname;
	}
}
