package edu.kh.admin.qusetions.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.admin.qusetions.model.vo.Pagination;
import edu.kh.admin.qusetions.model.vo.Qusetions;
@Repository
public class QusetionsDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	
	//1:1문의 게시글수 조회
	public Pagination getListCount() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("qusetionsMapper.getListCount");
	}

	//1:1문의 목록조회
	public List<Qusetions> selectQusetionList(Pagination pagination) {
	
		int offset = (pagination.getCurrentPage() - 1)*pagination.getLimit();
		RowBounds rowBouns = new RowBounds(offset, pagination.getLimit());
		return sqlSession.selectList("qusetionsMapper.selectQusetionList", pagination, rowBouns);
	}

	public Qusetions selectQusetions(int qusetionsNo) {

		return sqlSession.selectOne("qusetionsMapper.selectQusetions", qusetionsNo);
	}
	
	
	
	
	
	
}
