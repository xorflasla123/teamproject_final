package com.helloworld.root.board.dto;

public class BoardDTO {
	private int boardId;
	private String boardLocal;
	private String userId;
	private String title;
	private String content;
	private String day;
	private String picture;
	
	public int getBoardId() {
		return boardId;
	}
	public void setBoardId(int boardId) {
		this.boardId = boardId;
	}
	public String getBoardLocal() {
		return boardLocal;
	}
	public void setBoardLocal(String boardLocal) {
		this.boardLocal = boardLocal;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
}
