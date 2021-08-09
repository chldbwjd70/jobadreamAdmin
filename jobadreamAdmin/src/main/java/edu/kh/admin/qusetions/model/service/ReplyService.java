package edu.kh.admin.qusetions.model.service;

import java.util.List;

import edu.kh.admin.qusetions.model.vo.Reply;

public interface ReplyService {

	
	//댓글목록조회
	List<Reply> selectList(int qusetionsNo);

	
	
	//댓글삽입
	int insertReply(Reply reply);


	//댓글수정
	int updateReply(Reply reply);


	//댓글삭제
	int deleteReply(int replyNo);
	
	
	
	
	

}
