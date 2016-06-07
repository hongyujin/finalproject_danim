package org.kosta.finalproject.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.kosta.finalproject.model.service.CommunityService;
import org.kosta.finalproject.model.vo.CommunityVO;
import org.kosta.finalproject.model.vo.MemberVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CommController {
	@Resource
	private CommunityService commService;
	@RequestMapping("community_list.do")
	public ModelAndView getCommList(int rownum){
		List<CommunityVO> list = commService.getCommList(rownum);
		return new ModelAndView("community_list", "commList", list);
	}
	
	@RequestMapping("comm_write.do")
	public String writeCommunity(HttpServletRequest request, CommunityVO paramVO){
		HttpSession session = request.getSession(false);
		if(session!=null || session.getAttribute("mvo")!=null){
			paramVO.setMemberVO((MemberVO) session.getAttribute("mvo"));
		}
		paramVO.setMemberVO(new MemberVO("admin"));
		commService.registerComm(paramVO);
		return "redirect:community_list.do?rownum=5";
	}
}
