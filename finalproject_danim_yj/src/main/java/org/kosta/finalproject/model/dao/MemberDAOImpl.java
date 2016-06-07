package org.kosta.finalproject.model.dao;

import javax.annotation.Resource;

import org.kosta.finalproject.model.vo.MemberVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAOImpl implements MemberDAO {
	@Resource
	private SqlSessionTemplate template;

	@Override
	public MemberVO checkLogin(MemberVO vo){
		return template.selectOne("member.checkLogin",vo);
	}
}
