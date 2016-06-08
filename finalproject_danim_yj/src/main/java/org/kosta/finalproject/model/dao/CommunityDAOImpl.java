package org.kosta.finalproject.model.dao;

import java.util.List;

import javax.annotation.Resource;

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
	public int updateLike(int commNo){
		return template.update("community.updateLike", commNo);
	}
	
	@Override
	public int findLikeByCommNo(int commNo){
		return template.selectOne("community.findLikeByCommNo", commNo);
	}
}
