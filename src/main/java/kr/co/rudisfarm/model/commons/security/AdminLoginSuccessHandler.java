package kr.co.rudisfarm.model.commons.security;

import java.io.IOException;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.authentication.WebAuthenticationDetails;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;
import org.springframework.stereotype.Service;

import kr.co.rudisfarm.model.user.UserService;
import kr.co.rudisfarm.model.user.UserVO;

@Service
public class AdminLoginSuccessHandler implements AuthenticationSuccessHandler {
	@Autowired
	UserService userService;
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		// IP, 세션 ID
		WebAuthenticationDetails web = (WebAuthenticationDetails)authentication.getDetails();
		System.out.println("IP : " + web.getRemoteAddress());
		System.out.println("Session ID : " + web.getSessionId());
		
		// 인증 ID
		System.out.println("name : " + authentication.getName());
		
		// 권한 리스트
		List<GrantedAuthority> authList = (List<GrantedAuthority>)authentication.getAuthorities();
		System.out.println("권한 : ");
		for(int i=0; i<authList.size(); i++) {
			System.out.print(authList.get(i).getAuthority() + " ");
		}
		System.out.println();
		
		// 디폴트 URI
		String uri = "/rudisfarm";
		
		UserVO userVO = userService.getUserByID(authentication.getName());
		
		if(authList.get(0).getAuthority().equals("ADMIN")) {
			uri += "/admin/admin-index";
		} else {
			//판매자, 구매자로 직접 로그인시 숨김 처리
			SecurityContextHolder.clearContext();
			
			String prevPage = (String) request.getSession().getAttribute("prevPage");
			if (prevPage != null) {
				request.getSession().removeAttribute("prevPage");
			}
			
			request.setAttribute("loginFail", true);
			request.setAttribute("loginFailMsg", "아이디 또는 비밀번호가 틀립니다.");
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/admin-login");
			dispatcher.forward(request, response);
			
			return;
		}

		/* 강제 인터셉트 당했을 경우의 데이터 get */
		RequestCache requestCache = new HttpSessionRequestCache();
		SavedRequest savedRequest = requestCache.getRequest(request, response);
		
		/* 로그인 버튼 눌러 접속했을 경우의 데이터 get */
		String prevPage = (String) request.getSession().getAttribute("prevPage");
		
		if (prevPage != null) {
			request.getSession().removeAttribute("prevPage");
		}

		// null이 아니라면 강제 인터셉트 당했다는 것
		if (savedRequest != null) {
			uri = savedRequest.getRedirectUrl();

		// ""가 아니라면 직접 로그인 페이지로 접속한 것
		} else if (prevPage != null && !prevPage.equals("")) {
			uri = prevPage;
			
//			if (authList.get(0).getAuthority().equals("SELLER")) {
//				uri = "/rudisfarm/seller/seller-index";
//			}
		}

		request.getSession().setAttribute("USER_ID", authentication.getName());
		request.getSession().setAttribute("EMAIL", userVO.getEMAIL());
		request.getSession().setAttribute("USER_NAME", userVO.getUSER_NAME());
		request.getSession().setAttribute("LEVEL", userVO.getLEVEL());
		
		System.out.println(uri);
		
		
		// 세 가지 케이스에 따른 URI 주소로 리다이렉트
		response.sendRedirect(uri);
	}

}
