package com.helloworld.root.memo;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.helloworld.root.member.dto.MemberDTO;

public interface MemoService {
	public int addMemo(MemoDTO dto);


	public void mapView(int memo_id, Model model);

	public List<MemoDTO> selectAllMemoList(Model model, int num, String userId,HttpSession session);


	

}
