package com.mom.momhome.mercenary;
import com.mom.momhome.common.BaseDto;
public class MercenaryDto extends BaseDto {
	private String mercenary_key = "";
	private String user_key = "";
	private String game_key = "";
	private String mercenary_title = "";
	private String mercenary_contents = "";
	private String mercenary_complete = "1";
	private String reg_date = "";
	private String reg_user = ""; 
	private String chg_date = "";
	private String chg_user = ""; 
	private String mercenary_proc = "1";
	
	public String getMercenary_proc() {
		return mercenary_proc;
	}

	public void setMercenary_proc(String mercenary_proc) {
		this.mercenary_proc = mercenary_proc;
	}

	public String user_name = "";

	public String getMercenary_key() {
		return mercenary_key;
	}

	public void setMercenary_key(String mercenary_key) {
		this.mercenary_key = mercenary_key;
	}

	public String getUser_key() {
		return user_key;
	}

	public void setUser_key(String user_key) {
		this.user_key = user_key;
	}

	public String getGame_key() {
		return game_key;
	}

	public void setGame_key(String game_key) {
		this.game_key = game_key;
	}

	public String getMercenary_title() {
		return mercenary_title;
	}

	public void setMercenary_title(String mercenary_title) {
		this.mercenary_title = mercenary_title;
	}

	public String getMercenary_contents() {
		return mercenary_contents;
	}

	public void setMercenary_contents(String mercenary_contents) {
		this.mercenary_contents = mercenary_contents;
	}

	public String getMercenary_complete() {
		return mercenary_complete;
	}

	public void setMercenary_complete(String mercenary_complete) {
		this.mercenary_complete = mercenary_complete;
	}

	public String getReg_date() {
		return reg_date;
	}

	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}

	public String getReg_user() {
		return reg_user;
	}

	public void setReg_user(String reg_user) {
		this.reg_user = reg_user;
	}

	public String getChg_date() {
		return chg_date;
	}

	public void setChg_date(String chg_date) {
		this.chg_date = chg_date;
	}

	public String getChg_user() {
		return chg_user;
	}

	public void setChg_user(String chg_user) {
		this.chg_user = chg_user;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	
	
	
	
}
