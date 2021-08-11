package edu.kh.admin.qusetions.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.kh.admin.qusetions.model.vo.Reply;
import edu.kh.admin.qusetions.model.dao.ReplyDAO;



@Service
public class ReplyServiceImpl implements ReplyService{

	@Autowired
	private ReplyDAO dao;
	
	//댓글 목록조회
	@Override
	public List<Reply> selectList(int qusetionsNo) {
		// TODO Auto-generated method stub
		return dao.selectList(qusetionsNo);
	}

	//삽입
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int insertReply(Reply reply) {
		//크로스사이트 스크립트 방지 처리
				reply.setQusetionsCommentContent(replaceParameter(reply.getQusetionsCommentContent()));
				//개행문자 처리
				reply.setQusetionsCommentContent( reply.getQusetionsCommentContent().replaceAll("(\r\n|\r|\n|\n\r)", "<br>"));
				
				return dao.insertReply(reply);
	}

	//수정
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int updateReply(Reply reply) {
		
		//크로스사이트 스크립트 방지 처리
		reply.setQusetionsCommentContent( replaceParameter(reply.getQusetionsCommentContent()));
		//개행문자 처리
		reply.setQusetionsCommentContent( reply.getQusetionsCommentContent().replaceAll("(\r\n|\r|\n|\n\r)", "<br>"));

		return dao.updateReply(reply);
	}

	//삭제
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int deleteReply(int qusetionsCommentNo) {
		
		return dao.deletReply(qusetionsCommentNo);
	}
	
	
	
	 //크로스사이트 스크립트 방지 처리
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
