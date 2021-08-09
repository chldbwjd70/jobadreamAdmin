package edu.kh.admin.qusetions.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.admin.qusetions.model.dao.QusetionsDAO;

import edu.kh.admin.qusetions.model.vo.Pagination;
import edu.kh.admin.qusetions.model.vo.Qusetions;

@Service
public class QusetionsServiceImpl implements QusetionsService{
	
	@Autowired
	private QusetionsDAO dao;

	
	// 1:1문의 게시글 수 조회
	@Override
	public Pagination getPagination(Pagination pg) {
		
		Pagination selectPg = dao.getListCount();
		return new Pagination(pg.getCurrentPage(), selectPg.getListCount());
	}

	// 1:1문의 목록조회
	@Override
	public List<Qusetions> selectQusetionsList(Pagination pagination) {
		// TODO Auto-generated method stub
		return dao.selectQusetionList(pagination);
	}
	// 1:1문의 상세조회
	@Override
	public Qusetions selectQusetions(int qusetionsNo) {
		// TODO Auto-generated method stub
		return dao.selectQusetions(qusetionsNo);
	}
	
}
