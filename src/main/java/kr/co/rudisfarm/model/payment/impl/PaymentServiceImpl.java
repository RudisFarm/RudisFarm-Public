package kr.co.rudisfarm.model.payment.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.rudisfarm.model.payment.PaymentCancelVO;
import kr.co.rudisfarm.model.payment.PaymentService;
import kr.co.rudisfarm.model.payment.PaymentVO;
import kr.co.rudisfarm.model.payment.PremiumVO;
import kr.co.rudisfarm.model.payment.apivo.KakaoPayApprovalAPIVO;
import kr.co.rudisfarm.model.payment.apivo.KakaoPayCancelAPIVO;


@Service("PaymentService")
public class PaymentServiceImpl implements PaymentService{
	
	@Autowired
	PaymentDAO paymentDAO = new PaymentDAO();

	public int insertPayment(KakaoPayApprovalAPIVO apivo) {
		PaymentVO approvalInsertVO = new PaymentVO();
		approvalInsertVO.setTID(apivo.getTid());
		approvalInsertVO.setCID(apivo.getCid());
		approvalInsertVO.setAID(apivo.getAid());
		approvalInsertVO.setPARTNER_ORDER_ID(apivo.getPartner_order_id());
		approvalInsertVO.setPARTNER_USER_ID(apivo.getPartner_user_id());
		approvalInsertVO.setITEM_NAME(apivo.getItem_name());
		approvalInsertVO.setQUANTITY(apivo.getQuantity());
		approvalInsertVO.setTOTAL_AMOUNT(apivo.getAmount().getTotal());
		approvalInsertVO.setTAX_FREE_AMOUNT(apivo.getTax_free_amuont());
		approvalInsertVO.setVAT_AMOUNT(apivo.getVat_amount());
		approvalInsertVO.setPAYMENT_METHOD_TYPE(apivo.getPayment_method_type());
		approvalInsertVO.setCREATED_AT(apivo.getCreated_at());
		approvalInsertVO.setAPPROVED_AT(apivo.getApproved_at());
		
		System.out.println("매핑 결과 : " + approvalInsertVO.toString());
		
		return paymentDAO.insertPayment(approvalInsertVO);
	}
	
	@Override
	public int insertPaymentCancel(KakaoPayCancelAPIVO apivo) {
		PaymentCancelVO approvalInsertVO = new PaymentCancelVO();
		approvalInsertVO.setTID(apivo.getTid());
		approvalInsertVO.setAID(apivo.getAid());
		approvalInsertVO.setSTATUS(apivo.getStatus());
		approvalInsertVO.setPARTNER_ORDER_ID(apivo.getPartner_order_id());
		approvalInsertVO.setPARTNER_USER_ID(apivo.getPartner_user_id());
		approvalInsertVO.setITEM_NAME(apivo.getItem_name());
		approvalInsertVO.setQUANTITY(apivo.getQuantity());
		approvalInsertVO.setTOTAL_AMOUNT(apivo.getAmount().getTotal());
		approvalInsertVO.setTAX_FREE_AMOUNT(apivo.getApproved_cancel_amount().getTax_free());
		approvalInsertVO.setVAT_AMOUNT(apivo.getApproved_cancel_amount().getVat());
		approvalInsertVO.setPAYMENT_METHOD_TYPE(apivo.getPayment_method_type());
		approvalInsertVO.setCREATED_AT(apivo.getCreated_at());
		approvalInsertVO.setAPPROVED_AT(apivo.getApproved_at());
		approvalInsertVO.setCANCEL_AMOUNT(apivo.getCanceled_amount().getTotal());
		
		System.out.println("매핑 결과 : " + approvalInsertVO.toString());
		
		return paymentDAO.insertPaymentCancel(approvalInsertVO);
	}

	public List<PaymentVO> getKakaoOrderList(Map<String, Object> map) {
		return paymentDAO.kakaoOrderList(map);
	}
	
	@Override
	public int getOrederListCount(Map<String, Object> map) {
		return paymentDAO.getOrederListCount(map);
	}

	public int updateStatusPayment(String TID) {
		return paymentDAO.updateStatusPayment(TID);
	}

	@Override
	public PaymentVO getPaymentDetail(PaymentVO paymentVO) {
		return paymentDAO.getPaymentDetail(paymentVO);
	}

	@Override
	public String getTIDfrompartnerID(String partner_order_id) {
		return paymentDAO.getTIDfrompartnerID(partner_order_id);
	}

	@Override
	public int insertPremium(PremiumVO premiumVO) {
		return paymentDAO.insertPremium(premiumVO);
	}

	@Override
	public int adminIndexPayment(PaymentVO paymentVO) {
		return paymentDAO.adminIndexPayment(paymentVO);
	}

	@Override
	public int adminIndexPaymentTotal(PaymentVO paymentVO) {
		return paymentDAO.adminIndexPaymentTotal(paymentVO);
	}
}
