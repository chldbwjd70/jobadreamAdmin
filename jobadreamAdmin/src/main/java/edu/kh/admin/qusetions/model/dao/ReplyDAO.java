package edu.kh.admin.qusetions.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.admin.qusetions.model.vo.Reply;

@Repository
public class ReplyDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	// 댓글목록조회
	public List<Reply> selectList(int qusetionsNo) {

		return sqlSession.selectList("replyMapper.selectList", qusetionsNo);
	}

	// 댓글 삽입
	public int insertReply(Reply reply) {
		int result = sqlSession.insert("replyMapper.insertReply", reply);
		sqlSession.update("replyMapper.replyQusetion", reply.getQusetionsNo());
		return result;
	}

	// 댓글 수정
	public int updateReply(Reply reply) {

		return sqlSession.update("replyMapper.updateReply", reply);
	}

	   public int deletReply(int qusetionsCommentNo) {
		   
		      return sqlSession.update("replyMapper.deleteReply",qusetionsCommentNo);
 }

}
