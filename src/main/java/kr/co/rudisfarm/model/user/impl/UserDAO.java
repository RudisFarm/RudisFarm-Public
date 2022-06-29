package kr.co.rudisfarm.model.user.impl;


import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.rudisfarm.model.user.UserVO;

@Repository("UserDAO")
public class UserDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	//임시!!! 지우기!!
	public List<UserVO> allUser() {
		
		return mybatis.selectList("UserDAO.allUser");
	}
	
	//임시!!! 지우기!!
	public int encode(UserVO vo) {
		
		return mybatis.update("UserDAO.encode", vo);
	}
	
	// <관리자>
	//관리자 전용 메소드
	public UserVO getAdmin(UserVO vo) {
		System.out.println("Admin 검색");
		return mybatis.selectOne("UserDAO.getAdmin", vo);
	}
	public void changeAdmin(UserVO vo) {
		System.out.println("Admin 정보 수정");
		mybatis.update("UserDAO.changeAdmin", vo);
//		mybatis.commit();
	}
	public String isAdminExists(UserVO vo) {
		System.out.println("Admin 존재 여부 확인");
		return mybatis.selectOne("UserDAO.isAdminExists", vo);
	}
	public void createAdmin(UserVO vo) {
		System.out.println("Admin 생성");
		mybatis.insert("UserDAO.createAdmin", vo);
//		mybatis.commit();
	}
	public UserVO findAdmin(UserVO vo) {
		System.out.println("Admin 찾기");
		return mybatis.selectOne("UserDAO.findAdmin", vo);
	}
	public List<UserVO> getBuyerList(UserVO vo){
		System.out.println("BuyerList 찾기");
		return mybatis.selectList("UserDAO.getBuyerList", vo);
	}
	public UserVO getBuyer(UserVO vo) {
		System.out.println("Buyer 찾기");
		return mybatis.selectOne("UserDAO.getBuyer", vo);
	}
	public int checkAdmin(String EMAIL) {
		System.out.println("////// UserDAO_checkAdmin");
		return mybatis.selectOne("UserDAO.checkAdmin", EMAIL);
	}
	public int selectAdminBuyerListCount(HashMap<String, Object> pageInfo) {
		
		return mybatis.selectOne("UserDAO.selectAdminBuyerListCount", pageInfo);
	}
	public List<UserVO> selectAdminBuyerList(HashMap<String, Object> pageInfo) {
		
		return mybatis.selectList("UserDAO.selectAdminBuyerList", pageInfo);
	}

