package edu.kh.admin.board.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import edu.kh.admin.board.model.vo.Board;
import edu.kh.admin.board.model.vo.Pagination;

public class BoardDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	//게시물 수 조회
	public Pagination getListCount() {
		return sqlSession.selectOne("boardMapper.getListCount");
	}
	//게시물 목록조회
	public List<Board> boardList(Pagination pagination) {
		// RowBounds사용
		int offset = (pagination.getCurrentPage() - 1)*pagination.getLimit();
		RowBounds rowBouns = new RowBounds(offset, pagination.getLimit());
		return sqlSession.selectList("boardMapper.boardList", pagination, rowBouns);
	}
	//페이징처리(상태필터)
	public Pagination getSearchListCount(String st) {
		return sqlSession.selectOne("boardMapper.getSearchListCount",st);
	}
	
	// boardList불러오기
	public List<Board> selectSearchList(String st, Pagination pagination) {
		int offset = (pagination.getCurrentPage() -1)* pagination.getLimit();   
	    RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
	    return sqlSession.selectList("boardMapper.selectSearchList", st, rowBounds);
	}
	


	
}
