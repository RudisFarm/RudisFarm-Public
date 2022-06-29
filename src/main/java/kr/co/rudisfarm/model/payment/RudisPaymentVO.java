package kr.co.rudisfarm.model.payment;

import java.util.Date;

public class RudisPaymentVO {

	int ORDERS_ID;
	String ORDERS_NAME;
	String USER_ID;
	int PAYMENT_ID;
	Date ORDERSDATE;
	int PRICE;
	
	
	String CID;
	String TID;
	String AID;
	String STATUS;
	String PARTNER_ORDER_ID;
	String PARTNER_USER_ID;
	String ITEM_NAME;
	int QUANTITY;
	int TOTAL_AMOUNT;
	int VAT_AMOUNT;
	Date APPROVED_AT;
	Date CREATED_AT;
	
	public Date getCREATED_AT() {
		return CREATED_AT;
	}
	public void setCREATED_AT(Date cREATED_AT) {
		CREATED_AT = cREATED_AT;
	}
	String PAYMENT_METHOD_TYPE;
	int CANCEL_AMOUNT;
	
	private String searchCondition;
	private String searchKeyword;
	
	public String getSearchCondition() {
		return searchCondition;
	}
	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}
	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}
	private int pageSize = 10;
	/** 한 페이지당 게시글 수 **/
	private int rangeSize = 10;
	/** 한 블럭(range)당 페이지 수 **/
	private int curPage = 1;
	/** 현재 페이지 **/
	private int curRange = 1;
	/** 현재 블럭(range) **/
	private int listCnt;
	/** 총 게시글 수 **/
	private int pageCnt;
	/** 총 페이지 수 **/
	private int rangeCnt;
	/** 총 블럭(range) 수 **/
	private int startPage = 1;
	/** 시작 페이지 **/
	private int endPage = 1;
	/** 끝 페이지 **/
	private int startIndex = 0;
	/** 시작 index **/
	private int prevPage;
	/** 이전 페이지 **/
	private int nextPage;

	/** 다음 페이지 **/
	
	
	public Date getAPPROVED_AT() {
		return APPROVED_AT;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getRangeSize() {
		return rangeSize;
	}
	public void setRangeSize(int rangeSize) {
		this.rangeSize = rangeSize;
	}
	public int getCurPage() {
		return curPage;
	}
	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}
	public int getCurRange() {
		return curRange;
	}
	public void setCurRange(int curRange) {
		this.curRange = curRange;
	}
	public int getListCnt() {
		return listCnt;
	}
	public void setListCnt(int listCnt) {
		this.listCnt = listCnt;
	}
	public int getPageCnt() {
		return pageCnt;
	}
	public void setPageCnt(int pageCnt) {
		this.pageCnt = pageCnt;
	}
	public int getRangeCnt() {
		return rangeCnt;
	}
	public void setRangeCnt(int rangeCnt) {
		this.rangeCnt = rangeCnt;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public int getStartIndex() {
		return startIndex;
	}
	public void setStartIndex(int startIndex) {
		this.startIndex = startIndex;
	}
	public int getPrevPage() {
		return prevPage;
	}
	public void setPrevPage(int prevPage) {
		this.prevPage = prevPage;
	}
	public int getNextPage() {
		return nextPage;
	}
	public void setNextPage(int nextPage) {
		this.nextPage = nextPage;
	}
	public void setAPPROVED_AT(Date aPPROVED_AT) {
		APPROVED_AT = aPPROVED_AT;
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
	public int getPAYMENT_ID() {
		return PAYMENT_ID;
	}
	public void setPAYMENT_ID(int pAYMENT_ID) {
		PAYMENT_ID = pAYMENT_ID;
	}
	public Date getORDERSDATE() {
		return ORDERSDATE;
	}
	public void setORDERSDATE(Date oRDERSDATE) {
		ORDERSDATE = oRDERSDATE;
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
	public int getCANCEL_AMOUNT() {
		return CANCEL_AMOUNT;
	}
	public void setCANCEL_AMOUNT(int cANCEL_AMOUNT) {
		CANCEL_AMOUNT = cANCEL_AMOUNT;
	}
	@Override
	public String toString() {
		return "RudisPaymentVO [ORDERS_ID=" + ORDERS_ID + ", ORDERS_NAME=" + ORDERS_NAME + ", USER_ID=" + USER_ID
				+ ", PAYMENT_ID=" + PAYMENT_ID + ", ORDERSDATE=" + ORDERSDATE + ", PRICE=" + PRICE + ", CID=" + CID
				+ ", TID=" + TID + ", AID=" + AID + ", STATUS=" + STATUS + ", PARTNER_ORDER_ID=" + PARTNER_ORDER_ID
				+ ", PARTNER_USER_ID=" + PARTNER_USER_ID + ", ITEM_NAME=" + ITEM_NAME + ", QUANTITY=" + QUANTITY
				+ ", TOTAL_AMOUNT=" + TOTAL_AMOUNT + ", VAT_AMOUNT=" + VAT_AMOUNT + ", PAYMENT_METHOD_TYPE="
				+ PAYMENT_METHOD_TYPE + ", CANCEL_AMOUNT=" + CANCEL_AMOUNT + "]";
	}
	
	
	
	

}