//	// 판매자 목록 조회
//	public List<UserVO> selectAdminSellerList() {
//		
//		return mybatis.selectList("UserDAO.selectAdminSellerList");
//	}
	// 판매자 전체 목록 조회
	public List<UserVO> selectAllSellerList() {
		
		return mybatis.selectList("UserDAO.selectAllSellerList");
	}
	// 사업자등록번호 조회 후 상태 자동 갱신
	public int updaetAutoSellerSerial(UserVO vo) {
		
		return mybatis.update("UserDAO.updaetAutoSellerSerial", vo);
	}
	// 판매자 목록 조회 갯수(페이징, 검색, 정렬)
	public int selectAdminSellerListCount(HashMap<String, Object> pageInfo) {
		
		return mybatis.selectOne("UserDAO.selectAdminSellerListCount", pageInfo);
	}
	// 판매자 목록 조회(페이징, 검색, 정렬)
	public List<UserVO> selectAdminSellerList(HashMap<String, Object> pageInfo) {
		
		return mybatis.selectList("UserDAO.selectAdminSellerList", pageInfo);
	}
	// 판매자 상태 수정
	public int updaetAdminSeller(UserVO userVO) {
		
		return mybatis.update("UserDAO.updaetAdminSeller", userVO);
	}
	// 판매자 가입 거부
	public int deleteAdminSeller(UserVO userVO) {
		
		return mybatis.delete("UserDAO.deleteAdminSeller", userVO);
	}
	
	// <구매자>
	//로그인
	public UserVO userLogin(UserVO userVO) {
		//DB에 데이터 요청/반환
		UserVO userInfo = mybatis.selectOne("UserDAO.userLogin", userVO);
		
		return userInfo;
	}
	
	//바이어 가입
	public int buyerJoin(UserVO userVO) {
		System.out.println("[유저 다오 임플_userJoin]" + userVO);
		int joinResult = mybatis.insert("UserDAO.buyerJoin", userVO); 
		System.out.println("[유저 다오 임플_userJoin] : 처리됨");

		return joinResult; 
	}

	//아이디 중복 확인
	public int CheckDuplication(String USER_ID) {
		System.out.println("UserDAOImpl의 CheckDuplication :" + USER_ID);
		int idCheckResult = mybatis.selectOne("UserDAO.idcheck", USER_ID);
		System.out.println("UserDAOImpl의 CheckDuplication :" + idCheckResult);
		return idCheckResult;
	}
	
	//이메일 중복 확인
	public int emailCheckDuplication(String EMAIL) {
		System.out.println("UserDAO의 emailCheckDuplication :" + EMAIL);
		int emailCheckResult = mybatis.selectOne("UserDAO.emailcheck", EMAIL);
		System.out.println("UserDAO의 emailCheckDuplication 처리 결과:" + emailCheckResult);
	
		return emailCheckResult;
	}
	
	//비밀번호 확인
	public String passwordCheck(String USER_ID) {
		System.out.println("[UserDAO_passwordCheck_USER_ID] :" + USER_ID);
		String result = mybatis.selectOne("UserDAO.passcheck", USER_ID);
		System.out.println("[UserDAO_passwordCheck] :" + result);

		return result;
	}
	
	//유저 개인 상세 정보(바이어)
	public UserVO buyerDetail(String USER_ID) {
		UserVO vo = new UserVO();
		
		vo = mybatis.selectOne("UserDAO.buyerDetail", USER_ID);
		return vo;
	}
	
	//개인 정보 수정(바이어)
	public int buyerInfoModify(UserVO userVO) {
		
		System.out.println("[UserDAO_buyerInfoModify]" + userVO);
		int modifyResult = mybatis.update("UserDAO.buyerInfoModify", userVO); 
		System.out.println("[UserDAO_buyerInfoModify] : 처리됨");

		return modifyResult; 
	}
	
	//개인 정보 수정(소셜 로그인)
	public int buyerInfoModifySocial(UserVO userVO) {
		
		System.out.println("[UserDAO_buyerInfoModifySocial]" + userVO);
		int modifyResultSocial = mybatis.update("UserDAO.buyerInfoModifySocial", userVO); 
//			System.out.println(modifyResultSocial);
		System.out.println("[UserDAO_buyerInfoModifySocial] : 처리됨");

		return modifyResultSocial; 
	}
	
	//회원 탈퇴(바이어)
	public int buyerDelete(String USER_ID) {
		System.out.println("[UserDAO_buyerDelete]" + USER_ID);
		int buyerDeleteResult = mybatis.update("UserDAO.buyerDelete", USER_ID);
		System.out.println("[UserDAO_buyerDelete] : 처리");
		
		return buyerDeleteResult;
	}
	
	//회원 탈퇴시 찜 목록 삭제
	public int buyerDeleteCart(String USER_ID) {
		int buyerDeleteCartResult = mybatis.delete("UserDAO.buyerDeleteCart", USER_ID);
		
		return buyerDeleteCartResult;
	}

	//아이디 찾기
	public UserVO findId(String EMAIL) {
		System.out.println("[아이디 찾기]");
		UserVO vo = new UserVO();
		vo = mybatis.selectOne("UserDAO.findId", EMAIL);
		
		return vo; 
	}
	
	//임시 비밀번호 저장
	public int temporaryPw(UserVO userVO) {
		System.out.println("[임시 비밀번호 저장] : "+ userVO);
		int issuResult = mybatis.update("UserDAO.temporaryPw", userVO);

		return issuResult;
	}
	
	// <판매자>
	// 판매자 회원가입
	public int sellerJoin(UserVO userVO) {
		int insertResult = mybatis.insert("UserDAO.sellerJoin", userVO);
		
		return insertResult;
	}
	
	public int sellerJoinAndProduct(UserVO userVO) {
		int insertResult = mybatis.insert("UserDAO.sellerJoin", userVO);
		return insertResult;
	}
	
	// 판매자 내 정보 조회
	public UserVO selectSeller(UserVO userVO) {
		
		return mybatis.selectOne("UserDAO.selectSeller", userVO);
	}
	
	// 판매자 내 정보 수정
	public int updaetSeller(UserVO userVO) {
		
		return mybatis.update("UserDAO.updaetSeller", userVO);
	}
	
	public int selectCheckSellerPassword(UserVO userVO) {
		
		return mybatis.selectOne("UserDAO.selectCheckSellerPassword", userVO);
	}
	
	// 판매자 비밀번호 수정
	public int updaetSellerPassword(UserVO userVO) {
		
		return mybatis.update("UserDAO.updaetSellerPassword", userVO);
	}
	
	// 판매자 재인증 신청
	public int updaetSellerSerial(UserVO userVO) {
		
		return mybatis.update("UserDAO.updaetSellerSerial", userVO);
	}
	
	public int deleteSeller(UserVO userVO) {
		
		return mybatis.update("UserDAO.deleteSeller", userVO);
	}
	
	public UserVO getUserByID(String USER_ID) {
		
		return mybatis.selectOne("UserDAO.getUserByID", USER_ID);
	}
	
	public UserVO getSocialUserByID(HashMap<String, String> map) {
		
		return mybatis.selectOne("UserDAO.getSocialUserByID", map);
	}
	
	public UserVO getUserByEmail(String EMAIL) {
		
		return mybatis.selectOne("UserDAO.getUserByEmail", EMAIL);
	}
	
	public int outSocialUser(String USER_ID) {
		
		return mybatis.update("UserDAO.outSocialUser", USER_ID);
	}
	
	public int rejoinSocialUser(String USER_ID) {
		
		return mybatis.update("UserDAO.rejoinSocialUser", USER_ID);
	}
		
	public int isPremiumUpdate(HashMap<String, Object> map) {
		return mybatis.update("UserDAO.isPremiumUpdate", map);
	}
	
	public int selectSellerCurrentIncome(String USER_ID) {
		return mybatis.selectOne("UserDAO.selectSellerCurrentIncome", USER_ID);
	}

	public int updateSellerCurrentIncome(UserVO userVO) {
		return mybatis.update("UserDAO.updateSellerCurrentIncome", userVO);
	}
	
	// adminindex
	public int adminIndexUser(UserVO userVO) {
		return mybatis.selectOne("UserDAO.adminIndexUser", userVO);
	}

}
