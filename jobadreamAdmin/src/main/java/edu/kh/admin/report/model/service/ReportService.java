package edu.kh.admin.report.model.service;

import java.util.List;

import edu.kh.admin.report.model.vo.Pagination;
import edu.kh.admin.report.model.vo.Report;

public interface ReportService {

	
	
	//페이징 처리
	Pagination getPagination(Pagination pg);

	
	// 신고 조회
	List<Report> reportList(Pagination pagination);

	//페이징처리(상태필터)
	Pagination getPagination(String st, Pagination pg);

	// reportList 불러오기 
	List<Report> selectReportList(String st, Pagination pagination);

	
	
	// 신고 상세조회
	Report selectReport(int reportNo);
	
	
	//신고확인
	int checkReport(int no);



	
	
	
	
	
}
