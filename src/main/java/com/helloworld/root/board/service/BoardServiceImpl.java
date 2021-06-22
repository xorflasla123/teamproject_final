package com.helloworld.root.board.service;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.helloworld.root.board.dto.BoardDTO;
import com.helloworld.root.board.dto.BoardRecoDTO;
import com.helloworld.root.mybatis.board.BoardMapper;

@Service
public class BoardServiceImpl implements BoardService {
	@Autowired BoardMapper mapper;
	@Override
	public String writeSave(MultipartHttpServletRequest mul, HttpServletRequest request) {
		HttpSession session = request.getSession();
		BoardDTO dto = new BoardDTO();
		BoardFileService bfs = new BoardFileServiceImpl();
		String message = null;
		dto.setBoardLocal(mul.getParameter("boardLocal"));
		dto.setUserId(mul.getParameter("userId"));	// 세션넣기(s_project BoardServiceImpl 참고)
		dto.setTitle(mul.getParameter("title"));
		dto.setContent(mul.getParameter("content"));
		MultipartFile file = mul.getFile("boardPicture");
		if(file.isEmpty()) {
			dto.setPicture("nan");
		}else {
			dto.setPicture(bfs.savePicture(file));
		}
		int result = mapper.writeSave(dto);
		if(result == 1) {
			System.out.println("성공");
			message = "<script>alert('새 글이 추가 되었습니다.'); "
					+ "location.href='" + request.getContextPath() + "/board/main';</script>";
		}else {
			System.out.println("실패");
			message = "<script>alert('문제가 발생했습니다.'); "
					+ "location.href='" + request.getContextPath() + "/board/write';</script>";
		}
		return message;
	}
	@Override
	public void categoryBoardList(Model model, int num, String boardLocal) {
		int boardCount = mapper.categoryCount(boardLocal);
		int pageLetter = 3;
		int repeat = boardCount / pageLetter;
		if(boardCount % pageLetter != 0) {
			repeat += 1;
		}
		int end = num * pageLetter;
		int start = end + 1 - pageLetter;
		model.addAttribute("repeat", repeat);
		model.addAttribute("boardList", mapper.categoryBoardList(start, end, boardLocal));
	}
	@Override
	public void boardList(Model model, int num) {
		int boardCount = mapper.boardCount();
		int pageLetter = 3;
		int repeat = boardCount / pageLetter;
		if(boardCount % pageLetter != 0) {
			repeat += 1;
		}
		int end = num * pageLetter;
		int start = end + 1 - pageLetter;
		model.addAttribute("repeat", repeat);
		model.addAttribute("boardList", mapper.boardList(start, end));
	}
	@Override
	public void search(Model model, int num, String search, String searchWord) {
		int searchCount = mapper.searchCount(search, searchWord);
		System.out.println(searchCount);
		int pageLetter = 3;
		int repeat = searchCount / pageLetter;
		if(searchCount % pageLetter != 0) {
			repeat += 1;
		}
		int end = num * pageLetter;
		int start = end + 1 - pageLetter;
		model.addAttribute("repeat", repeat);
		model.addAttribute("searchList", mapper.searchList(start, end, search, searchWord));
		model.addAttribute("search", search);
		model.addAttribute("searchWord" ,searchWord);
	}
	@Override
	public void contentView(int boardId, Model model) {
		upHit(boardId);
		model.addAttribute("contentData", mapper.contentView(boardId));
		model.addAttribute("contentLike", mapper.contentLike(boardId));
	}
	@Override
	public int boardLike(int boardId, String userId) {
		int result = mapper.likeCount(boardId, userId);
		if(result != 0) {
			mapper.deleteLike(boardId, userId);
		}else {
			mapper.insertLike(boardId, userId);
		}
		return mapper.contentLike(boardId);
	}
	@Override
	public HashMap<String, Integer> boardCheck(int boardId, String userId) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		BoardRecoDTO dto = new BoardRecoDTO();
		dto.setGood(1);
		dto.setBoardId(boardId);
		dto.setUserId(userId);
		map.put("like", mapper.likeCount(boardId, userId));
		map.put("total", mapper.recommendCount(dto));
		map.put("good", mapper.goodNumCount(dto));
		return map;
	}
	@Override
	public HashMap<String, Integer> goodClick(BoardRecoDTO dto) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		int result = mapper.recoCount(dto);
		if(result != 0) {	// 데이터가 있을 때
			dto = mapper.goodNum(dto);
			int num = dto.getGood();
			if(num == 1) {	// good
				mapper.deleteReco(dto);
			}else {			// bad
				dto.setGood(1);
				mapper.updateReco(dto);
			}
		}else {				// 데이터가 없을 때
			dto.setGood(1);
			mapper.insertReco(dto);
		}
		map.put("total", mapper.recommendCount(dto));
		map.put("good", mapper.goodNumCount(dto));
		
		return map;
	}
	@Override
	public HashMap<String, Integer> badClick(BoardRecoDTO dto) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		int result = mapper.recoCount(dto);
		if(result != 0) {	// 데이터가 있을 때
			dto = mapper.goodNum(dto);
			int num = dto.getGood();
			if(num == 1) {	// good
				dto.setGood(2);
				mapper.updateReco(dto);
			}else {			// bad
				mapper.deleteReco(dto);
			}
		}else {				// 데이터가 없을 때
			dto.setGood(2);
			mapper.insertReco(dto);
		}
		map.put("total", mapper.recommendCount(dto));
		map.put("bad", mapper.goodNumCount(dto));
		return map;
	}
	private void upHit(int boardId) {
		mapper.upHit(boardId);
	}
	@Override
	public String boardDelete(int boardId, String pictureName, HttpServletRequest request) {
		BoardFileService bfs = new BoardFileServiceImpl();
		String message = null;
		int result = mapper.delete(boardId);
		if(result == 1) {
			bfs.deleteImage(pictureName);
			message = "<script>alert('삭제 되었습니다.'); "
					+ "location.href='" + request.getContextPath() + "/board/main';</script>";
		}else {
			message = "<script>alert('삭제 중 문제가 발생했습니다.'); "
					+ "location.href='" + request.getContextPath() + "/board/contentview';</script>";
		}
		return message;
	}
	@Override
	public void modifyForm(int boardId, Model model) {
		model.addAttribute("contentData", mapper.contentView(boardId));
	}
	@Override
	public String modify(MultipartHttpServletRequest mul, HttpServletRequest request) {
		BoardDTO dto = new BoardDTO();
		String message = null;
		dto.setBoardLocal(mul.getParameter("boardLocal"));
		dto.setBoardId(Integer.parseInt(mul.getParameter("boardId")));
		dto.setTitle(mul.getParameter("title"));
		dto.setContent(mul.getParameter("content"));
		
		MultipartFile file = mul.getFile("pictureName");
		BoardFileService bfs = new BoardFileServiceImpl();
		if(file.isEmpty()) {
			dto.setPicture(mul.getParameter("originPictureName"));
		}else {
			dto.setPicture(bfs.savePicture(file));
			bfs.deleteImage(mul.getParameter("originPictureName"));
		}
		int result = mapper.modify(dto);
		if(result == 1) {
			message = "<script>alert('성공적으로 수정 되었습니다.'); "
					+ "location.href='" + request.getContextPath() + "/board/main';</script>";
		}else {
			message = "<script>alert('수정 중 문제가 발생했습니다.'); "
					+ "location.href='" + request.getContextPath() + "/board/modifyform';</script>";
		}
		return message;
	}
}
