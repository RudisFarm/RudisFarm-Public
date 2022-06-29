package kr.co.rudisfarm.model.payment.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.rudisfarm.model.payment.RudisPaymentVO;

@Repository("RudisPaymentDAO")
public class RudisPaymentDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<RudisPaymentVO> getRudisPaymentList(RudisPaymentVO vo) {
		System.out.println("중간 관리자 화면에서 paymentDAO에서 결제내역 기능 ");
		return mybatis.selectList("RudisPaymentDAO.getRudisPaymentList", vo);
	}
	
	public List<RudisPaymentVO> superAdminPaymentList(Map<String, Object> map) {
		
		System.out.println("RudisPaymentDAO_superAdminPaymentList에서 결제 내역 모두 보여주기 기능");
		return mybatis.selectList("RudisPaymentDAO.superAdminPaymentList", map);
	}
	public int superAdminPaymentListCount(Map<String, Object> map) {
		return mybatis.selectOne("RudisPaymentDAO.superAdminPaymentListCount", map);
	}

	public List<RudisPaymentVO> AdminPaymentCancelList(RudisPaymentVO vo) {

		System.out.println("AdminPaymentCancelList에서 결제 내역 모두 보여주기 기능");
		return mybatis.selectList("RudisPaymentDAO.AdminPaymentCancelList", vo);
	}
	
	public int getRudisPaymentListCOUNT(RudisPaymentVO vo) {
		System.out.println("AdminPaymentCancelList에서 결제 내역 모두 보여주기 기능");
		int getRudisPaymentListCOUNT = mybatis.selectOne("RudisPaymentDAO.getRudisPaymentListCOUNT", vo);

		return getRudisPaymentListCOUNT; 
	}
	
	public List<RudisPaymentVO> getPaymentList(Map<String, Object> map) {
		List<RudisPaymentVO> list = mybatis.selectList("RudisPaymentDAO.getPaymentList", map);
		return list;
	}
	
	public int getPaymentListCount(Map<String, Object> map) {
		return mybatis.selectOne("RudisPaymentDAO.getPaymentListCount", map);
	}
	
	public List<RudisPaymentVO> getPaymentCancelList(Map<String, Object> map) {
		List<RudisPaymentVO> list = mybatis.selectList("RudisPaymentDAO.getPaymentCancelList", map);
		return list;
	}
	
	public int getPaymentListCancelCount(Map<String, Object> map) {
		return mybatis.selectOne("RudisPaymentDAO.getPaymentCancelListCount", map);
	}

	public int getsuperAdminPaymentCancelListCount(Map<String, Object> map) {
		
		return mybatis.selectOne("RudisPaymentDAO.getsuperAdminPaymentCancelListCount", map);
	}

	public List<RudisPaymentVO> getsuperAdminCancelPaymentList(Map<String, Object> map) {
		List<RudisPaymentVO> list = mybatis.selectList("RudisPaymentDAO.getsuperAdminCancelPaymentList", map);
		return list;
	}
}
