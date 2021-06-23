package com.helloworld.root.board.service;

import java.util.List;
import java.util.Map;

import com.helloworld.root.board.dto.BoardRepDTO;

public interface ReplyService {
	public void addReply(Map<String, Object> map);
	public List<BoardRepDTO> getRepList(int board_id);
	public void removeReply(Map<String, Object> map);
}
