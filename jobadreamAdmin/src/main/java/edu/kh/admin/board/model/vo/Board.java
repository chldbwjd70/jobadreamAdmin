package edu.kh.admin.board.model.vo;

import java.sql.Timestamp;

public class Board {
	private int boardNo;
	private String boardTitle;
	private Timestamp createDate;
	private int memberNo;
	private String memberName;
	private int categoryCode;
	private String categoryTitle;
	private String boardTime;
	private String boardPlace;
	private int boardPay;

	
	public Board() {
		
	}


	public int getBoardNo() {
		return boardNo;
	}


	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}


	public String getBoardTitle() {
		return boardTitle;
	}


	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}


	public Timestamp getCreateDate() {
		return createDate;
	}


	public void setCreateDate(Timestamp createDate) {
		this.createDate = createDate;
	}


	public int getMemberNo() {
		return memberNo;
	}


	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}


	public String getMemberName() {
		return memberName;
	}


	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}


	public int getCategoryCode() {
		return categoryCode;
	}


	public void setCategoryCode(int categoryCode) {
		this.categoryCode = categoryCode;
	}


	public String getCategoryTitle() {
		return categoryTitle;
	}


	public void setCategoryTitle(String categoryTitle) {
		this.categoryTitle = categoryTitle;
	}


	public String getBoardTime() {
		return boardTime;
	}


	public void setBoardTime(String boardTime) {
		this.boardTime = boardTime;
	}


	public String getBoardPlace() {
		return boardPlace;
	}


	public void setBoardPlace(String boardPlace) {
		this.boardPlace = boardPlace;
	}


	public int getBoardPay() {
		return boardPay;
	}


	public void setBoardPay(int boardPay) {
		this.boardPay = boardPay;
	}


	@Override
	public String toString() {
		return "Board [boardNo=" + boardNo + ", boardTitle=" + boardTitle + ", createDate=" + createDate + ", memberNo="
				+ memberNo + ", memberName=" + memberName + ", categoryCode=" + categoryCode + ", categoryTitle="
				+ categoryTitle + ", boardTime=" + boardTime + ", boardPlace=" + boardPlace + ", boardPay=" + boardPay
				+ "]";
	}
	
	
	
}
