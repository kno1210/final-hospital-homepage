package com.mycompany.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.project.dao.MemberDao;
import com.mycompany.project.model.LoginForm;
import com.mycompany.project.model.Member;

@Service
public class MemberService {
	
	@Autowired
	private MemberDao memberDao;
	
	public int join(Member member)
	{
		return memberDao.insert(member);
	}

	public Member getMember(String mid) 
	{
		Member member = memberDao.selectByMid(mid);
		return member;
	}
}
