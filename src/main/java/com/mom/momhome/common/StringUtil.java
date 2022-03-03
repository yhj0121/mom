package com.mom.momhome.common;

public class StringUtil {

	public static String nullToValue(Object ob, String value) {
		if(ob==null)
			return value;
		else
			return ob.toString();
		
		//어떤값들이  null 값이 들어오면 이걸 두번째 파라미터로 전달된 값을 주기위한 함수이다
		
		//String pg = request.getParameter("pg");
		//if(pg==null) pg="";
		
		//String pg = StringUtil.nullToValue(request.getParameter("pg"), "0"); 
	}
}
