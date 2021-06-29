package com.helloworld.root.board.service;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.helloworld.root.board.dto.BoardRecoDTO;

public interface BoardService {
	public String writeSave(MultipartHttpServletRequest mul, HttpServletRequest request);
	public void categoryBoardList(Model model, int num, String boardLocal);
	public void boardList(Model model, int num);
	public void boardLikeList(Model model, int num, String userId);
	public void contentView(int boardId, Model model);
	public int boardLike(int boardId, String userId);
	public HashMap<String, Integer> boardCheck(int boardId, String userId);
	public HashMap<String, Integer> goodClick(BoardRecoDTO dto);
	public HashMap<String, Integer> badClick(BoardRecoDTO dto);
	public String boardDelete(int boardId, String pictureName, HttpServletRequest request);
	public void modifyForm(int boardId, Model model);
	public String modify(MultipartHttpServletRequest mul, HttpServletRequest request);
	public void search(Model model, int num, String search, String searchWord);
}
