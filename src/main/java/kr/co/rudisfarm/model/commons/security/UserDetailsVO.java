package kr.co.rudisfarm.model.commons.security;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

public class UserDetailsVO implements UserDetails{
	private static final long serialVersionUID = 1L;
	
	private String username; //USER_ID
	private String password; //PASSWORD
	private List<GrantedAuthority> authorities; //ROLE(권한)
	private String platform; //PLATFORM
	private int status;	 //STATUS
	
	public void setUsername(String username) {
		this.username = username;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public void setAuthorities(List<String> authList) {
		List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
		
		for(int i=0; i<authList.size(); i++) {
			authorities.add(new SimpleGrantedAuthority(authList.get(i)));
		}
		
		this.authorities = authorities;
	}
	
	public void setPlatform(String platform) {
		this.platform = platform;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	@Override
	public String getUsername() {
		
		return username;
	}
	
	@Override
	public String getPassword() {
		
		return password;
	}
	
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		
		return authorities;
	}
	
	public String getPlatform() {
		return platform;
	}
	
	public int getStatus() {
		return status;
	}
	
	// 계정이 만료되지 않았는가?
	@Override
	public boolean isAccountNonExpired() {
		
		return true;
	}

	// 계정이 잠기지 않았는가?
	@Override
	public boolean isAccountNonLocked() {
		
		return true;
	}

	// 패스워드가 만료되지 않았는가?
	@Override
	public boolean isCredentialsNonExpired() {
		
		return true;
	}

	// 계정이 활성화 되었는가?
	@Override
	public boolean isEnabled() {
		
		return true;
	}

}
