package com.mom.momhome.csanswer;

public class CSAnswerDto {
	String CSANSWER_ID = "";
	int listId = 0;
	String ANS_CONTENT = "";
	String ANS_DATE = "";
	
	public String getCSANSWER_ID() {
		return CSANSWER_ID;
	}
	public void setCSANSWER_ID(String cSANSWER_ID) {
		CSANSWER_ID = cSANSWER_ID;
	}
	public int getListId() {
		return listId;
	}
	public void setListId(int listId) {
		this.listId = listId;
	}
	public String getANS_CONTENT() {
		return ANS_CONTENT;
	}
	public void setANS_CONTENT(String aNS_CONTENT) {
		ANS_CONTENT = aNS_CONTENT;
	}
	public String getANS_DATE() {
		return ANS_DATE;
	}
	public void setANS_DATE(String aNS_DATE) {
		ANS_DATE = aNS_DATE;
	}
	
}
