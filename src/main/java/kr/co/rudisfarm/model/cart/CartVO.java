package kr.co.rudisfarm.model.cart;

import java.sql.Date;

public class CartVO {
	  private int CART_ID;
	  private String USER_ID;
	  private Date ADDDATE;
	  private int COUNT;
	  private int PRODUCT_ID;
	  private String PRODUCT_NAME;
	  private String SUMNAIL;
	  private int PRICE;
	  private int PAY;
	  
	public String getSUMNAIL() {
		return SUMNAIL;
	}
	public void setSUMNAIL(String sUMNAIL) {
		SUMNAIL = sUMNAIL;
	}
	public String getPRODUCT_NAME() {
		return PRODUCT_NAME;
	}
	public void setPRODUCT_NAME(String nAME) {
		PRODUCT_NAME = nAME;
	}
	public int getPRICE() {
		return PRICE;
	}
	public void setPRICE(int pRICE) {
		PRICE = pRICE;
	}
	public int getPAY() {
		return PAY;
	}
	public void setPAY(int pAY) {
		PAY = pAY;
	}
	public int getCART_ID() {
		return CART_ID;
	}
	public void setCART_ID(int cART_ID) {
		CART_ID = cART_ID;
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
	public void setPRODUCT_ID(int pRODUCT_ID) {
		PRODUCT_ID = pRODUCT_ID;
	}
	public Date getADDDATE() {
		return ADDDATE;
	}
	public void setADDDATE(Date aDDDATE) {
		ADDDATE = aDDDATE;
	}
	public int getCOUNT() {
		return COUNT;
	}
	public void setCOUNT(int cOUNT) {
		COUNT = cOUNT;
	}
	    
}
