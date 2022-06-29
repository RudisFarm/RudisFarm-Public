package kr.co.rudisfarm.model.chart;


public class ChartVO {
	private String PRODUCT_NAME;
	private String TYPE2;
	private String USER_ID;
	private String YEAR;
	private int COUNT;
	private int TOTAL_PRICE;
	private int YEAR_PRICE;
	private int MAX;
	private int MIN;
	

	
	
	public int getMAX() {
		return MAX;
	}

	public void setMAX(int mAX) {
		MAX = mAX;
	}

	public int getMIN() {
		return MIN;
	}

	public void setMIN(int mIN) {
		MIN = mIN;
	}

	public int getTOTAL_PRICE() {
		return TOTAL_PRICE;
	}

	public void setTOTAL_PRICE(int tOTAL_PRICE) {
		TOTAL_PRICE = tOTAL_PRICE;
	}

	public int getYEAR_PRICE() {
		return YEAR_PRICE;
	}

	public void setYEAR_PRICE(int yEAR_PRICE) {
		YEAR_PRICE = yEAR_PRICE;
	}

	public String getYEAR() {
		return YEAR;
	}

	public void setYEAR(String yEAR) {
		YEAR = yEAR;
	}

	public int getCOUNT() {
		return COUNT;
	}

	public void setCOUNT(int cOUNT) {
		COUNT = cOUNT;
	}

	public String getUSER_ID() {
		return USER_ID;
	}

	public void setUSER_ID(String uSER_ID) {
		USER_ID = uSER_ID;
	}

	public String getTYPE2() {
		return TYPE2;
	}

	public void setTYPE2(String tYPE2) {
		TYPE2 = tYPE2;
	}

	public String getPRODUCT_NAME() {
		return PRODUCT_NAME;
	}

	public void setPRODUCT_NAME(String pRODUCT_NAME) {
		PRODUCT_NAME = pRODUCT_NAME;
	}
	
	
	

}
