package kr.co.rudisfarm.model.payment.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.rudisfarm.model.payment.RudisPaymentService;
import kr.co.rudisfarm.model.payment.RudisPaymentVO;

@Service("RudisPaymentService")
public class RudisPaymentServiceImpl implements RudisPaymentService{
	
	@Autowired
	RudisPaymentDAO rudispaymentDAO;
	
	@Override
	public List<RudisPaymentVO> getRudisPaymentList(RudisPaymentVO vo){
		return rudispaymentDAO.getRudisPaymentList(vo);
	}
	
//	@Override
//	public List<RudisPaymentVO> superAdminPaymentList(RudisPaymentVO vo){
//		return rudispaymentDAO.superAdminPaymentList(vo);
//	}
	
	@Override
	public List<RudisPaymentVO> AdminPaymentCancelList(RudisPaymentVO vo){
		return rudispaymentDAO.AdminPaymentCancelList(vo);
	}
	
	@Override
	public int getRudisPaymentListCOUNT(RudisPaymentVO vo){
		return rudispaymentDAO.getRudisPaymentListCOUNT(vo);
	}

	@Override
	public List<RudisPaymentVO> getPaymentList(Map<String, Object> map) {
		return rudispaymentDAO.getPaymentList(map);
	}

	@Override
	public int getPaymentListCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return rudispaymentDAO.getPaymentListCount(map);
	}
	
	@Override
	public int superAdminPaymentListCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return rudispaymentDAO.superAdminPaymentListCount(map);
	}

	@Override
	public List<RudisPaymentVO> superAdminPaymentList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return rudispaymentDAO.superAdminPaymentList(map);
	}

	@Override
	public List<RudisPaymentVO> getPaymentCancelList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return rudispaymentDAO.getPaymentCancelList(map);
	}

	@Override
	public int getPaymentCancelListCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return rudispaymentDAO.getPaymentListCancelCount(map);
	}

	@Override
	public List<RudisPaymentVO> superAdminCancelPaymentList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return rudispaymentDAO.getsuperAdminCancelPaymentList(map);
	}

	@Override
	public int superAdminCancelPaymentListCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return rudispaymentDAO.getsuperAdminPaymentCancelListCount(map);
	}
}
