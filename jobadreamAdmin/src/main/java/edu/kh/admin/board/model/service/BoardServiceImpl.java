package edu.kh.admin.board.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import edu.kh.admin.board.model.dao.BoardDAO;
import edu.kh.admin.board.model.vo.Board;
import edu.kh.admin.board.model.vo.Pagination;


public class BoardServiceImpl implements BoardService{
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@Autowired
	private BoardDAO dao;

	
	@Override
	public Pagination getPagination(Pagination pg) {
		Pagination selectPg = dao.getListCount();
		
		return new Pagination(pg.getCurrentPage(), selectPg.getListCount());
	}

	// 게시판 조회
	@Override
	public List<Board> boardList(Pagination pagination) {
		return dao.boardList(pagination);
	}
	
	//페이징처리(상태필터)
	@Override
	public Pagination getPagination(String st, Pagination pg) {
		 Pagination selectPg = dao.getSearchListCount(st);
	      return new Pagination(pg.getCurrentPage(),
	            selectPg.getListCount() );
	}
	
	//보더리스트 불러오기
	@Override
	public List<Board> selectboardList(String st, Pagination pagination) {
		
		return dao.selectSearchList(st,pagination);
	}


}
