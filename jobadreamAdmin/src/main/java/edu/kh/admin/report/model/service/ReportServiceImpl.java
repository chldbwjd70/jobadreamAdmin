package edu.kh.admin.report.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import edu.kh.admin.report.model.dao.ReportDAO;
import edu.kh.admin.report.model.vo.Pagination;
import edu.kh.admin.report.model.vo.Report;

@Service
public class ReportServiceImpl implements ReportService{

	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@Autowired
	private ReportDAO dao;
	
	
	
	//
	@Override
	public Pagination getPagination(Pagination pg) {
		Pagination selectPg = dao.getListCount();
		
		return new Pagination(pg.getCurrentPage(), selectPg.getListCount());
	}
	// 신고 목록 조회
	@Override
	public List<Report> reportList(Pagination pagination) {
		
		return dao.reportList(pagination);
	}

	//페이징처리(상태필터)
	@Override
	public Pagination getPagination(String st, Pagination pg) {
		 Pagination selectPg = dao.getSearchListCount(st);
	      return new Pagination(pg.getCurrentPage(),
	            selectPg.getListCount() );
	
	
	}
	//ReportList 불러오기
	@Override
	public List<Report> selectReportList(String st, Pagination pagination) {

		return dao.selectSearchList(st,pagination);
	}
	
	
	
	// 신고 상세 조회
	@Override
	public Report selectReport(int reportNo) {

		return dao.selectReport(reportNo);
	}
	
	//신고확인
	  @Override
      public int checkReport(int no) {
         return dao.checkReport(no);
      }
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
