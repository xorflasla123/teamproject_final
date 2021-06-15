package com.helloworld.root.mybatis.board;

import com.helloworld.root.board.dto.BoardDTO;

public interface BoardMapper {
	public int writeSave(BoardDTO dto);
}
