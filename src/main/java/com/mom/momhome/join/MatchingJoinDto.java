package com.mom.momhome.join;

public class MatchingJoinDto {
	private int MATCHINGJOIN_KEY;	
	private int TEAM_KEY;	
	private Character RESULT_PROC='N';
	public int getMATCHINGJOIN_KEY() {
		return MATCHINGJOIN_KEY;
	}
	public void setMATCHINGJOIN_KEY(int mATCHINGJOIN_KEY) {
		MATCHINGJOIN_KEY = mATCHINGJOIN_KEY;
	}
	public int getTEAM_KEY() {
		return TEAM_KEY;
	}
	public void setTEAM_KEY(int tEAM_KEY) {
		TEAM_KEY = tEAM_KEY;
	}
	public char getRESULT_PROC() {
		return RESULT_PROC;
	}
	public void setRESULT_PROC(char rESULT_PROC) {
		RESULT_PROC = rESULT_PROC;
	}
	
}
