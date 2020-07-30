package com.mycompany.project.dao;

import org.springframework.stereotype.Repository;

import com.mycompany.project.model.LoginForm;
import com.mycompany.project.model.Member;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;

@Repository
public class MemberDao extends EgovAbstractMapper{

	public Member selectByMid(String mid)
	{
		Member member = selectOne("member.selectByMid", mid);
		return member;
	}

	public int insert(Member member) 
	{
		return insert("member.insert", member);
	}
}
