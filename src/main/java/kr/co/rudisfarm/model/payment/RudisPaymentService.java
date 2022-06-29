package kr.co.rudisfarm.model.payment;

import java.util.List;
import java.util.Map;



public interface RudisPaymentService {
	
	public List<RudisPaymentVO> getRudisPaymentList(RudisPaymentVO vo);
	
	public List<RudisPaymentVO> superAdminPaymentList(Map<String, Object> map);
	
	public List<RudisPaymentVO> AdminPaymentCancelList(RudisPaymentVO vo);
	
	public int getRudisPaymentListCOUNT(RudisPaymentVO vo);
	
	public List<RudisPaymentVO> getPaymentList(Map<String, Object> map);
	
	public int getPaymentListCount(Map<String, Object> map);

	public int superAdminPaymentListCount(Map<String, Object> map);

	public List<RudisPaymentVO> getPaymentCancelList(Map<String, Object> map);

	public int getPaymentCancelListCount(Map<String, Object> map);

	public List<RudisPaymentVO> superAdminCancelPaymentList(Map<String, Object> map);

	public int superAdminCancelPaymentListCount(Map<String, Object> map);
}
