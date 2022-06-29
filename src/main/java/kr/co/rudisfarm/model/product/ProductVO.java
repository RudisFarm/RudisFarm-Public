package kr.co.rudisfarm.model.product;

import java.sql.Date;

public class ProductVO {
	private int PRODUCT_ID;
	private String USER_ID;
	private String PRODUCT_NAME;
	private int PRICE;
	private int WEIGHT;
	private int COUNT;
	private String DESCRIPTION;
	private String TYPE1;
	private String TYPE2;
	private String SUMNAIL;
	private String FILES;
	private Date INPUTDATE;
	private int VIEWCOUNT;
	private int CONFIRM;
//	private double RATING;
	private int STATUS;
	
	public int getPRODUCT_ID() {
		return PRODUCT_ID;
	}
	public void setPRODUCT_ID(int pRODUCT_ID) {
		PRODUCT_ID = pRODUCT_ID;
	}
	public String getUSER_ID() {
		return USER_ID;
	}
	public void setUSER_ID(String uSER_ID) {
		USER_ID = uSER_ID;
	}
	public String getPRODUCT_NAME() {
		return PRODUCT_NAME;
	}
	public void setPRODUCT_NAME(String pRODUCT_NAME) {
		PRODUCT_NAME = pRODUCT_NAME;
	}
	public int getPRICE() {
		return PRICE;
	}
	public void setPRICE(int pRICE) {
		PRICE = pRICE;
	}
	public int getWEIGHT() {
		return WEIGHT;
	}
	public void setWEIGHT(int wEIGHT) {
		WEIGHT = wEIGHT;
	}
	public int getCOUNT() {
		return COUNT;
	}
	public void setCOUNT(int cOUNT) {
		COUNT = cOUNT;
	}
	public String getDESCRIPTION() {
		return DESCRIPTION;
	}
	public void setDESCRIPTION(String dESCRIPTION) {
		DESCRIPTION = dESCRIPTION;
	}
	public String getTYPE1() {
		return TYPE1;
	}
	public void setTYPE1(String tYPE1) {
		TYPE1 = tYPE1;
	}
	public String getTYPE2() {
		return TYPE2;
	}
	public void setTYPE2(String tYPE2) {
		TYPE2 = tYPE2;
	}
	public String getSUMNAIL() {
		return SUMNAIL;
	}
	public void setSUMNAIL(String sUMNAIL) {
		SUMNAIL = sUMNAIL;
	}
	public String getFILES() {
		return FILES;
	}
	public void setFILES(String fILES) {
		FILES = fILES;
	}
	public Date getINPUTDATE() {
		return INPUTDATE;
	}
	public void setINPUTDATE(Date iNPUTDATE) {
		INPUTDATE = iNPUTDATE;
	}
	public int getVIEWCOUNT() {
		return VIEWCOUNT;
	}
	public void setVIEWCOUNT(int vIEWCOUNT) {
		VIEWCOUNT = vIEWCOUNT;
	}
	public int getCONFIRM() {
		return CONFIRM;
	}
	public void setCONFIRM(int cONFIRM) {
		CONFIRM = cONFIRM;
	}
//	public double getRATING() {
//		RETURN RATING;
//	}
//	PUBLIC VOID SETRATING(DOUBLE RATING) {
//		RATING = RATING;
//	}
	public int getSTATUS() {
		return STATUS;
	}
	public void setSTATUS(int sTATUS) {
		STATUS = sTATUS;
	}
	@Override
	public String toString() {
		return "ProductVO [PRODUCT_ID=" + PRODUCT_ID + ", USER_ID=" + USER_ID + ", PRODUCT_NAME=" + PRODUCT_NAME
				+ ", PRICE=" + PRICE + ", WEIGHT=" + WEIGHT + ", COUNT=" + COUNT + ", DESCRIPTION=" + DESCRIPTION
				+ ", TYPE1=" + TYPE1 + ", TYPE2=" + TYPE2 + ", SUMNAIL=" + SUMNAIL + ", FILES=" + FILES + ", INPUTDATE="
				+ INPUTDATE + ", VIEWCOUNT=" + VIEWCOUNT + ", CONFIRM=" + CONFIRM +  ", STATUS="
				+ STATUS + "]";
	}

	
}
