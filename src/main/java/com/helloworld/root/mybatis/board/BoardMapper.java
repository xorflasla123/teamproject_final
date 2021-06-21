package com.helloworld.root.mybatis.board;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.helloworld.root.board.dto.BoardDTO;
import com.helloworld.root.board.dto.BoardInfoDTO;

public interface BoardMapper {
	public int writeSave(BoardDTO dto);
	public int boardCount();
	public int categoryCount(String boardLocal);
	public ArrayList<BoardDTO> boardList(@Param("start") int start, @Param("end") int end);
	public ArrayList<BoardDTO> categoryBoardList(@Param("start") int start, @Param("end") int end, @Param("boardLocal") String boardLocal);
	public int searchCount(@Param("search") String search, @Param("searchWord") String searchWord);
	public ArrayList<BoardDTO> searchList(@Param("start") int start, @Param("end") int end, @Param("search") String search, @Param("searchWord") String searchWord);
	public void writeInfo();
	public BoardDTO contentView(int boardId);
	public int contentLike(int boardId);
	public int likeCount(@Param("boardId") int boardId, @Param("userId") String userId);
	public int deleteLike(@Param("boardId") int boardId, @Param("userId") String userId);
	public int insertLike(@Param("boardId") int boardId, @Param("userId") String userId);
	public void upHit(int boardId);
	public int delete(int boardId);
	public int modify(BoardDTO dto);
}
