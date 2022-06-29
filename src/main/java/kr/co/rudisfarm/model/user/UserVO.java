package kr.co.rudisfarm.model.user;

import java.sql.Date;

public class UserVO {
	private String USER_ID;
	private String PASSWORD;
	private String EMAIL;
	private String USER_NAME;
	private String COMPANY_NAME;
	private String FIR_ADDRESS;
	private String SEC_ADDRESS;
	private String PHONE;
	private Date JOINDATE;
	private Date BIRTHDATE;
	private int GENDER;
	private String SERIAL; // 사업자 등록번호(판매자만 보유 가능)
	private String SERIAL_RESULT;
	private String FILE;
	private int LEVEL; // 유저의 종류(0: 슈퍼관리자, 1: 판매자, 2: 구매자)
	private int STATUS; // 유저의 현재 상태(0: 미승인, 1: 승인, 2: 정지, 3: 재승인 신청, 4: 재승인 거부, 5: 탈퇴)
	private String PLATFORM; // 유저의 가입 플랫폼
	private int PREMIUM_COUNT;	// 판매자의 프리미엄 여부
	private int CURRENT_INCOME;	// 정산받지 못한 현재 수익금
	
	
	public String getUSER_ID() {
		return USER_ID;
	}
	public void setUSER_ID(String uSER_ID) {
		USER_ID = uSER_ID;
	}
	public String getPASSWORD() {
		return PASSWORD;
	}
	public void setPASSWORD(String pASSWORD) {
		PASSWORD = pASSWORD;
	}
	public String getEMAIL() {
		return EMAIL;
	}
	public void setEMAIL(String eMAIL) {
		EMAIL = eMAIL;
	}

	public String getUSER_NAME() {
		return USER_NAME;
	}

	public void setUSER_NAME(String uSER_NAME) {
		USER_NAME = uSER_NAME;
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
	public String getPHONE() {
		return PHONE;
	}
	public void setPHONE(String pHONE) {
		PHONE = pHONE;
	}
	public Date getJOINDATE() {
		return JOINDATE;
	}
	public void setJOINDATE(Date jOINDATE) {
		JOINDATE = jOINDATE;
	}
	public Date getBIRTHDATE() {
		return BIRTHDATE;
	}
	public void setBIRTHDATE(Date bIRTHDATE) {
		BIRTHDATE = bIRTHDATE;
	}
	public int getGENDER() {
		return GENDER;
	}
	public void setGENDER(int gENDER) {
		GENDER = gENDER;
	}
	public String getSERIAL() {
		return SERIAL;
	}
	public void setSERIAL(String sERIAL) {
		SERIAL = sERIAL;
	}
	
	public String getSERIAL_RESULT() {
		return SERIAL_RESULT;
	}

	public void setSERIAL_RESULT(String sERIAL_RESULT) {
		SERIAL_RESULT = sERIAL_RESULT;
	}

	public String getFILE() {
		return FILE;
	}

	public void setFILE(String fILE) {
		FILE = fILE;
	}
	
	public int getLEVEL() {
		return LEVEL;
	}
	public void setLEVEL(int lEVEL) {
		LEVEL = lEVEL;
	}
	public int getSTATUS() {
		return STATUS;
	}
	public void setSTATUS(int sTATUS) {
		STATUS = sTATUS;
	}
	
	public String getPLATFORM() {
		return PLATFORM;
	}

	public void setPLATFORM(String pLATFORM) {
		PLATFORM = pLATFORM;
	}
	
	public String getCOMPANY_NAME() {
		return COMPANY_NAME;
	}
	public void setCOMPANY_NAME(String cOMPANY_NAME) {
		COMPANY_NAME = cOMPANY_NAME;
	}
	public int getPREMIUM_COUNT() {
		return PREMIUM_COUNT;
	}
	public void setPREMIUM_COUNT(int pREMIUM_COUNT) {
		PREMIUM_COUNT = pREMIUM_COUNT;
	}
	public int getCURRENT_INCOME() {
		return CURRENT_INCOME;
	}
	public void setCURRENT_INCOME(int cURRENT_INCOME) {
		CURRENT_INCOME = cURRENT_INCOME;
	}
	@Override
	public String toString() {
		return "UserVO [USER_ID=" + USER_ID + ", PASSWORD=" + PASSWORD + ", EMAIL=" + EMAIL + ", USER_NAME=" + USER_NAME
				+ ", COMPANY_NAME=" + COMPANY_NAME + ", FIR_ADDRESS=" + FIR_ADDRESS + ", SEC_ADDRESS=" + SEC_ADDRESS
				+ ", PHONE=" + PHONE + ", JOINDATE=" + JOINDATE + ", BIRTHDATE=" + BIRTHDATE + ", GENDER=" + GENDER
				+ ", SERIAL=" + SERIAL + ", SERIAL_RESULT=" + SERIAL_RESULT + ", FILE=" + FILE + ", LEVEL=" + LEVEL
				+ ", STATUS=" + STATUS + ", PLATFORM=" + PLATFORM + ", PREMIUM_COUNT=" + PREMIUM_COUNT + ", CURRENT_INCOME="
				+ CURRENT_INCOME + "]";
	}
	
}
