package kr.co.rudisfarm.model.user;

import java.util.HashMap;
import java.util.List;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.rudisfarm.model.commons.pagenation.UserPagenation;
import kr.co.rudisfarm.model.user.UserVO;


public interface UserService {
	
	//관리자용
	public UserVO getAdmin(UserVO vo);
	public void changeAdmin(UserVO vo);
	public String isAdminExists(UserVO vo);
	public void createAdmin(UserVO vo);
	public UserVO findAdmin(UserVO vo);
	public List<UserVO> getBuyerList(UserVO vo);
	public UserVO getBuyer(UserVO vo);
//	public List<UserVO> selectAdminSellerList();
	public UserPagenation selectAdminBuyerList(HashMap<String, Object> pageInfo);
	public UserPagenation selectAdminSellerList(HashMap<String, Object> pageInfo);
	int updateAdminSeller(String USER_ID, HashMap<String, Object> jsonData);
	public int deleteAdminSeller(String USER_ID);
	public int checkAdmin(String EMAIL);
	
	//판매자&구매자 공용
	public UserVO userLogin(UserVO userVO);
	
	/* public UserVO buyerFindIdEmailCheck(HashMap<String, Object> jsonData); */
	
	//판매자용
	public int sellerJoin(UserVO userVO);
	public int sellerJoinAndProduct(UserVO userVO);
	public UserVO selectSeller(UserVO userVO);
	public int updateSeller(String USER_ID, HashMap<String, Object> jsonData, HttpSession session);
	public int updateSellerPassword(String USER_ID, HashMap<String, Object> jsonData);
	public int updateSellerSerial(String USER_ID, UserVO userVO, MultipartHttpServletRequest mtf, HttpServletRequest req);
	public int deleteSeller(String USER_ID, HashMap<String, Object> jsonData);
	public int isPremiumUpdate(HashMap<String, Object> map);
	
	//구매자용
	public int buyerJoin(UserVO userVO);
	public int idCheck(String USER_ID);
	public int emailCheck(String EMAIL);
	public boolean passwordCheck(HashMap<String, Object> jsonData);
	public UserVO buyerDetail(String USER_ID);
	public int buyerInfoModify(HashMap<String, Object> jsonData);
	public int buyerInfoModifySocial(HashMap<String, Object> jsonData);
	public int buyerDelete(String USER_ID);
	public int deleteBuyerCart(HashMap<String, Object> jsonData);
	public UserVO findId(String EMAIL);
	public String temporaryPw(UserVO userVO);
	
	//스프링 시큐리티
	public UserVO getUserByID(String USER_ID);
	
	//소셜 처리
	public int SocialJoinAndLoginCheck(HashMap<String, Object> jsonData);
	public UserVO getSocialUserByID(HashMap<String, String> map);
	public UserVO getUserByEmail(String EMAIL);
	public int outSocialUser(String USER_ID);
	public int rejoinSocialUser(String USER_ID);
	
	//인덱스 처리
	public int adminIndexUser(UserVO userVO);
}
