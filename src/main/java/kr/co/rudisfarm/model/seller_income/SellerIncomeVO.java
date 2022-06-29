package kr.co.rudisfarm.model.seller_income;

import java.sql.Date;

public class SellerIncomeVO {
	private int SELLER_INCOME_ID;
	private String USER_ID;
	private Date REQUIRE_DATE;
	private Date PROCESSED_DATE;
	private int REQUIRE_INCOME;
	private int ACTUAL_INCOME;
	private int FEES;
	private String ACCOUNT_NAME;
	private String ACCOUNT_BANK;
	private String ACCOUNT_NUMBER;
	private int RESULT;
	
	public int getSELLER_INCOME_ID() {
		return SELLER_INCOME_ID;
	}
	public void setSELLER_INCOME_ID(int sELLER_INCOME_ID) {
		SELLER_INCOME_ID = sELLER_INCOME_ID;
	}
	public String getUSER_ID() {
		return USER_ID;
	}
	public void setUSER_ID(String uSER_ID) {
		USER_ID = uSER_ID;
	}
	public Date getREQUIRE_DATE() {
		return REQUIRE_DATE;
	}
	public void setREQUIRE_DATE(Date rEQUIRE_DATE) {
		REQUIRE_DATE = rEQUIRE_DATE;
	}
	public Date getPROCESSED_DATE() {
		return PROCESSED_DATE;
	}
	public void setPROCESSED_DATE(Date pROCESSED_DATE) {
		PROCESSED_DATE = pROCESSED_DATE;
	}
	public int getREQUIRE_INCOME() {
		return REQUIRE_INCOME;
	}
	public void setREQUIRE_INCOME(int rEQUIRE_INCOME) {
		REQUIRE_INCOME = rEQUIRE_INCOME;
	}
	public int getACTUAL_INCOME() {
		return ACTUAL_INCOME;
	}
	public void setACTUAL_INCOME(int aCTUAL_INCOME) {
		ACTUAL_INCOME = aCTUAL_INCOME;
	}
	public int getFEES() {
		return FEES;
	}
	public void setFEES(int fEES) {
		FEES = fEES;
	}
	public String getACCOUNT_NAME() {
		return ACCOUNT_NAME;
	}
	public void setACCOUNT_NAME(String aCCOUNT_NAME) {
		ACCOUNT_NAME = aCCOUNT_NAME;
	}
	public String getACCOUNT_BANK() {
		return ACCOUNT_BANK;
	}
	public void setACCOUNT_BANK(String aCCOUNT_BANK) {
		ACCOUNT_BANK = aCCOUNT_BANK;
	}
	public String getACCOUNT_NUMBER() {
		return ACCOUNT_NUMBER;
	}
	public void setACCOUNT_NUMBER(String aCCOUNT_NUMBER) {
		ACCOUNT_NUMBER = aCCOUNT_NUMBER;
	}
	public int getRESULT() {
		return RESULT;
	}
	public void setRESULT(int rESULT) {
		RESULT = rESULT;
	}
	@Override
	public String toString() {
		return "SellerIncomeVO [SELLER_INCOME_ID=" + SELLER_INCOME_ID + ", USER_ID=" + USER_ID + ", REQUIRE_DATE="
				+ REQUIRE_DATE + ", REQUIRE_INCOME=" + REQUIRE_INCOME + ", ACCOUNT_NAME=" + ACCOUNT_NAME
				+ ", ACCOUNT_BANK=" + ACCOUNT_BANK + ", ACCOUNT_NUMBER=" + ACCOUNT_NUMBER + ", RESULT=" + RESULT + "]";
	}
}
