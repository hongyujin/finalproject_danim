package org.kosta.finalproject.model.vo;

import java.util.List;

public class CommListVO {
	private List<CommunityVO> commList;
	private List<CommLikeVO> commLikeList;
	public CommListVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CommListVO(List<CommunityVO> commList, List<CommLikeVO> commLikeList) {
		super();
		this.commList = commList;
		this.commLikeList = commLikeList;
	}
	public List<CommunityVO> getcommList() {
		return commList;
	}
	public void setcommList(List<CommunityVO> commList) {
		this.commList = commList;
	}
	public List<CommLikeVO> getcommLikeList() {
		return commLikeList;
	}
	public void setcommLikeList(List<CommLikeVO> commLikeList) {
		this.commLikeList = commLikeList;
	}
	@Override
	public String toString() {
		return "CommListVO [commList=" + commList + ", commLikeList=" + commLikeList
				+ "]";
	}
	
	
}
