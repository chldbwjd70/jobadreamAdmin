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


	/** 회원 수 조회(페이징네이션)
	 * @return
	 */
	public Pagination getListCount() {
		return sqlSession.selectOne("memberMapper.getListCount");
	}
	
	
	/** 회원 목록 조회
	 * @param pagination
	 * @return
	 */
	public List<Member> memberList(Pagination pagination) {
		// RowBounds사용
		int offset = (pagination.getCurrentPage() - 1)*pagination.getLimit();
		RowBounds rowBouns = new RowBounds(offset, pagination.getLimit());
		return sqlSession.selectList("memberMapper.memberList", pagination, rowBouns);

	}
	
	//페이징처리(상태필터)
	public Pagination getSearchListCount(String st) {
		   
	      return sqlSession.selectOne("memberMapper.getSearchListCount",st);
	   }
	   
	// memberList불러오기
	   public List<Member> selectSearchList(String st, Pagination pagination) {
	      int offset = (pagination.getCurrentPage() -1)* pagination.getLimit();   
	      RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
	      return sqlSession.selectList("memberMapper.selectSearchList", st, rowBounds);
	   }

	   // 상태변경하기
	   public int updateStatus(Member member){
		  return sqlSession.update("memberMapper.updateStatus", member);
		}


	
	
	
	
	
}
