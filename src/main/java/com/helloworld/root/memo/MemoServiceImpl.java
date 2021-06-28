package com.helloworld.root.memo;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.helloworld.root.mybatis.memo.MemoMapper;



@Service
public class MemoServiceImpl implements MemoService{
	@Autowired MemoMapper mapper;
	@Override
	public int addMemo(MemoDTO dto) {
		int result = mapper.addMemo(dto);
		return result;
	
	}

	
	@Override
	public List<MemoDTO> selectAllMemoList(Model model, int num,String userId,HttpSession session) {
		int allCount = mapper.selectMemoCount(userId); // 글 총 개수 얻어오기 
		int pageLetter = 4; //한 페이지에 3개의 글 표현 
		int repeat = allCount / pageLetter;
		if(allCount % pageLetter != 0) {
			repeat += 1;
		
	}
	int end = num * pageLetter; //end - 마지막 페이징 번호 
	int start = end + 1 - pageLetter;
	session.setAttribute("repeat",repeat);
	
	//model.addAttribute("memoList",mapper.selectAllMemoList(start,end,userId));
	return mapper.selectAllMemoList(start,end,userId);
}

	@Override
	public void mapView(int memo_id, Model model) {
		model.addAttribute("memo_id", mapper.mapView(memo_id));
		
	}

	

	
	

}
