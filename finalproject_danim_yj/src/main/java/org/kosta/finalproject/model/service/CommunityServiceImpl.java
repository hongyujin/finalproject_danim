package org.kosta.finalproject.model.service;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.finalproject.model.dao.CommunityDAO;
import org.kosta.finalproject.model.vo.CommunityVO;
import org.springframework.stereotype.Service;

@Service
public class CommunityServiceImpl implements CommunityService {
	@Resource
	private CommunityDAO commDAO;
	
	@Override
	public List<CommunityVO> getCommList(int rownum){
		return commDAO.getCommList(rownum);
	}
	
	@Override
	public void registerComm(CommunityVO paramVO){
		commDAO.registerComm(paramVO);
	}
}
