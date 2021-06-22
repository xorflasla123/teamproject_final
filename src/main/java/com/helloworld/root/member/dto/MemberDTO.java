package com.helloworld.root.member.dto;

public class MemberDTO {
	private String id;
	private String pwd;
	private String name;
	private String email;
	private String num;
	private String addr;
	private int email_chk;
	

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}

	public int getEmail_chk() {
		return email_chk;
	}
	public void setEmail_chk(int email_chk) {
		this.email_chk = email_chk;
	}
	

}
