package com.helloworld.root.board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.helloworld.root.board.dto.BoardDTO;
import com.helloworld.root.mybatis.board.BoardMapper;

@Service
public class BoardServiceImpl implements BoardService {
	@Autowired BoardMapper mapper;
	@Override
	public void writeSave(MultipartHttpServletRequest mul, HttpServletRequest request) {
		HttpSession session = request.getSession();
		BoardDTO dto = new BoardDTO();
		BoardFileService bfs = new BoardFileServiceImpl();
		dto.setBoardLocal("서울");
		dto.setUserId(mul.getParameter("user_id"));	// 세션넣기(s_project BoardServiceImpl 참고)
		dto.setTitle(mul.getParameter("title"));
		dto.setContent(mul.getParameter("content"));
		MultipartFile file = mul.getFile("board_picture");
		if(file.isEmpty()) {
			dto.setPicture("nan");
		}else {
			dto.setPicture(bfs.savePicture(file));
		}
		int result = mapper.writeSave(dto);
		if(result == 1) {
			System.out.println("성공");
		}else {
			System.out.println("실패");
		}
	}
	@Override
	public void boardList(Model model, int num) {
//		int boardCount = mapper.boardCount();
//		int pageLetter = 3;
//		int repeat = boardCount / pageLetter;
//		if(boardCount % pageLetter != 0) {
//			repeat += 1;
//		}
//		int end = num * pageLetter;
//		int start = 
	}
	
}
