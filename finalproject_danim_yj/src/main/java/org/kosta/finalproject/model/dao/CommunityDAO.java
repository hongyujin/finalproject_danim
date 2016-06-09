package org.kosta.finalproject.model.dao;

import java.util.List;

import org.kosta.finalproject.model.vo.CommLikeVO;
import org.kosta.finalproject.model.vo.CommunityVO;

public interface CommunityDAO {

	public abstract List<CommunityVO> getCommList(int rownum);

	public void registerComm(CommunityVO paramVO);

	public List<CommLikeVO> getLikePosted();

	public int updateLikePosted(CommLikeVO paramVO);

	public void deleteLikePosted(CommLikeVO paramVO);

	public int findLikeByCommNo(int comm_no);

	public int findLikeByIdAndNo(CommLikeVO paramVO);

}