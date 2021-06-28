package com.helloworld.root.mybatis.board;

import java.util.List;
import java.util.Map;

import com.helloworld.root.board.dto.BoardRepDTO;

public interface ReplyMapper {
	public void addReply(BoardRepDTO dto); //댓글 등록(시퀀스=id)
	public void addReply2(BoardRepDTO dto); //대댓글 등록(댓글id=id)
	
	public List<BoardRepDTO> getRepList(int board_id);
	
	public void removeReply(Map<String, Object> map); //대댓글만 삭제
	public void removeAllRep(Map<String, Object> map); //댓글 + 연관된 대댓글 전부
}
