package edu.kh.admin.report.model.vo;

import java.sql.Timestamp;

public class Report {

	private int reportNo;
	private String reportTitle;
	private String reportContent;
	private Timestamp reportDt;
	private String reportReplyStatus;
	private int reportCategoryCd;
	private String reportCategoryTitle;
	private String categoryTitle;
	private int memberNo;
	private String memberId;
	private String filePath;
	private String fileName;
	
	public Report() {}

	public int getReportNo() {
		return reportNo;
	}

	public void setReportNo(int reportNo) {
		this.reportNo = reportNo;
	}

	public String getReportTitle() {
		return reportTitle;
	}

	public void setReportTitle(String reportTitle) {
		this.reportTitle = reportTitle;
	}

	public String getReportContent() {
		return reportContent;
	}

	public void setReportContent(String reportContent) {
		this.reportContent = reportContent;
	}

	public Timestamp getReportDt() {
		return reportDt;
	}

	public void setReportDt(Timestamp reportDt) {
		this.reportDt = reportDt;
	}

	public String getReportReplyStatus() {
		return reportReplyStatus;
	}

	public void setReportReplyStatus(String reportReplyStatus) {
		this.reportReplyStatus = reportReplyStatus;
	}

	public int getReportCategoryCd() {
		return reportCategoryCd;
	}

	public void setReportCategoryCd(int reportCategoryCd) {
		this.reportCategoryCd = reportCategoryCd;
	}

	public String getReportCategoryTitle() {
		return reportCategoryTitle;
	}

	public void setReportCategoryTitle(String reportCategoryTitle) {
		this.reportCategoryTitle = reportCategoryTitle;
	}

	public String getCategoryTitle() {
		return categoryTitle;
	}

	public void setCategoryTitle(String categoryTitle) {
		this.categoryTitle = categoryTitle;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	@Override
	public String toString() {
		return "Report [reportNo=" + reportNo + ", reportTitle=" + reportTitle + ", reportContent=" + reportContent
				+ ", reportDt=" + reportDt + ", reportReplyStatus=" + reportReplyStatus + ", reportCategoryCd="
				+ reportCategoryCd + ", reportCategoryTitle=" + reportCategoryTitle + ", categoryTitle=" + categoryTitle
				+ ", memberNo=" + memberNo + ", memberId=" + memberId + ", filePath=" + filePath + ", fileName="
				+ fileName + "]";
	}

}	