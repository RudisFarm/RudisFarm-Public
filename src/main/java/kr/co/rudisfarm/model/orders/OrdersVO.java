package kr.co.rudisfarm.model.orders;

import java.sql.Date;

public class OrdersVO {
	int ORDERS_ID;
	String ORDERS_NAME;
	String USER_ID;
	String USER_NAME;
	String PHONE;
	String DELIVERY_MESSAGE;
	String FIR_ADDRESS;
	String SEC_ADDRESS;
	int PRODUCT_ID;
	int COUNT;
	int PRICE;
	int TOTAL_PRICE;
	Date ORDERSDATE;
	String STATUS;
	String EXCHANGE_MESSAGE;
	String TRACKING_NUMBER;
	String TRACKING_NAME;
	String TRACKING_CODE;
	int IS_REVIEWED;
	
	String CID;
	String TID;
	String AID;
	String PARTNER_ORDER_ID;
	String PARTNER_USER_ID;
	String ITEM_NAME;
	int QUANTITY;
	int TOTAL_AMOUNT;
	int VAT_AMOUNT;
	Date APPROVED_AT;
	Date CREATED_AT;

	
	String EMAIL;

	
	public String getEMAIL() {
		return EMAIL;
	}
	public void setEMAIL(String eMAIL) {
		EMAIL = eMAIL;
	}
	String PRODUCT_NAME;

	
	
	
	public String getTRACKING_CODE() {
		return TRACKING_CODE;
	}
	public void setTRACKING_CODE(String tRACKING_CODE) {
		TRACKING_CODE = tRACKING_CODE;
	}
	public String getTRACKING_NUMBER() {
		return TRACKING_NUMBER;
	}
	public void setTRACKING_NUMBER(String tRACKING_NUMBER) {
		TRACKING_NUMBER = tRACKING_NUMBER;
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
	public String getCID() {
		return CID;
	}
	public void setCID(String cID) {
		CID = cID;
	}
	public String getTID() {
		return TID;
	}
	public void setTID(String tID) {
		TID = tID;
	}
	public String getAID() {
		return AID;
	}
	public void setAID(String aID) {
		AID = aID;
	}
	public String getPARTNER_ORDER_ID() {
		return PARTNER_ORDER_ID;
	}
	public void setPARTNER_ORDER_ID(String pARTNER_ORDER_ID) {
		PARTNER_ORDER_ID = pARTNER_ORDER_ID;
	}
	public String getPARTNER_USER_ID() {
		return PARTNER_USER_ID;
	}
	public void setPARTNER_USER_ID(String pARTNER_USER_ID) {
		PARTNER_USER_ID = pARTNER_USER_ID;
	}
	public String getITEM_NAME() {
		return ITEM_NAME;
	}
	public void setITEM_NAME(String iTEM_NAME) {
		ITEM_NAME = iTEM_NAME;
	}
	public int getQUANTITY() {
		return QUANTITY;
	}
	public void setQUANTITY(int qUANTITY) {
		QUANTITY = qUANTITY;
	}
	public int getTOTAL_AMOUNT() {
		return TOTAL_AMOUNT;
	}
	public void setTOTAL_AMOUNT(int tOTAL_AMOUNT) {
		TOTAL_AMOUNT = tOTAL_AMOUNT;
	}
	public int getVAT_AMOUNT() {
		return VAT_AMOUNT;
	}
	public void setVAT_AMOUNT(int vAT_AMOUNT) {
		VAT_AMOUNT = vAT_AMOUNT;
	}
	public Date getAPPROVED_AT() {
		return APPROVED_AT;
	}
	public void setAPPROVED_AT(Date aPPROVED_AT) {
		APPROVED_AT = aPPROVED_AT;
	}
	public Date getCREATED_AT() {
		return CREATED_AT;
	}
	
	public void setCREATED_AT(Date cREATED_AT) {
		CREATED_AT = cREATED_AT;
	}
	public int getORDERS_ID() {
		return ORDERS_ID;
	}
	public void setORDERS_ID(int oRDERS_ID) {
		ORDERS_ID = oRDERS_ID;
	}
	public String getORDERS_NAME() {
		return ORDERS_NAME;
	}
	public void setORDERS_NAME(String oRDERS_NAME) {
		ORDERS_NAME = oRDERS_NAME;
	}
	public String getUSER_ID() {
		return USER_ID;
	}
	public void setUSER_ID(String uSER_ID) {
		USER_ID = uSER_ID;
	}
	public String getUSER_NAME() {
		return USER_NAME;
	}
	public void setUSER_NAME(String uSER_NAME) {
		USER_NAME = uSER_NAME;
	}
	public String getPHONE() {
		return PHONE;
	}
	public String getDELIVERY_MESSAGE() {
		return DELIVERY_MESSAGE;
	}
	public void setDELIVERY_MESSAGE(String dELIVERY_MESSAGE) {
		DELIVERY_MESSAGE = dELIVERY_MESSAGE;
	}
	public void setPHONE(String pHONE) {
		PHONE = pHONE;
	}

	public String getFIR_ADDRESS() {
		return FIR_ADDRESS;
	}
	public void setFIR_ADDRESS(String fIR_ADDRESS) {
		FIR_ADDRESS = fIR_ADDRESS;
	}
	public String getSEC_ADDRESS() {
		return SEC_ADDRESS;
	}
	public void setSEC_ADDRESS(String sEC_ADDRESS) {
		SEC_ADDRESS = sEC_ADDRESS;
	}
	public int getPRODUCT_ID() {
		return PRODUCT_ID;
	}
	public void setPRODUCT_ID(int pRODUCT_ID) {
		PRODUCT_ID = pRODUCT_ID;
	}
	public int getCOUNT() {
		return COUNT;
	}
	public void setCOUNT(int cOUNT) {
		COUNT = cOUNT;
	}
	public int getTOTAL_PRICE() {
		return TOTAL_PRICE;
	}
	public void setTOTAL_PRICE(int tOTAL_PRICE) {
		TOTAL_PRICE = tOTAL_PRICE;
	}
	public Date getORDERSDATE() {
		return ORDERSDATE;
	}
	public void setORDERSDATE(Date oRDERSDATE) {
		ORDERSDATE = oRDERSDATE;
	}
	public String getSTATUS() {
		return STATUS;
	}
	public void setSTATUS(String sTATUS) {
		STATUS = sTATUS;
	}


	public String getEXCHANGE_MESSAGE() {
		return EXCHANGE_MESSAGE;
	}


	public void setEXCHANGE_MESSAGE(String eXCHANGE_MESSAGE) {
		EXCHANGE_MESSAGE = eXCHANGE_MESSAGE;
	}
	
	public String getTRACKING_NAME() {
		return TRACKING_NAME;
	}
	public void setTRACKING_NAME(String tRACKING_NAME) {
		TRACKING_NAME = tRACKING_NAME;
	}
	public int getIS_REVIEWED() {
		return IS_REVIEWED;
	}
	public void setIS_REVIEWED(int iS_REVIEWED) {
		IS_REVIEWED = iS_REVIEWED;
	}
	
	@Override
	public String toString() {
		return "OrdersVO [ORDERS_ID=" + ORDERS_ID + ", ORDERS_NAME=" + ORDERS_NAME + ", USER_ID=" + USER_ID
				+ ", USER_NAME=" + USER_NAME + ", PHONE=" + PHONE + ", DELIVERY_MESSAGE=" + DELIVERY_MESSAGE
				+ ", FIR_ADDRESS=" + FIR_ADDRESS + ", SEC_ADDRESS=" + SEC_ADDRESS + ", PRODUCT_ID=" + PRODUCT_ID
				+ ", COUNT=" + COUNT + ", PRICE=" + PRICE + ", TOTAL_PRICE=" + TOTAL_PRICE + ", ORDERSDATE="
				+ ORDERSDATE + ", STATUS=" + STATUS + ", CID=" + CID + ", TID=" + TID + ", AID=" + AID
				+ ", PARTNER_ORDER_ID=" + PARTNER_ORDER_ID + ", PARTNER_USER_ID=" + PARTNER_USER_ID + ", ITEM_NAME="
				+ ITEM_NAME + ", QUANTITY=" + QUANTITY + ", TOTAL_AMOUNT=" + TOTAL_AMOUNT + ", VAT_AMOUNT=" + VAT_AMOUNT
				+ ", APPROVED_AT=" + APPROVED_AT + ", CREATED_AT=" + CREATED_AT + ", EXCHANGE_MESSAGE="
				+ EXCHANGE_MESSAGE + ", TRACKING_NUMBER=" + TRACKING_NUMBER + ", PRODUCT_NAME=" + PRODUCT_NAME
				+ ", TRACKING_NAME=" + TRACKING_NAME + "]";
	}


	}
