package com.helloworld.root.board.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.helloworld.root.board.service.BoardFileService;
import com.helloworld.root.board.service.BoardService;

@Controller
@RequestMapping("board")
public class BoardController {
	@Autowired BoardService bs;
	@Autowired BoardFileService bfs;
	
	@GetMapping("main")
	public String main(Model model,
			@RequestParam(value="num", required = false, defaultValue = "1") int num) {
		System.out.println("board main 실행");
		bs.boardList(model, num);
		return "board/main";
	}
	@RequestMapping("write")
	public String write() {
		return "board/writeForm";
	}
	@PostMapping("writesave")
	public String writeSave(MultipartHttpServletRequest mul, HttpServletRequest request) throws Exception {
		bs.writeSave(mul, request);
		return "board/main";
	}
}
