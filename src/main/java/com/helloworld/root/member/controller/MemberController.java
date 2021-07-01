
package com.helloworld.root.member.controller;


import java.io.PrintWriter;
import java.sql.Date;
import java.util.Calendar;

import javax.servlet.http.Cookie;

import javax.servlet.http.HttpServletRequest;



import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.helloworld.root.member.dto.MemberDTO;
import com.helloworld.root.member.service.MemberService;
import com.helloworld.root.member.session_name.MemberSessionName;

@Controller
@RequestMapping("member")
public class MemberController implements MemberSessionName {
	@Autowired
	MemberService ms;

	@GetMapping("/login")
	public String login() {
		System.out.println("로그인 실행");
		return "member/login";
	}

	@PostMapping("user_check")
	public void user_check(HttpServletRequest request,HttpServletResponse response) throws Exception {
		int result = ms.user_check(request);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();

		if(result == 0) {
			//System.out.print(request.getParameter("id"));
			out.print("<script>location.href='successLogin?id="+request.getParameter("id")+"&autoLogin="+request.getParameter("autoLogin")+"';</script>");
		}else {
			out.print("<script>alert('로그인 정보를 확인해주세요.');location.href='login';</script>");
		}
	}

	@RequestMapping("successLogin")
	public String successLogin(@RequestParam(value="id", required = false) String id, 
								@RequestParam (value="autoLogin", required = false)String autoLogin,
								HttpSession session,
								HttpServletResponse response) {
		//System.out.println("successLogin"+id);
		session.setAttribute(LOGIN, id);

		//System.out.println(autoLogin);

		if(autoLogin != null) {
			int limitTime = 60*60*24*30; // 30일
			Cookie loginCookie = new Cookie("loginCookie", id);
			loginCookie.setPath("/");
			loginCookie.setMaxAge(limitTime);
			response.addCookie(loginCookie);

			Calendar cal = Calendar.getInstance();
			cal.setTime(new java.util.Date());
			cal.add(Calendar.MONTH, 1);

			Date limitDate = new Date(cal.getTimeInMillis());
			ms.keepLogin(session.getId(), limitDate, id);
		}
		return "/index";
	}

	@GetMapping("/logout")
	public String logout(HttpSession session, HttpServletResponse response,
						@CookieValue(value = "loginCookie", required = false) Cookie loginCookie) {
		if (session.getAttribute(LOGIN) != null) {
			if (loginCookie != null) {
				loginCookie.setMaxAge(0);
				response.addCookie(loginCookie);

				ms.keepLogin("nono", new Date(System.currentTimeMillis()), (String) session.getAttribute(LOGIN));
				ms.keepLogin("nan", new Date(System.currentTimeMillis()), (String)session.getAttribute(LOGIN));
			}
			session.invalidate();
		}
		return "redirect:/index";
	}

	@GetMapping("register_form")
	public String register_form() {
		return "member/register";
	}


	@PostMapping("register")
	public String register(MemberDTO dto) {
		int result = ms.register(dto);
		if (result == 1) {
			return "redirect:login";
		}
		return "redirect:register_form";
	}

	@GetMapping("/userInfo")
	public String userInfo(Model model) {
		ms.userInfo(model);
		return "member/userInfo";
	}

	@GetMapping("/info")
	public String info(@RequestParam("id") String userId, Model model) {
		ms.info(userId, model);
		return "member/info";
	}


	@GetMapping("save")
	public String save(Model model) {
		return "redirect:/member/userInfo";
	}


	@GetMapping("modify_form")
	public String modify_form(@RequestParam String id, Model model) {
		ms.info(id,model);
		return "member/modify";
	}

	@PostMapping("modify")
	public String modify(MemberDTO dto, Model model) {
		int result = ms.modify(dto);
		if(result==1) {
			model.addAttribute("id", dto.getId()); // 데이터를 가져옴
			return "redirect:info";
		}
		return "redirect:modify_form";
	}

	@GetMapping("delete")
	public String delete(@RequestParam String id, HttpSession session) {
		ms.delete(id);
		session.invalidate();
		return "redirect:/index";		
	}

	@GetMapping("/forgotId")
	public String forgotId() {
		//System.out.println("아이디 찾기 실행");
		return "member/forgotId";
	}

	@PostMapping("/id_check")
	public void id_check(HttpServletRequest request, RedirectAttributes rs, HttpServletResponse response,
			HttpSession session) throws Exception {
		String idChk = ms.id_check(request);

		if(idChk != null) {
			session.setAttribute("email", request.getParameter("email"));
			session.setAttribute("idChk", idChk);
			//System.out.println("아이디찾기 이메일 인증 성공");

			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('메일이 발송 되었습니다. 메일을 확인하세요.'); location.href='/root/sendId';</script>");
		}else {
			//System.out.println("아이디찾기 이메일 인증 실패");
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('등록된 이메일이 없습니다.'); location.href='forgotId'</script>");
		}
	}

	@GetMapping("/forgotPwd")
	public String forgotPwd() {
		//System.out.println("비밀번호 찾기 실행");
		return "member/forgotPwd";
	}

	@PostMapping("/pwd_check")
	public void pwd_check(HttpServletRequest request, RedirectAttributes rs, HttpServletResponse response,
			HttpSession session) throws Exception {
		String pwdChk = ms.pwd_check(request);

		if(pwdChk != null) {
			session.setAttribute("email", request.getParameter("email"));
			session.setAttribute("pwdChk", pwdChk);
			//System.out.println("비밀번호찾기 이메일 인증 성공");

			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('메일이 발송 되었습니다. 메일을 확인하세요.'); location.href='/root/sendPwd';</script>");
		} else {
			//System.out.println("비밀번호찾기 이메일 인증 실패");
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('등록된 이메일이 없습니다.'); location.href='forgotPwd'</script>");
		}
	}
	
	@ResponseBody
	@PostMapping("id_chk")
	public int id_chk(@RequestBody String id1 ) {
		//System.out.println("id_chk 실행");
		id1 = id1.replace("\"", ""); //쌍따옴표 없애는 법
		//System.out.println("11"+id1);
		int chkId = ms.id_chk(id1);
		
		return chkId;
	}


}
