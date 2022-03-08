package com.mom.momhome.membership;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("membershipDao")
public class MembershipDaoImpl implements MembershipDao{

	@Autowired
	SqlSessionTemplate sm;
	
	@Override
	public void insertMembership(MembershipDto dto) {
		sm.insert("Membership_insert", dto);
	}

	@Override
	public MembershipDto getMembership(String user_key) {
		return sm.selectOne("Membership_getMembership", user_key);
	}

}
