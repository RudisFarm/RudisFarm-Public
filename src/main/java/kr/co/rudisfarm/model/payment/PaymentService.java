package kr.co.rudisfarm.model.payment;

import java.util.List;
import java.util.Map;

import kr.co.rudisfarm.model.payment.apivo.KakaoPayApprovalAPIVO;
import kr.co.rudisfarm.model.payment.apivo.KakaoPayCancelAPIVO;

public interface PaymentService {
	
	public int insertPayment(KakaoPayApprovalAPIVO approveVO);
	
	public List<PaymentVO> getKakaoOrderList(Map<String, Object> map);
	
	public int getOrederListCount(Map<String, Object> map);
	
	public int insertPaymentCancel (KakaoPayCancelAPIVO cancelVO);
	
	public int updateStatusPayment (String tid);
	
	public PaymentVO getPaymentDetail(PaymentVO paymentVO);
	
	public String getTIDfrompartnerID(String partner_order_id);
	
	public int insertPremium(PremiumVO premiumVO);
	
	public int adminIndexPayment(PaymentVO paymentVO);
	
	public int adminIndexPaymentTotal(PaymentVO paymentVO);
}
