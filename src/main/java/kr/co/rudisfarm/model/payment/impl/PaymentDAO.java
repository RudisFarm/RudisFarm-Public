package kr.co.rudisfarm.model.payment.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import kr.co.rudisfarm.model.payment.PaymentCancelVO;
import kr.co.rudisfarm.model.payment.PaymentVO;
import kr.co.rudisfarm.model.payment.PremiumVO;

@Repository("PaymentDAO")
public class PaymentDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	@Transactional
	public int insertPayment(PaymentVO insertPayment) {
		System.out.println("Approval Insert 잡임");
		return mybatis.insert("PaymentDAO.insertPayment", insertPayment);
	}
	
	public List<PaymentVO> kakaoOrderList(Map<String, Object> map) {
		System.out.println("paymentList 잠입");
		List<PaymentVO> list = mybatis.selectList("PaymentDAO.kakaoOrderList", map);
		return list;
	}
	
	public int getOrederListCount(Map<String, Object> map) {
		return mybatis.selectOne("PaymentDAO.getOrederListCount", map);
	}
	
	@Transactional
	public int insertPaymentCancel(PaymentCancelVO cancelInsertVO) {
		System.out.println("insertPaymentCancel 잠입");
		return mybatis.insert("PaymentDAO.insertPaymentCancel", cancelInsertVO);

	}
	
	@Transactional
	public int updateStatusPayment(String TID) {
		System.out.println("updateStatus 잠입");
		return mybatis.update("PaymentDAO.updateStatusPayment", TID);
	}
	
	public PaymentVO selectPaymentfromTID(String TID) {
		System.out.println("selectPaymentfromTID 잠입");
		return mybatis.selectOne("PaymentDAO.selectPaymentfromTID", TID);
	}
	
	public PaymentVO getPaymentDetail (PaymentVO paymentVO) {
		return mybatis.selectOne("PaymentDAO.getPaymentDetail", paymentVO);
	}
	
	public String getTIDfrompartnerID (String partner_order_id) {
		return mybatis.selectOne("PaymentDAO.getTIDfrompartnerID", partner_order_id);
	}
	
	public int insertPremium (PremiumVO premiumVO) {
		return mybatis.insert("PaymentDAO.insertPremium", premiumVO);
	}
	
	//adminindex
	public int adminIndexPayment(PaymentVO paymentVO) {
		return mybatis.selectOne("PaymentDAO.adminIndexPayment", paymentVO);
	}
	public int adminIndexPaymentTotal(PaymentVO paymentVO) {
		return mybatis.selectOne("PaymentDAO.adminIndexPaymentTotal", paymentVO);
	}
}
