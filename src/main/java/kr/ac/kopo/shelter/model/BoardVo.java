package kr.ac.kopo.shelter.model;

import java.util.Date;
import java.util.List;

public class BoardVo {
	int boardNum;
	Date boardDate;
	String boardContent;
	String boardTitle;
	int boardReadCount;
	String userId;
	Date boardOkayDate;
	
	
	String userName;
	
	List<OrdersVo> orders;
	
	
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public List<OrdersVo> getOrders() {
		return orders;
	}

	public void setOrders(List<OrdersVo> orders) {
		this.orders = orders;
	}

	public int getBoardNum() {
		return boardNum;
	}

	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}

	public Date getBoardDate() {
		return boardDate;
	}

	public void setBoardDate(Date boardDate) {
		this.boardDate = boardDate;
	}

	public String getBoardContent() {
		return boardContent;
	}

	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public int getBoardReadCount() {
		return boardReadCount;
	}

	public void setBoardReadCount(int boardReadCount) {
		this.boardReadCount = boardReadCount;
	}
		
	public Date getBoardOkayDate() {
		return boardOkayDate;
	}

	public void setBoardOkayDate(Date boardOkayDate) {
		this.boardOkayDate = boardOkayDate;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

}
