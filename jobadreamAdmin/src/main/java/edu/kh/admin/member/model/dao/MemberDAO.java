package edu.kh.admin.member.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.admin.member.model.vo.Member;
import edu.kh.admin.member.model.vo.Pagination;

@Repository
public class MemberDAO {

	
	@Autowired
	private SqlSessionTemplate sqlSession;

	
	
	/** 로그인DAO
	 * @param memberId
	 * @return loginMember
	 */
	public Member login(String memberId) {
	
		return sqlSession.selectOne("memberMapper.login",memberId);
	}



	public Pagination getListCount() {
		return sqlSession.selectOne("memberMapper.getListCount");
	}



	/** 조회리스트
	 * @param st
	 * @return
	 */
	public Pagination getSearchListCount(String st) {
		return sqlSession.selectOne("memberMapper.getSearchListCount",st);
	}



	/** 리스트 불러오기
	 * @param pagination
	 * @return
	 */
	public List<Member> selectMemberList(Pagination pagination) {
		int offset = (pagination.getCurrentPage() -1)* pagination.getLimit();	
		
		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
		return sqlSession.selectList("memberMapper.selectMemberList",rowBounds);
	}



	public List<Member> selectSearchList(String st, Pagination pagination) {
		int offset = (pagination.getCurrentPage() -1)* pagination.getLimit();	
		
		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
		
		return sqlSession.selectList("memberMapper.selectSearchList", st, rowBounds);
	}
	
	
	
	
	
	
	
}
