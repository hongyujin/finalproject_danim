package org.kosta.finalproject.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.kosta.finalproject.model.service.CommunityService;
import org.kosta.finalproject.model.vo.CommLikeVO;
import org.kosta.finalproject.model.vo.CommunityVO;
import org.kosta.finalproject.model.vo.MemberVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CommController {
	@Resource
	private CommunityService commService;
	@RequestMapping("community_list.do")
	public ModelAndView getCommList(int rownum){
		List<CommunityVO> list = commService.getCommList(rownum);
//		List<CommLikeVO> commLikeList = commService.getLikePosted();
/*		for (CommunityVO cvo : list) {
			String text = cvo.getContent();
			Pattern pattern = Pattern.compile("<img[^>]*src=[\"']?([^>\"']+)[\"']?[^>]*>"); //img 태그 src 추출 정규표현식
	        Matcher matcher = pattern.matcher(text);
	         
	        while(matcher.find()){
	            cvo.setContent(matcher.group(0));
	        }
		}*/
//		CommListVO lvo = commService.getCommList(rownum);
		ModelAndView mv = new ModelAndView("community_list", "commList", list);
//		mv.addObject("commLikeList",commLikeList);
//		return new ModelAndView("community_list", "commLVO", lvo);
		return mv;
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
	
	@RequestMapping("comm_updateLike.do")
	@ResponseBody
	public int updateCommunity(HttpServletRequest request, int commNo){
//		List<CommLikeVO> list = commService.getLikePosted();
		HttpSession session = request.getSession(false);
		
		CommLikeVO clvo = new CommLikeVO(commNo);
		MemberVO mvo = (MemberVO) session.getAttribute("mvo");
		if (session != null || mvo != null) {
			clvo.setId(mvo.getId());
		}
		
		return commService.updateLikePosted(clvo);
//		return commService.findLikeByNo(commNo);
	}
}
