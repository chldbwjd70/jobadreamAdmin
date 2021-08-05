package edu.kh.admin.board.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import edu.kh.admin.board.model.service.BoardService;
import edu.kh.admin.board.model.vo.Board;
import edu.kh.admin.board.model.vo.Pagination;



@Controller
@RequestMapping("/board/*")
@SessionAttributes({"loginMember"})
public class BoardController {

	private BoardService service;
	
	//게시판목록 조회
	@RequestMapping()
	public String boardList(@RequestParam(value="cp",required=false,defaultValue= "1")int cp,
			@RequestParam(value="st",required=false,defaultValue= "")String st ,
			Model model, Pagination pg) {
		pg.setCurrentPage(cp); 
		Pagination pagination = null;
		List<Board> boardList = null;
		
		if(st.isEmpty()){
			
			pagination = service.getPagination(pg);
			
			boardList = service.boardList(pagination);
			
		} else {
			
			pagination = service.getPagination(st,pg);
			
			boardList = service.selectboardList(st,pagination);
		}

		
		model.addAttribute("boardList",boardList);
		model.addAttribute("pagination",pagination);
		model.addAttribute("status", st);
		
		
		return "board/boardList";
	}
	

	
	
	
	
	
}