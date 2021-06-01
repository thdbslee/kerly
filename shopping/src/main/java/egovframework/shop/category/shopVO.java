package egovframework.shop.category;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import egovframework.com.cmm.ComDefaultVO;

public class shopVO extends ComDefaultVO{
	private int INX;
	private String[] INXS;
	private String p_name;
	private int price;
	private MultipartFile IMG1;
	private String IMG_1;
	
	private String FILE_NAME;
	private int INFO;
	private String category;
	private String content;
	private String USER_ID;
	private String color;
	private String p_size;
	
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public String getP_size() {
		return p_size;
	}
	public void setP_size(String p_size) {
		this.p_size = p_size;
	}
	public String getFILE_NAME() {
		return FILE_NAME;
	}
	public void setFILE_NAME(String fILE_NAME) {
		FILE_NAME = fILE_NAME;
	}
	public String getUSER_ID() {
		return USER_ID;
	}
	public void setUSER_ID(String uSER_ID) {
		USER_ID = uSER_ID;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getINX() {
		return INX;
	}
	public void setINX(int iNX) {
		INX = iNX;
	}
	public String[] getINXS() {
		return INXS;
	}
	public void setINXS(String[] iNXS) {
		INXS = iNXS;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public MultipartFile getIMG1() {
		return IMG1;
	}
	public void setIMG1(MultipartFile iMG1) {
		IMG1 = iMG1;
	}
	public String getIMG_1() {
		return IMG_1;
	}
	public void setIMG_1(String iMG_1) {
		IMG_1 = iMG_1;
	}
	public int getINFO() {
		return INFO;
	}
	public void setINFO(int iNFO) {
		INFO = iNFO;
	}
	
	
}
