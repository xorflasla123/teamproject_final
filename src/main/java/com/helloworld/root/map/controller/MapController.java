package com.helloworld.root.map.controller;

import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("map")

public class MapController {
	
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

}
