package com.helloworld.root.board.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.helloworld.root.board.dto.BoardInfoDTO;
import com.helloworld.root.board.dto.BoardRecoDTO;
import com.helloworld.root.board.service.BoardFileService;
import com.helloworld.root.board.service.BoardService;

@Controller
@RequestMapping("board")
public class BoardController {
	@Autowired BoardService bs;
	@Autowired BoardFileService bfs;
	
	@GetMapping("main")
	public String main(Model model,
			@RequestParam(value="num", required = false, defaultValue = "1") int num,
			@RequestParam (value="boardLocal", required = false, defaultValue = "전체") String boardLocal) {
		model.addAttribute("boardLocal", boardLocal);
		if(boardLocal.equals("전체")) {
			bs.boardList(model, num);
		}else {
			bs.categoryBoardList(model, num, boardLocal);
		}
		return "board/main";
	}
	
	@RequestMapping("search")
	public String search(@RequestParam String search, @RequestParam String searchWord,
			Model model, @RequestParam(value="num", required = false, defaultValue = "1") int num) {
		System.out.println(search);
		System.out.println(searchWord);
		bs.search(model, num, search, searchWord);
		
		return "board/searchView";
	}
	
	@GetMapping("likelist")
	public String likeBoardList(Model model, @RequestParam String userId,
			@RequestParam(value="num", required = false, defaultValue = "1") int num) {
		bs.boardLikeList(model, num, userId);
		return "board/likeList";
	}
	
	@RequestMapping("write")
	public String write(@RequestParam String boardLocal, Model model) {
		model.addAttribute("boardLocal", boardLocal);
		return "board/writeForm";
	}
	
	@PostMapping("writesave")
	public void writeSave(MultipartHttpServletRequest mul, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String message = bs.writeSave(mul, request);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(message);
	}
	
	@GetMapping("contentview")
	public String contentView(@RequestParam int boardId, Model model) {
		bs.contentView(boardId, model);
		return "board/contentView";
	}

	@PostMapping(value="like", produces = "application/json; charset=utf-8")
	@ResponseBody
	public int boardLike(@RequestBody BoardInfoDTO dto) {
		System.out.println("ajax boardId : " + dto.getBoardId());
		System.out.println("ajax userId : " + dto.getUserId());
		int boardId = dto.getBoardId();
		String userId = dto.getUserId();
		int result = bs.boardLike(boardId, userId);
		return result;
	}
	
	@PostMapping(value="boardcheck", produces = "application/json; charset=utf-8")
	@ResponseBody
	public HashMap<String, Integer> boardCheckLike(@RequestBody BoardInfoDTO dto) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		System.out.println("ajax boardId : " + dto.getBoardId());
		System.out.println("ajax userId : " + dto.getUserId());
		int boardId = dto.getBoardId();
		String userId = dto.getUserId();
		map = bs.boardCheck(boardId, userId);
		return map;
	}
	
	@PostMapping(value="good", produces = "application/json; charset=utf-8")
	@ResponseBody
	public HashMap<String, Integer> goodClick(@RequestBody BoardRecoDTO dto) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map = bs.goodClick(dto);
		return map;
	}
	
	@PostMapping(value="bad", produces = "application/json; charset=utf-8")
	@ResponseBody
	public HashMap<String, Integer> badClick(@RequestBody BoardRecoDTO dto) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map = bs.badClick(dto);
		return map;
	}
	
	@GetMapping("download")
	public void download(@RequestParam String pictureName, HttpServletResponse response) throws Exception {
		response.addHeader("Content-disposition", "attachment; pictureName=" + pictureName);
		File file = new File(BoardFileService.IMAGE_REPO + "/" + pictureName);
		FileInputStream in = new FileInputStream(file);
		FileCopyUtils.copy(in, response.getOutputStream());
		in.close();
	}
	
	@GetMapping("delete")
	public void boardDelete(@RequestParam int boardId, @RequestParam String pictureName,
			HttpServletResponse response, HttpServletRequest request) throws Exception {
		String message = bs.boardDelete(boardId, pictureName, request);
		System.out.println(boardId);
		System.out.println(pictureName);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(message);
	}
	
	@GetMapping("modifyform")
	public String modifyForm(@RequestParam int boardId, Model model) {
		bs.modifyForm(boardId, model);
		return "board/modifyForm";
	}
	
	@PostMapping("modify")
	public void modify(MultipartHttpServletRequest mul, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String message = bs.modify(mul, request);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(message);
	}
	
	@GetMapping("how")
	public String how() {
		return "board/how";
	}
}
