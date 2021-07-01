package com.helloworld.root.mybatis.memo;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.helloworld.root.memo.MemoDTO;

public interface MemoMapper {
	public int delete(int memo_id);
	public int modify(MemoDTO dto);
	public int addMemo(MemoDTO dto);
	public List<MemoDTO> selectAllMemoList(@Param("s") int start, @Param("e") int end, @Param("userId") String userId);
	public MemoDTO mapView(int memo_id);
	public int selectMemoCount(String userId);
	public MemoDTO modishow(int memo_id);
	public int modiMemo(MemoDTO dto);
}
