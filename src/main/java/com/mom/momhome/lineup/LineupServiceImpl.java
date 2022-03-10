package com.mom.momhome.lineup;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Service("lineupService")
public class LineupServiceImpl implements LineupService{

	@Resource(name="lineupDao")
	LineupDao lineupDao;

	@Override
	public List<LineupDto> getList(LineupDto dto) {
		return lineupDao.getList(dto);
	}

	@Override
	public List<LineupPlayerDto> getPlayerList(String teamkey) {
		return lineupDao.getPlayerList(teamkey);
	}
	
    @Override
    public LineupPlayerDto getPlayer(String userkey) {
        return lineupDao.getPlayer(userkey);
    }

	@Override
	public void delete(LineupDto dto) {
		lineupDao.delete(dto);
	}

	@Override
	public void update(LineupDto dto) {
		lineupDao.update(dto);
	}

	@Override
	public void insert_userDummy(LineupPlayerDto dto) {
		lineupDao.insert_userDummy(dto);
	}
	
	@Override
	public void insert_teamDummy(LineupTeamDto dto) {
		lineupDao.insert_teamDummy(dto);
	}
	
	@Override
	public void insert_membershipDummy(LineupMembershipDto dto) {
		lineupDao.insert_membershipDummy(dto);
	}
	
	@Override
	public void insert_gameDummy(LineupGameDto dto) {
		lineupDao.insert_gameDummy(dto);
	}

	@Override
	public void saveLineups( Map<String, Object> jsonDatas) 
	{
		JSONArray arr = JSONArray.fromObject(jsonDatas.get("newLineupList"));
		
		//1.기존 라인업 전부 삭제
		LineupDto deleteDto = new LineupDto();
		deleteDto.setGame_key(((JSONObject)arr.get(0)).getString("game_key"));
		deleteDto.setTeam_side(((JSONObject)arr.get(0)).getString("team_side"));
		lineupDao.delete(deleteDto);
		
		//2.새로운 라입업 삽입.
		Map<String, Object> paramMap = new HashMap<String, Object>();
		List<Map<String, Object>> resendMapList = new ArrayList<Map<String, Object>>();
		Map<String, Object> resendMap;
		
//		List<LineupDto> dtoList = new ArrayList<LineupDto>();
		
		for(int i = 0; i < arr.size(); i++)
		{
			JSONObject obj = (JSONObject)arr.get(i);

			resendMap = new HashMap<String, Object>();
			resendMap.put("user_key", obj.get("user_key"));
			resendMap.put("team_key", obj.get("team_key"));
			resendMap.put("game_key", obj.get("game_key"));
			resendMap.put("code_key", obj.get("code_key"));
			resendMap.put("team_side", obj.get("team_side"));
			resendMap.put("lineup_index", obj.get("lineup_index"));
			resendMap.put("mercenary_state", obj.get("mercenary_state"));
			resendMapList.add(resendMap);
			
//			LineupDto dto = new LineupDto();
//			dto.setUser_key(obj.getString("user_key"));
//			dto.setUser_key(obj.getString("team_key"));
//			dto.setUser_key(obj.getString("game_key"));
//			dto.setUser_key(obj.getString("code_key"));
//			dto.setUser_key(obj.getString("team_side"));
//			dto.setUser_key(obj.getString("lineup_index"));
//			dto.setUser_key(obj.getString("mercenary_state"));
//			dtoList.add(dto);
		}
		paramMap.put("resendMapList", resendMapList);
		lineupDao.insert(paramMap);
	}
}
















