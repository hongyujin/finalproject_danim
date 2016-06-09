package org.kosta.finalproject.model.service;

import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.annotation.Resource;

import org.kosta.finalproject.model.dao.CommunityDAO;
import org.kosta.finalproject.model.vo.CommLikeVO;
import org.kosta.finalproject.model.vo.CommunityVO;
import org.springframework.stereotype.Service;

@Service
public class CommunityServiceImpl implements CommunityService {
	@Resource
	private CommunityDAO commDAO;
	
	@Override
	public List<CommunityVO> getCommList(int rownum){
		List<CommunityVO> list = commDAO.getCommList(rownum);
//		List<CommLikeVO> commLikeList = commDAO.getLikePosted();
		for (CommunityVO cvo : list) {
			String text = cvo.getContent();
			Pattern pattern = Pattern.compile("<img[^>]*src=[\"']?([^>\"']+)[\"']?[^>]*>"); //img 태그 src 추출 정규표현식
	        Matcher matcher = pattern.matcher(text);
	         
	        while(matcher.find()){
	            cvo.setContent(matcher.group(0));
	        }
		}
		/*CommListVO lvo = new CommListVO(list, commLikeList);
		return lvo;*/
		return list;
	}
	
	@Override
	public void registerComm(CommunityVO paramVO){
		commDAO.registerComm(paramVO);
	}
	
	@Override
	public int updateLikePosted(CommLikeVO paramVO){
		int findNo = commDAO.findLikeByIdAndNo(paramVO);
		if(findNo==1){
			commDAO.deleteLikePosted(paramVO);
		}else{
			commDAO.updateLikePosted(paramVO);
		}
		return commDAO.findLikeByCommNo(paramVO.getComm_no());
	}
	
	@Override
	public int findLikeByNo(int commNo){
		return commDAO.findLikeByCommNo(commNo);
	}
	
}
