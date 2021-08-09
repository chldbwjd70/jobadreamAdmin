package edu.kh.admin.board.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import edu.kh.admin.board.model.dao.BoardDAO;
import edu.kh.admin.board.model.vo.Board;
import edu.kh.admin.board.model.vo.Pagination;

@Service
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
	
	
	// 게시글 상세 조회
	@Override
	public Board selectBoard(int boardNo) {
		
		return dao.selectBoard(boardNo);
	}
	//크로스사이트 스크립트 방지처리
	public static String replaceParameter(String param) {
	      String result = param;
	      if(param != null) {
	         result = result.replaceAll("&", "&amp;");
	         result = result.replaceAll("<", "&lt;");
	         result = result.replaceAll(">", "&gt;");
	         result = result.replaceAll("\"", "&quot;");
	      }
	      
	      return result;
	}


}
