package com.mom.momhome.game;

import java.util.List;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("gameDao")
public class GameDaoImp implements GameDao {

	@Autowired
	SqlSessionTemplate sm;
	
	@Override
	public void insert(GameDto dto) {
		sm.insert("insert", dto);
	}

	@Override
	public GameDto getView(String id) {
		// TODO Auto-generated method stub
		return sm.selectOne("view",id);
	}
	@Override
	public void delete(int id) {
		
		sm.delete("delete", id);
	}

	@Override
	public void update(GameDto dto) {
		sm.update("update", dto);
		
	}

	@Override
	public List<GameDto> getList(GameDto dto) {
		// TODO Auto-generated method stub
		return sm.selectList("list", dto);
	}

	@Override
	public int getTotal(GameDto dto) {
		// TODO Auto-generated method stub
		return sm.selectOne("getTotal",dto);
	}




}
