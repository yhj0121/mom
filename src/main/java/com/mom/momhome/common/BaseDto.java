package com.mom.momhome.common;

public class BaseDto {
   public String key="";
   public String keyword="";
   public int pg=0; 
   public int pageSize=10;
   public int pgGroup=5;
   public int start=0;
   public int rnum=0;
   public String codegroup_id="";
   public String position="";
   public String city="";
   
   
   
   
   public String getCodegroup_id() {
      return codegroup_id;
   }
   
   public void setCodegroup_id(String codegroup_id) {
      this.codegroup_id = codegroup_id;
   }
   public String getPosition() {
      return position;
   }
   public void setPosition(String position) {
      this.position = position;
   }
   public String getCity() {
      return city;
   }
   public void setCity(String city) {
      this.city = city;
   }
   public int getRnum() {
      return rnum;
   }
   public void setRnum(int rnum) {
      this.rnum = rnum;
   }
   public int getStart() {
      return start;
   }
   public void setStart(int start) {
      this.start = start;
   }
   public String getKey() {
      return key;
   }
   public void setKey(String key) {
      this.key = key;
   }
   public String getKeyword() {
      return keyword;
   }
   public void setKeyword(String keyword) {
      this.keyword = keyword;
   }
   public int getPg() {
      return pg;
   }
   public void setPg(int pg) {
      this.pg = pg;
   }
   public int getPageSize() {
      return pageSize;
   }
   public void setPageSize(int pageSize) {
      this.pageSize = pageSize;
   }
   public int getPgGroup() {
      return pgGroup;
   }
   public void setPgGroup(int pgGroup) {
      this.pgGroup = pgGroup;
   }
   
   
   
}
