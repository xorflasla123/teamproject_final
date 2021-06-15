package com.helloworld.root.board.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface BoardService {
	public void writeSave(MultipartHttpServletRequest mul, HttpServletRequest request);
	public void boardList(Model model, int num);
}
