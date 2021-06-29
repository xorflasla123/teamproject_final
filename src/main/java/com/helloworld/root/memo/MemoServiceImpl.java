package com.helloworld.root.memo;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	public Map<String,Object> selectAllMemoList(Model model, int num,String userId,HttpSession session) {
		Map<String,Object> map = new HashMap<String,Object>();
		int allCount = mapper.selectMemoCount(userId); // 글 총 개수 얻어오기 
		int pageLetter = 4; //한 페이지에 3개의 글 표현 
		int repeat = allCount / pageLetter;
		if(allCount % pageLetter != 0) {
			repeat += 1;
		
	}
	int end = num * pageLetter; //end - 마지막 페이징 번호 
	int start = end + 1 - pageLetter;
	map.put("list", mapper.selectAllMemoList(start,end,userId));
	map.put("repeat", repeat);
	//model.addAttribute("memoList",mapper.selectAllMemoList(start,end,userId));
	return map;
}

	@Override
	public void mapView(int memo_id, Model model) {
		model.addAttribute("memo_id", mapper.mapView(memo_id));
		
	}


	@Override
	public MemoDTO modishow(int memo_id) {
		MemoDTO dto = new MemoDTO();
		dto = mapper.modishow(memo_id);
		return dto;
	}


	@Override
	public int modiMemo(MemoDTO dto) {
		int result = mapper.modiMemo(dto);
		return result;
	}


	@Override
	public int delete1(int memo_id) {
		int result = mapper.delete(memo_id);
		return result;
	}

	

	
	

}
