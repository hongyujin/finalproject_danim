package org.kosta.finalproject.model.service;

import org.kosta.finalproject.model.vo.MemberVO;

public interface MemberService {

	public abstract MemberVO checkLogin(MemberVO vo);

}