package kr.ac.kopo.shelter.model;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class AnimalsVo {
	int animalNum;
	String animalName;
	Date animalRegDate;
	String animalAge;
	String animalState;
	String animalSex;
	String animalImg;
	String animalLocation;
	String animalTitle;
	
	MultipartFile uploadFile; 
	
	int adminNum;
	String adminId;
	int amount;
	

	public int getAdminNum() {
		return adminNum;
	}
	public void setAdminNum(int adminNum) {
		this.adminNum = adminNum;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public int getAnimalNum() {
		return animalNum;
	}
	public void setAnimalNum(int animalNum) {
		this.animalNum = animalNum;
	}
	public String getAnimalName() {
		return animalName;
	}
	public void setAnimalName(String animalName) {
		this.animalName = animalName;
	}
	public Date getAnimalRegDate() {
		return animalRegDate;
	}
	public void setAnimalRegDate(Date animalRegDate) {
		this.animalRegDate = animalRegDate;
	}
	public String getAnimalAge() {
		return animalAge;
	}
	public void setAnimalAge(String animalAge) {
		this.animalAge = animalAge;
	}
	public String getAnimalState() {
		return animalState;
	}
	public void setAnimalState(String animalState) {
		this.animalState = animalState;
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
	public String getAnimalLocation() {
		return animalLocation;
	}
	public void setAnimalLocation(String animalLocation) {
		this.animalLocation = animalLocation;
	}
	public String getAnimalTitle() {
		return animalTitle;
	}
	public void setAnimalTitle(String animalTitle) {
		this.animalTitle = animalTitle;
	}
	public String getAdminId() {
		return adminId;
	}
	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}
	public MultipartFile getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}
}
