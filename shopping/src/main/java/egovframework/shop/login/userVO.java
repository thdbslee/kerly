package egovframework.shop.login;

import egovframework.com.cmm.ComDefaultVO;

public class userVO  extends ComDefaultVO {
	private int INX;
	private String[] INXS;
	private String AUTHCODE ="";
	private String USER_ID ="";
	private String USER_PASSWD = "";
	private String USER_PHONE = "";
	private String USER_ADDRESS = "";
	private String USER_NAME = "";
	private String ADR;
	private String DEADR;
	
	
	public String[] getINXS() {
		return INXS;
	}
	public void setINXS(String[] iNXS) {
		INXS = iNXS;
	}
	public String getDEADR() {
		return DEADR;
	}
	public void setDEADR(String dEADR) {
		DEADR = dEADR;
	}
	public String getADR() {
		return ADR;
	}
	public void setADR(String aDR) {
		ADR = aDR;
	}
	public int getINX() {
		return INX;
	}
	public void setINX(int iNX) {
		INX = iNX;
	}
	public String getAUTHCODE() {
		return AUTHCODE;
	}
	public void setAUTHCODE(String aUTHCODE) {
		AUTHCODE = aUTHCODE;
	}
	public String getUSER_ID() {
		return USER_ID;
	}
	public void setUSER_ID(String uSER_ID) {
		USER_ID = uSER_ID;
	}
	public String getUSER_PASSWD() {
		return USER_PASSWD;
	}
	public void setUSER_PASSWD(String uSER_PASSWD) {
		USER_PASSWD = uSER_PASSWD;
	}
	public String getUSER_PHONE() {
		return USER_PHONE;
	}
	public void setUSER_PHONE(String uSER_PHONE) {
		USER_PHONE = uSER_PHONE;
	}
	public String getUSER_ADDRESS() {
		return USER_ADDRESS;
	}
	public void setUSER_ADDRESS(String uSER_ADDRESS) {
		USER_ADDRESS = uSER_ADDRESS;
	}
	public String getUSER_NAME() {
		return USER_NAME;
	}
	public void setUSER_NAME(String uSER_NAME) {
		USER_NAME = uSER_NAME;
	}
	
	
}