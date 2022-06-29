package kr.co.rudisfarm.model.commons.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class cartCheckInterceptor extends HandlerInterceptorAdapter {
	private static final Logger logger = LoggerFactory.getLogger(SellerCheckInterceptor.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		Object levelObject = session.getAttribute("LEVEL");
		int level = -1;
		
		if(levelObject != null) {
			level = (int)levelObject;
		}
		
		if(level != 2) {
			logger.info(">> 구매자가 아닙니다.");
			response.sendRedirect(request.getContextPath()+"/login");
			
			return false;
		} else {
			logger.info(">> 구매자입니다.");
		}
		
		return true;
	}
}
