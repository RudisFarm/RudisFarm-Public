package kr.co.rudisfarm.model.commons.security;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationServiceException;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import kr.co.rudisfarm.model.user.UserService;
import kr.co.rudisfarm.model.user.UserVO;


public class UserDetailsServiceCustom implements UserDetailsService {
	@Autowired
	private UserService userService;
	

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		// 최종적으로 리턴해야 할 객체
		UserDetailsVO userDetails = new UserDetailsVO();
		
		System.out.println("로그인 시도 아이디 : " + username);
		
		// 사용자 정보 select
		UserVO userVO = userService.getUserByID(username);
		System.out.println("정상 수행");
		
		
		if(userVO == null) {
			// 사용자 정보가 없으면 null 처리
			System.out.println("정보 없음");
			return null;
		} else {
			System.out.println(userVO.toString());
			// 사용자 정보가 있을 경우 로직 전개 (userDetails에 데이터 넣기)
			userDetails.setUsername(userVO.getUSER_ID());
			userDetails.setPassword(userVO.getPASSWORD());
			List<String> auto = new ArrayList<String>();
			if(userVO.getLEVEL() == 0) {
				auto.add("ADMIN");
			} else if(userVO.getLEVEL() == 1) {
				auto.add("SELLER");
			} else if(userVO.getLEVEL() == 2) {
				auto.add("BUYER");
			}
			// 사용자 권한 select해서 받아온 List<String>객체 주입
			userDetails.setAuthorities(auto);
			userDetails.setPlatform(userVO.getPLATFORM());
			userDetails.setStatus(userVO.getSTATUS());
		}
		
		return userDetails;
	}

}
