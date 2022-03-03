package com.mom.momhome.join;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("matchingJoinDao")
public class MatchingJoinImp implements MatchingJoinDao {
	
	@Autowired
	SqlSessionTemplate sm;
	@Override
	public Character joinornot(MatchingJoinDto dto) {
		// TODO Auto-generated method stub
		Character cnt = sm.selectOne("joinornot", dto);
		
			return cnt;
	

}
	@Override
	public void insert(MatchingJoinDto dto) {
		sm.insert("joininsert", dto);

	}
}
