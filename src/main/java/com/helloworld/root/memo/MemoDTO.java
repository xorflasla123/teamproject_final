package com.helloworld.root.memo;

public class MemoDTO {
	private String user_id;
	private int memo_id;
	private String title;
	private String content;
	private String saveDate;

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public int getMemo_id() {
		return memo_id;
	}

	public void setMemo_id(int memo_id) {
		this.memo_id = memo_id;
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

	public String getSaveDate() {
		return saveDate;
	}

	public void setSaveDate(String saveDate) {
		this.saveDate = saveDate;
	}

}
