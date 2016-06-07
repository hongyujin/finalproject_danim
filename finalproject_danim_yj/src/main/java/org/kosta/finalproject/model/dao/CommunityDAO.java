package org.kosta.finalproject.model.dao;

import java.util.List;

import org.kosta.finalproject.model.vo.CommunityVO;

public interface CommunityDAO {

	public abstract List<CommunityVO> getCommList(int rownum);

	public void registerComm(CommunityVO paramVO);

}