package com.helloworld.root.mybatis.board;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.helloworld.root.board.dto.BoardDTO;

import com.helloworld.root.board.dto.BoardRecoDTO;

public interface BoardMapper {
	public int writeSave(BoardDTO dto);
	public int boardCount();
	public int categoryCount(String boardLocal);
	public ArrayList<BoardDTO> boardList(@Param("start") int start, @Param("end") int end);
	public int boardLikeCount(String userId);
	public ArrayList<BoardDTO> boardLikeList(@Param("start") int start, @Param("end") int end, @Param("userId") String userId);
	public ArrayList<BoardDTO> categoryBoardList(@Param("start") int start, @Param("end") int end, @Param("boardLocal") String boardLocal);
	public int searchCount(@Param("search") String search, @Param("searchWord") String searchWord);
	public ArrayList<BoardDTO> searchList(@Param("start") int start, @Param("end") int end, @Param("search") String search, @Param("searchWord") String searchWord);
	public void writeInfo();
	public BoardDTO contentView(int boardId);
	public int contentLike(int boardId);
	public int likeCount(@Param("boardId") int boardId, @Param("userId") String userId);
	public int deleteLike(@Param("boardId") int boardId, @Param("userId") String userId);
	public int insertLike(@Param("boardId") int boardId, @Param("userId") String userId);
	public int recoCount(BoardRecoDTO dto);
	public BoardRecoDTO goodNum(BoardRecoDTO dto);
	public int deleteReco(BoardRecoDTO dto);
	public int insertReco(BoardRecoDTO dto);
	public int updateReco(BoardRecoDTO dto);
	public int recommendCount(BoardRecoDTO dto);
	public int goodNumCount(BoardRecoDTO dto);
	public void upHit(int boardId);
	public int delete(int boardId);
	public int modify(BoardDTO dto);
}
