package kr.co.rudisfarm.model.cart;

public class AjaxVO {
	private String USER_ID;
	private String NAME;
	private int PRODUCT_ID;
	private int CART_ID;
	private int COUNT;
	private int PAY;
	private int PRICE;

	
	
	public String getNAME() {
		return NAME;
	}

	public void setNAME(String nAME) {
		NAME = nAME;
	}

	public int getPRODUCT_ID() {
		return PRODUCT_ID;
	}

	public void setPRODUCT_ID(int pRODUCT_ID) {
		PRODUCT_ID = pRODUCT_ID;
	}

	public int getCART_ID() {
		return CART_ID;
	}

	public void setCART_ID(int cART_ID) {
		CART_ID = cART_ID;
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
	
	
}
