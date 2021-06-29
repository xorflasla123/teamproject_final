package com.helloworld.root.memo;


import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.helloworld.root.member.session_name.MemberSessionName;

@Controller
public class MemoController implements MemberSessionName{
	@Autowired MemoService ms;
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
	@RequestMapping("memoView")
	public String contentView() {
		return "memoView";
	}
	

}
