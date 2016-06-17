package org.kosta.finalproject.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.kosta.finalproject.model.service.MemberService;
import org.kosta.finalproject.model.vo.member.MemberVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MemberController {
	
	@Resource
	private MemberService memberService;
	
	@RequestMapping(value="login.do", method = RequestMethod.POST)
	public String checkLogin(HttpServletRequest request,MemberVO vo){
		HttpSession session=request.getSession();
		MemberVO mvo=memberService.checkLogin(vo);
		if(mvo!=null){
			session.setAttribute("mvo", mvo);
			return "home";
		}
		return "member/login_result";
	}
	@RequestMapping("logout.do")
	public ModelAndView logout(HttpServletRequest request){
		HttpSession session=request.getSession(false);
		if(session!=null)
		session.invalidate();
		return new ModelAndView("home");
	}
}
