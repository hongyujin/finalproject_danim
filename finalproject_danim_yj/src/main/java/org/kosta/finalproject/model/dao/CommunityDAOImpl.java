package org.kosta.finalproject.model.dao;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.finalproject.model.vo.CommLikeVO;
import org.kosta.finalproject.model.vo.CommunityVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class CommunityDAOImpl implements CommunityDAO {
	@Resource
	private SqlSessionTemplate template;

	@Override
	public List<CommunityVO> getCommList(int rownum){
		return template.selectList("community.getCommlist", rownum);
	}
	
	@Override
	public void registerComm(CommunityVO paramVO){
		template.insert("community.registerComm", paramVO);
	}
	
	@Override
	public List<CommLikeVO> getLikePosted(){
		return template.selectList("community.getLikePosted");
	}
	
	@Override
	public int updateLikePosted(CommLikeVO paramVO){
		return template.insert("community.updateLikePosted",paramVO);
	}
	
	@Override
	public void deleteLikePosted(CommLikeVO paramVO){
		template.delete("community.deleteLikePosted",paramVO);
	}

	@Override
	public int findLikeByCommNo(int comm_no) {
		if((template.selectOne("community.findLikeByNo",comm_no))==null){
			return 0;
		}
		return template.selectOne("community.findLikeByNo",comm_no);
	}
	
	
	@Override
	public int findLikeByIdAndNo(CommLikeVO paramVO){
		return template.selectOne("community.findLikeByIdAndNo",paramVO);
	}
}
