package edu.kh.admin.qusetions.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import edu.kh.admin.qusetions.model.service.ReplyService;
import edu.kh.admin.qusetions.model.vo.Reply;



@RestController





@RequestMapping("/reply/*")
@SessionAttributes({"loginMember"}) 
public class ReplyController {

	@Autowired
	private ReplyService service;
	
	
	// 댓글 목록 조회
		@RequestMapping(value="list",method=RequestMethod.POST)
		//@ResponseBody
		public String selectList(int qusetionsNo) {
			
			List<Reply> rList = service.selectList(qusetionsNo);
			
			// controller의 반환값은 forward 또는 redirect를 위한 경로를 작성함
			// 값 자체를 전달하기 위한 어노테이션 @ResponseBody를 사용해야
			// ajax 반환값으로 전달 가능
			
			//rList 를 JSON 형태로 변환
			//-> GSON 라이브러리를 이용해서 쉽게 변환 /타입아님/
			Gson gson = new GsonBuilder().setDateFormat("yyyy년 MM월 dd일 HH:mm").create();
			//gson을 이용한 JSON 변환시 날짜 데이터 형식을 지정함
			
			return gson.toJson(rList);
			// rList 를JSON 형태로 변환하여 반환 (String)
		}
		
		
		//댓글 삽입
		
		@RequestMapping(value="insertReply",method=RequestMethod.POST)
		//@ResponseBody   //값자체만 돌려보내는
		public int insertReply(Reply reply/*커멘드객체*/) {
			
			return service.insertReply(reply);
		}
		
		
		// 댓글 수정
		//@ResponseBody
		
		@RequestMapping(value="updateReply",method=RequestMethod.POST)
		public int updateReply(Reply reply) {
			return  service.updateReply(reply);
		}
		
		
		
		// 댓글 삭제
		//@ResponseBody
		@RequestMapping(value="deleteReply",method=RequestMethod.GET)
		public int deleteReply(int qusetionsCommentNo) {
			return service.deleteReply(qusetionsCommentNo);
		}	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
}
