package com.SpringStarter.example.Domain;

public class Note {
	private int idnote;
	private int idsender;
	private int idreceiver;
	private String content;
	private boolean is_read;
	public int getIdnote() {
		return idnote;
	}
	public void setIdnote(int idnote) {
		this.idnote = idnote;
	}
	public int getIdsender() {
		return idsender;
	}
	public void setIdsender(int idsender) {
		this.idsender = idsender;
	}
	public int getIdreceiver() {
		return idreceiver;
	}
	public void setIdreceiver(int idreceiver) {
		this.idreceiver = idreceiver;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public boolean isIs_read() {
		return is_read;
	}
	public void setIs_read(boolean is_read) {
		this.is_read = is_read;
	}
}
