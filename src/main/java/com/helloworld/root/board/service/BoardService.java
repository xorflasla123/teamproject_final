package com.helloworld.root.board.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface BoardService {
	public String writeSave(MultipartHttpServletRequest mul, HttpServletRequest request);
	public void boardList(Model model, int num);
	public void contentView(int boardId, Model model);
	public int boardLike(int boardId, String userId);
	public String boardDelete(int boardId, String pictureName, HttpServletRequest request);
	public void modifyForm(int boardId, Model model);
	public String modify(MultipartHttpServletRequest mul, HttpServletRequest request);
	public void search(Model model, int num, String search, String searchWord);
}
