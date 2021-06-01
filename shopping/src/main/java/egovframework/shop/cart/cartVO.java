package egovframework.shop.cart;

public class cartVO {
	
	private int P_INX;
	private int AMOUNT;
	private int TOTAL;
	private String USER_ID;
	private String IMG_1;
	private String PRICE;
	private String p_name;
	private String[] C_INXS;
	private int C_INX;
	
	public int getC_INX() {
		return C_INX;
	}
	public void setC_INX(int c_INX) {
		C_INX = c_INX;
	}
	public String[] getC_INXS() {
		return C_INXS;
	}
	public void setC_INXS(String[] c_INXS) {
		C_INXS = c_INXS;
	}
	public int getTOTAL() {
		return TOTAL;
	}
	public void setTOTAL(int tOTAL) {
		TOTAL = tOTAL;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public String getPRICE() {
		return PRICE;
	}
	public void setPRICE(String pRICE) {
		PRICE = pRICE;
	}
	
	public String getIMG_1() {
		return IMG_1;
	}
	public void setIMG_1(String iMG_1) {
		IMG_1 = iMG_1;
	}
	public String getUSER_ID() {
		return USER_ID;
	}
	public void setUSER_ID(String uSER_ID) {
		USER_ID = uSER_ID;
	}
	
	public int getP_INX() {
		return P_INX;
	}
	public void setP_INX(int p_INX) {
		P_INX = p_INX;
	}
	public int getAMOUNT() {
		return AMOUNT;
	}
	public void setAMOUNT(int aMOUNT) {
		AMOUNT = aMOUNT;
	}
	
	
}
