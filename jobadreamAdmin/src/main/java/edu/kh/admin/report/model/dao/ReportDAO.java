package edu.kh.admin.report.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.admin.report.model.vo.Pagination;
import edu.kh.admin.report.model.vo.Report;


@Repository
public class ReportDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	
	// 신고 게시물 수 조회
	public Pagination getListCount() {
		
		return sqlSession.selectOne("reportMapper.getListCount");
	}

	// 신고 목록 조회
	public List<Report> reportList(Pagination pagination) {
		// RowBounds사용
		int offset = (pagination.getCurrentPage() - 1)*pagination.getLimit();
		RowBounds rowBouns = new RowBounds(offset, pagination.getLimit());
		return sqlSession.selectList("reportMapper.selectReportList", pagination, rowBouns);
	}
	//페이징처리(상태필터)
	public Pagination getSearchListCount(String st) {
		
		return sqlSession.selectOne("reportMapper.getSearchListCount",st);
	}
	
	// reportList불러오기
	public List<Report> selectSearchList(String st, Pagination pagination) {
		
		int offset = (pagination.getCurrentPage() -1)* pagination.getLimit();   
	    RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
	    return sqlSession.selectList("reportMapper.selectSearchList", st, rowBounds);
	}
	
	//신고 상세 조회

	public Report selectReport(int reportNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("reportMapper.selectReport",reportNo);
	}
	
	//신고확인
	
    public int checkReport(int reportNo){
        return sqlSession.update("reportMapper.checkReport", reportNo);
      }
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
