package kr.co.rudisfarm.model.commons.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LogoutInterceptor extends HandlerInterceptorAdapter {
	private static final Logger logger = LoggerFactory.getLogger(LogoutInterceptor.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("USER_ID");
		
		if(userId == null || userId.equals("")) {
			logger.info(">> 로그인 된 계정 없음.");
		} else if(userId.equals("admin")) {
			logger.info(">> 관리자 로그아웃.");
			session.invalidate();
			response.sendRedirect(request.getContextPath()+"/");
			
			return false;
		} else {
			logger.info(">> 판매자, 구매자 로그아웃.");
			session.invalidate();
			response.sendRedirect(request.getContextPath()+"/");
			
			return false;
		}
		
		return true;
	}
}
