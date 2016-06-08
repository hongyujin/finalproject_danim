package org.kosta.finalproject.model.service;

import java.util.List;

import org.kosta.finalproject.model.vo.CommunityVO;

public interface CommunityService {

	public abstract List<CommunityVO> getCommList(int rownum);

	public void registerComm(CommunityVO paramVO);

	public int updateLikeResult(int commNo);

}