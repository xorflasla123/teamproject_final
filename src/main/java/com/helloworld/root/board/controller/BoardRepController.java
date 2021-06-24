package com.helloworld.root.board.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.helloworld.root.board.dto.BoardRepDTO;
import com.helloworld.root.board.service.ReplyService;

@RestController
@RequestMapping("board")
public class BoardRepController {
	@Autowired ReplyService rs;
	
	@PostMapping(value = "addReply", produces = "application/json; charset=utf-8")
	public void addReply(@RequestBody Map<String, Object> map) {
		rs.addReply(map);
	}
	@PostMapping(value = "addReply2", produces = "application/json; charset=utf-8")
	public void addReply2(@RequestBody Map<String, Object> map) {
		rs.addReply(map);
	}
	
	@PostMapping(value = "removeReply", produces = "application/json; charset=utf-8")
	public void removeReply(@RequestBody Map<String, Object> map) {
		rs.removeReply(map);
	}
	
	@GetMapping(value = "replyData/{board_id}", produces = "application/json; charset=utf-8")
	public List<BoardRepDTO> replyData(@PathVariable int board_id){
		System.out.println(board_id);
		return rs.getRepList(board_id);
	}
}
