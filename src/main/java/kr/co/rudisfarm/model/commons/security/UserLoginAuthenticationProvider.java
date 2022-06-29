package kr.co.rudisfarm.model.commons.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AccountExpiredException;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.CredentialsExpiredException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.LockedException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class UserLoginAuthenticationProvider implements AuthenticationProvider {
	@Autowired
	UserDetailsServiceCustom UserDetailsService;
	
	@Autowired
	BCryptPasswordEncoder pwEncoding;
	
	
	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		String USER_ID = authentication.getName();
		String PASSOWRD = (String)authentication.getCredentials();
		
		UserDetailsVO userDetails = (UserDetailsVO)UserDetailsService.loadUserByUsername(USER_ID);
		
		/* 인증 진행 */
		
		// DB에 정보가 없는 경우 예외 발생 (아이디/패스워드 잘못됐을 때와 동일한 것이 좋음)
		// ID 및 PW 체크해서 안맞을 경우 (matches를 이용한 암호화 체크를 해야함)
		if (userDetails == null || !USER_ID.equals(userDetails.getUsername()) || !pwEncoding.matches(PASSOWRD, userDetails.getPassword()) || !userDetails.getPlatform().equals("rudisfarm")) {
			throw new BadCredentialsException(USER_ID);

		// 계정 정보 맞으면 나머지 부가 메소드 체크
		// 잠긴 계정일 경우
		} else if (!userDetails.isAccountNonLocked()) {
			throw new LockedException(USER_ID);

		// 비활성화된 계정일 경우
		} else if (!userDetails.isEnabled()) {
			throw new DisabledException(USER_ID);

		// 만료된 계정일 경우
		} else if (!userDetails.isAccountNonExpired() || userDetails.getStatus() == 5) {
			throw new AccountExpiredException(USER_ID);

		// 비밀번호가 만료된 경우
		} else if (!userDetails.isCredentialsNonExpired()) {
			throw new CredentialsExpiredException(USER_ID);
		}

		userDetails.setPassword(null);

		/* 최종 리턴 시킬 새로만든 Authentication 객체 */
		Authentication newAuth = new UsernamePasswordAuthenticationToken(
				userDetails, null, userDetails.getAuthorities());

		return newAuth;
	}

	@Override
	public boolean supports(Class<?> authentication) {
		
		return authentication.equals(UsernamePasswordAuthenticationToken.class);
	}
	
}
