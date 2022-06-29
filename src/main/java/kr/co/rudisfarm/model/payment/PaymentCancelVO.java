package kr.co.rudisfarm.model.payment;

import java.util.Date;

public class PaymentCancelVO {
	private String TID;
	private String AID;
	private String STATUS;
	private String PARTNER_ORDER_ID; 
	private String PARTNER_USER_ID; 
	private String ITEM_NAME; 
	private int QUANTITY;	
	private int TOTAL_AMOUNT; 
	private int TAX_FREE_AMOUNT; 
	private int VAT_AMOUNT; 
	private String PAYMENT_METHOD_TYPE; 
	private Date CREATED_AT; 
	private Date APPROVED_AT; 
	private Date CANCELED_AT; 
	private int CANCEL_AMOUNT;
	
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
	public String getSTATUS() {
		return STATUS;
	}
	public void setSTATUS(String sTATUS) {
		STATUS = sTATUS;
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
	public int getTAX_FREE_AMOUNT() {
		return TAX_FREE_AMOUNT;
	}
	public void setTAX_FREE_AMOUNT(int tAX_FREE_AMOUNT) {
		TAX_FREE_AMOUNT = tAX_FREE_AMOUNT;
	}
	public int getVAT_AMOUNT() {
		return VAT_AMOUNT;
	}
	public void setVAT_AMOUNT(int vAT_AMOUNT) {
		VAT_AMOUNT = vAT_AMOUNT;
	}
	public String getPAYMENT_METHOD_TYPE() {
		return PAYMENT_METHOD_TYPE;
	}
	public void setPAYMENT_METHOD_TYPE(String pAYMENT_METHOD_TYPE) {
		PAYMENT_METHOD_TYPE = pAYMENT_METHOD_TYPE;
	}
	public Date getCREATED_AT() {
		return CREATED_AT;
	}
	public void setCREATED_AT(Date cREATED_AT) {
		CREATED_AT = cREATED_AT;
	}
	public Date getAPPROVED_AT() {
		return APPROVED_AT;
	}
	public void setAPPROVED_AT(Date aPPROVED_AT) {
		APPROVED_AT = aPPROVED_AT;
	}
	public Date getCANCELED_AT() {
		return CANCELED_AT;
	}
	public void setCANCELED_AT(Date cANCELED_AT) {
		CANCELED_AT = cANCELED_AT;
	}
	public int getCANCEL_AMOUNT() {
		return CANCEL_AMOUNT;
	}
	public void setCANCEL_AMOUNT(int cANCEL_AMOUNT) {
		CANCEL_AMOUNT = cANCEL_AMOUNT;
	}
	
	@Override
	public String toString() {
		return "PaymentCancelVO [TID=" + TID + ", AID=" + AID + ", STATUS=" + STATUS + ", PARTNER_ORDER_ID="
				+ PARTNER_ORDER_ID + ", PARTNER_USER_ID=" + PARTNER_USER_ID + ", ITEM_NAME=" + ITEM_NAME + ", QUANTITY="
				+ QUANTITY + ", TOTAL_AMOUNT=" + TOTAL_AMOUNT + ", TAX_FREE_AMOUNT=" + TAX_FREE_AMOUNT + ", VAT_AMOUNT="
				+ VAT_AMOUNT + ", PAYMENT_METHOD_TYPE=" + PAYMENT_METHOD_TYPE + ", CREATED_AT=" + CREATED_AT
				+ ", APPROVED_AT=" + APPROVED_AT + ", CANCELED_AT=" + CANCELED_AT + ", CANCEL_AMOUNT=" + CANCEL_AMOUNT
				+ "]";
	} 
}
