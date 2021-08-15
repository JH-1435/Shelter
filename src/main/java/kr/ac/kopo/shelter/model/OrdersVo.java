package kr.ac.kopo.shelter.model;

import java.util.Date;

public class OrdersVo {
	int ordersNum;
	int animalNum;
	int boardNum;
	
	String animalTitle;
	String animalName;
	String animalSex;
	String animalImg;
	
	String boardTitle;
	String boardContent;
	Date boardDate;
	int boardReadCount;
	Date boardOkayDate;
	
	String userId;
	String userName;
	String userTel;
		
	
	public int getOrdersNum() {
		return ordersNum;
	}
	public void setOrdersNum(int ordersNum) {
		this.ordersNum = ordersNum;
	}
	public int getAnimalNum() {
		return animalNum;
	}
	public void setAnimalNum(int animalNum) {
		this.animalNum = animalNum;
	}
	public int getBoardNum() {
		return boardNum;
	}
	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}
	public String getAnimalTitle() {
		return animalTitle;
	}
	public void setAnimalTitle(String animalTitle) {
		this.animalTitle = animalTitle;
	}
	public String getAnimalName() {
		return animalName;
	}
	public void setAnimalName(String animalName) {
		this.animalName = animalName;
	}
	public String getAnimalSex() {
		return animalSex;
	}
	public void setAnimalSex(String animalSex) {
		this.animalSex = animalSex;
	}
	public String getAnimalImg() {
		return animalImg;
	}
	public void setAnimalImg(String animalImg) {
		this.animalImg = animalImg;
	}
	public String getBoardTitle() {
		return boardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	public String getBoardContent() {
		return boardContent;
	}
	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}
	public Date getBoardDate() {
		return boardDate;
	}
	public void setBoardDate(Date boardDate) {
		this.boardDate = boardDate;
	}
	public int getBoardReadCount() {
		return boardReadCount;
	}
	public void setBoardReadCount(int boardReadCount) {
		this.boardReadCount = boardReadCount;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserTel() {
		return userTel;
	}
	public void setUserTel(String userTel) {
		this.userTel = userTel;
	}
	public Date getBoardOkayDate() {
		return boardOkayDate;
	}
	public void setBoardOkayDate(Date boardOkayDate) {
		this.boardOkayDate = boardOkayDate;
	}

	
}
