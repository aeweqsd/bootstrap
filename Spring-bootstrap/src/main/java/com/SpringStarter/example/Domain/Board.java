package com.SpringStarter.example.Domain;

public class Board {
	private int idboard;
	private String boardname;
	private String boardsubject;
	private String boardcontent;
	private int hit;
	private int likenum;
	private String Datetime;
	public int getIdboard() {
		return idboard;
	}
	public void setIdboard(int idboard) {
		this.idboard = idboard;
	}
	public String getBoardname() {
		return boardname;
	}
	public void setBoardname(String boardname) {
		this.boardname = boardname;
	}
	public String getBoardsubject() {
		return boardsubject;
	}
	public void setBoardsubject(String boardsubject) {
		this.boardsubject = boardsubject;
	}
	public String getBoardcontent() {
		return boardcontent;
	}
	public void setBoardcontent(String boardcontent) {
		this.boardcontent = boardcontent;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public int getLikenum() {
		return likenum;
	}
	public void setLikenum(int likenum) {
		this.likenum = likenum;
	}
	public String getDatetime() {
		return Datetime;
	}
	public void setDatetime(String datetime) {
		Datetime = datetime;
	}
}
