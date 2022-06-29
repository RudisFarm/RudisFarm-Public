package kr.co.rudisfarm.model.review;

import java.sql.Date;

public class ReviewVO {
	private int REVIEW_ID;
	private String USER_ID;
	private int PRODUCT_ID;
	private int ORDERS_ID;
	private String CONTENT;
	private String FILES;
	private Date WRITEDATE;
	private int PRODUCT_RATING;
	private int SELLER_RATING;
	private String PRODUCT_NAME;
	
	public String getPRODUCT_NAME() {
		return PRODUCT_NAME;
	}
	public void setPRODUCT_NAME(String pRODUCT_NAME) {
		PRODUCT_NAME = pRODUCT_NAME;
	}
	public int getREVIEW_ID() {
		return REVIEW_ID;
	}
	public void setREVIEW_ID(int rEVIEW_ID) {
		REVIEW_ID = rEVIEW_ID;
	}
	public String getUSER_ID() {
		return USER_ID;
	}
	public void setUSER_ID(String uSER_ID) {
		USER_ID = uSER_ID;
	}
	public int getPRODUCT_ID() {
		return PRODUCT_ID;
	}
	public void setORDERS_ID(int oRDERS_ID) {
		ORDERS_ID = oRDERS_ID;
	}
	public void setPRODUCT_ID(int pRODUCT_ID) {
		PRODUCT_ID = pRODUCT_ID;
	}
	public int getORDERS_ID() {
		return ORDERS_ID;
	}
	public String getCONTENT() {
		return CONTENT;
	}
	public void setCONTENT(String cONTENT) {
		CONTENT = cONTENT;
	}
	public String getFILES() {
		return FILES;
	}
	public void setFILES(String fILES) {
		FILES = fILES;
	}
	public Date getWRITEDATE() {
		return WRITEDATE;
	}
	public void setWRITEDATE(Date wRITEDATE) {
		WRITEDATE = wRITEDATE;
	}
	public int getPRODUCT_RATING() {
		return PRODUCT_RATING;
	}
	public void setPRODUCT_RATING(int pRODUCT_RATING) {
		PRODUCT_RATING = pRODUCT_RATING;
	}
	public int getSELLER_RATING() {
		return SELLER_RATING;
	}
	public void setSELLER_RATING(int sELLER_RATING) {
		SELLER_RATING = sELLER_RATING;
	}
	@Override
	public String toString() {
		return "ReviewVO [REVIEW_ID=" + REVIEW_ID + ", USER_ID=" + USER_ID + ", PRODUCT_ID=" + PRODUCT_ID
				+ ", ORDERS_ID=" + ORDERS_ID + ", CONTENT=" + CONTENT + ", FILES=" + FILES + ", WRITEDATE=" + WRITEDATE
				+ ", PRODUCT_RATING=" + PRODUCT_RATING + ", SELLER_RATING=" + SELLER_RATING + ", PRODUCT_NAME="
				+ PRODUCT_NAME + "]";
	}
	
}
