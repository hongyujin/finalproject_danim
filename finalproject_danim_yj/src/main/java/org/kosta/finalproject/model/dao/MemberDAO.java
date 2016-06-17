package org.kosta.finalproject.model.dao;

import org.kosta.finalproject.model.vo.member.MemberVO;

public interface MemberDAO {

	public abstract MemberVO checkLogin(MemberVO vo);

}