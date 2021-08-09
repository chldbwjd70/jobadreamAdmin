package edu.kh.admin.board.model.service;

import java.util.List;

import edu.kh.admin.board.model.vo.Board;
import edu.kh.admin.board.model.vo.Pagination;

public interface BoardService {

	
	
	
	
	//페이징 처리
	Pagination getPagination(Pagination pg);

	
	// 게시판조회
	List<Board> boardList(Pagination pagination);

	//페이징처리(상태필터)
	Pagination getPagination(String st, Pagination pg);
	
	
	// memberList불러오기
	List<Board> selectboardList(String st, Pagination pagination);

	
	
	// 게시글 상세조회
	Board selectBoard(int boardNo);



	
	
	

}
