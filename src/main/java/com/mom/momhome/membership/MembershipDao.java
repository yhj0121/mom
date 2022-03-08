package com.mom.momhome.membership;

public interface MembershipDao {
	void insertMembership(MembershipDto dto);
	MembershipDto getMembership(String user_key);
}
