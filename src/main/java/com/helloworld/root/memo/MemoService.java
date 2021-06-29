package com.helloworld.root.memo;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.helloworld.root.member.dto.MemberDTO;

public interface MemoService {
	public int addMemo(MemoDTO dto);


	public void mapView(int memo_id, Model model);

	public Map<String,Object> selectAllMemoList(Model model, int num, String userId,HttpSession session);


	public MemoDTO modishow(int memo_id);


	public int modiMemo(MemoDTO dto);


	public int delete1(int memo_id);


	

}
