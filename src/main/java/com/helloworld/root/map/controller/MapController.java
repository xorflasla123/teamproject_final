package com.helloworld.root.map.controller;

import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.helloworld.root.member.session_name.MemberSessionName;
import com.helloworld.root.memo.MemoDTO;
import com.helloworld.root.memo.MemoService;

@Controller
@RequestMapping("map")

public class MapController  implements MemberSessionName{
	@Autowired MemoService ms;
	
	@GetMapping("navigate")
	public String navigate() {
		System.out.println("길찾기 실행");
		return "/map/navigate";
	}
	
	@GetMapping("navi")
	public String navi(HttpServletRequest request) throws Exception{
		
		String dep = request.getParameter("dep");
		String arr = request.getParameter("arr");
		
		dep = URLEncoder.encode(dep,"UTF-8");
		arr = URLEncoder.encode(arr,"UTF-8");
		
		return "redirect:https://map.kakao.com/?sName="+dep+"&eName="+arr;
	}
	
	
	@GetMapping("mapView")
	public String test(HttpServletRequest request, Model model) {
		
		String hs;
		
		if(request.getParameter("HomeSearch")!=null) {
			hs = request.getParameter("HomeSearch");
		} else {
			hs = request.getParameter("name");
		}
		
		model.addAttribute("hs",hs);
		
		System.out.println("테스트 실행");
		
		return "map/mapView";
	}
	
	@PostMapping(value="addMemo", produces = "application/json; charset=utf-8")
	@ResponseBody
	public int addMemo(@RequestBody Map<String, Object> map, HttpSession session) {
		MemoDTO dto = new MemoDTO();
		dto.setUser_id((String)session.getAttribute(LOGIN));
		dto.setTitle((String)map.get("title"));
		dto.setContent((String)map.get("content"));
	    int result = ms.addMemo(dto);
	    System.out.println(result);
		return result;
		
	}
	
	@GetMapping(value="memolist/{userId}/{num}", produces = "application/json; charset=utf-8")
	@ResponseBody
	public Map<String,Object> memolist(@PathVariable String userId,@PathVariable int num, Model model,
			 HttpSession session ){
		System.out.println("num :"+num);
		return ms.selectAllMemoList(model,num,userId, session);
	}
	
	@GetMapping(value="modishow/{memo_id}", produces = "application/json; charset=utf-8")
	@ResponseBody
	public MemoDTO modishow(@PathVariable int memo_id){
		return ms.modishow(memo_id);
	}
	
	@PostMapping(value="modiMemo", produces = "application/json; charset=utf-8")
	@ResponseBody
	public int modiMemo(@RequestBody Map<String, Object> map, HttpSession session) {
		MemoDTO dto = new MemoDTO();
		
		dto.setUser_id((String)session.getAttribute(LOGIN));
		dto.setTitle((String)map.get("title"));
		dto.setContent((String)map.get("content"));
		dto.setMemo_id(Integer.parseInt((String)map.get("memo_id")));
		
	    int result = ms.modiMemo(dto);
	    System.out.println(result);
	    
		return result;
	}
	
	@GetMapping(value="delete1/{memo_id}", produces = "application/json; charset=utf-8")
	@ResponseBody
	public int delete1(@PathVariable int memo_id){
		return ms.delete1(memo_id);
	}
	
}
