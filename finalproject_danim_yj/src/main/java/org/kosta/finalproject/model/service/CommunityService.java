package org.kosta.finalproject.model.service;

import java.util.List;

import org.kosta.finalproject.model.vo.CommLikeVO;
import org.kosta.finalproject.model.vo.CommunityVO;

public interface CommunityService {

	public List<CommunityVO> getCommList(int rownum);

	public void registerComm(CommunityVO paramVO);

	public int updateLikePosted(CommLikeVO paramVO);

	public int findLikeByNo(int commNo);

//	public List<CommLikeVO> getLikePosted();

}