package com.helloworld.root.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("board")
public class BoardController {
	@GetMapping("main")
	public String main() {
		System.out.println("board main 실행");
		return "board/main";
	}
}
