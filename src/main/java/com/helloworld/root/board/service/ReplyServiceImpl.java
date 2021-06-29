package com.helloworld.root.board.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.helloworld.root.board.dto.BoardRepDTO;
import com.helloworld.root.mybatis.board.ReplyMapper;

@Service
public class ReplyServiceImpl implements ReplyService{
	@Autowired ReplyMapper mapper;

	@Override
	public void addReply(Map<String, Object> map) {
		BoardRepDTO dto = new BoardRepDTO();
		if(map.get("group_id")==null) {
			dto.setBoard_id(Integer.parseInt((String)(map.get("board_id"))));
			dto.setUser_id((String)map.get("user_id"));
			dto.setContent((String)map.get("content"));
			dto.setLayer(0);
			mapper.addReply(dto);
		}else {
			dto.setBoard_id(Integer.parseInt((String)(map.get("board_id"))));
			dto.setUser_id((String)map.get("user_id"));
			dto.setContent((String)map.get("content"));
			dto.setLayer(1);
			dto.setId(Integer.parseInt((String)(map.get("group_id"))));
			mapper.addReply2(dto);
		}
		
	}

	@Override
	public List<BoardRepDTO> getRepList(int board_id) {
		return mapper.getRepList(board_id);
	}

	@Override
	public void removeReply(Map<String, Object> map) {
		//System.out.println(map.get("layer"));
		
		if((int)map.get("layer") == 1) { //layer 1 == 자식 댓글(대댓글)
			mapper.removeReply(map);
		} else if((int)map.get("layer") == 0){ //layer 0 == 부모 댓글
			mapper.removeAllRep(map);
		}
	}
}
