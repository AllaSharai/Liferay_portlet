package com.alla.sharai.model;

public class Document {
	private String title;
	private String text;
	
	public Document() {
		this.title = null;
		this.text = null;
	}
	
	public Document(String title, String text){
		this.title = title;
		this.text = text;
	}
	
	public String getTitle() {
		return title;
	}
	
	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getText() {
		return text;
	}
	
	public void setText(String text) {
		this.text = text;
	}
}

