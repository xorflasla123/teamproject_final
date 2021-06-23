package com.helloworld.root;

import java.net.URLEncoder;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	@GetMapping("index")
	public String index() {
		System.out.println("index 실행");
		return "index";
	}
	
	@GetMapping("navigate")
	public String navigate() {
		System.out.println("길찾기 실행");
		return "navigate";
	}
	
	@GetMapping("navi")
	public String navi(HttpServletRequest request) throws Exception{
		
		String dep = request.getParameter("dep");
		String arr = request.getParameter("arr");
		
		dep = URLEncoder.encode(dep,"UTF-8");
		arr = URLEncoder.encode(arr,"UTF-8");
		
		return "redirect:https://map.kakao.com/?sName="+dep+"&eName="+arr;
	}
	
}
