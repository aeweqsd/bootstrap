package com.SpringStarter.example.Domain;



public class Subject {
	private int idsubject;
	private String subjectname;
	private int subjectboardcount;
	private int currentpage;
	private int maxpage;
	public int getcurrentpage() {
		return currentpage;
	}
	public void setcurrentpage(int currentpage) {
		this.currentpage = currentpage;
	}
	public int getmaxpage() {
		return maxpage;
	}
	public void setmaxpage(int maxpage) {
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
