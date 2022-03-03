package com.mom.momhome.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

//서블릿으로부터 중간에 가로채서 세션에 있는 로그온 정보에 따라서 분기를 결정할 클래스
//HandlerInterceptorAdapter를 상속받아야함
public class LoginInterceptor extends HandlerInterceptorAdapter{
	//함수 두개를 오버라이딩해야함.(마우스우클릭 source-override 혹은 컨트롤스페이스)
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		System.out.println("***********************************************");
		System.out.println("Login Interceptor");
		System.out.println("***********************************************");
		//true를 리턴하면 하던거 마저하고
		//false를 반환하면 원래 요청을 막는다
		//모든 url요청이 이 인터셉터의 preHandler호출하도록 되어있음
		//로그온이 되어있으면 true반환해서 원래 가던길 가고 
		//로그온이 안되어있으면 false반환해서 가던길 막고 로그온 페이지로 이동시킨다
		//이 클래스는 만들어만 두고 servlet-context.xml에서 이 파일을 적용하도록 설정해야함
		
		Object user_id=session.getAttribute("user_id");
		if(user_id!=null) //null이 아니면 로드인 된 상태
			return true;
		//로그인이 안된 상태라면 로그인 페이지로 리다이렉트시킴. 다른 페이지로 못감.
		response.sendRedirect(request.getContextPath()+"/member/login");
		return false;
			
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		super.postHandle(request, response, handler, modelAndView);
	}
	
	
}



