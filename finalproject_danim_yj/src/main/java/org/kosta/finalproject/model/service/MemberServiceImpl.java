package org.kosta.finalproject.model.service;

import javax.annotation.Resource;

import org.kosta.finalproject.model.dao.MemberDAO;
import org.kosta.finalproject.model.vo.member.MemberVO;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Resource
	private MemberDAO memberDAO;
	
	@Override
	public MemberVO checkLogin(MemberVO vo){
		return memberDAO.checkLogin(vo);
	}
}
