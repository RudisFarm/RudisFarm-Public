package kr.co.rudisfarm.model.payment;

import java.util.Date;

public class PremiumVO {
	private int PREMIUM_ID;
	private String USER_ID;
	private Date START_DATE;
	private Date END_DATE;
	private String PREMIUM_KEY;
	
	public int getPREMIUM_ID() {
		return PREMIUM_ID;
	}
	public void setPREMIUM_ID(int pREMIUM_ID) {
		PREMIUM_ID = pREMIUM_ID;
	}
	public String getUSER_ID() {
		return USER_ID;
	}
	public void setUSER_ID(String uSER_ID) {
		USER_ID = uSER_ID;
	}
	public Date getSTART_DATE() {
		return START_DATE;
	}
	public void setSTART_DATE(Date sTART_DATE) {
		START_DATE = sTART_DATE;
	}
	public Date getEND_DATE() {
		return END_DATE;
	}
	public void setEND_DATE(Date eND_DATE) {
		END_DATE = eND_DATE;
	}
	public String getPREMIUM_KEY() {
		return PREMIUM_KEY;
	}
	public void setPREMIUM_KEY(String pREMIUM_KEY) {
		PREMIUM_KEY = pREMIUM_KEY;
	}
	
	@Override
	public String toString() {
		return "PremiumVO [PREMIUM_ID=" + PREMIUM_ID + ", USER_ID=" + USER_ID + ", START_DATE=" + START_DATE
				+ ", END_DATE=" + END_DATE + ", PREMIUM_KEY=" + PREMIUM_KEY + "]";
	}
}
