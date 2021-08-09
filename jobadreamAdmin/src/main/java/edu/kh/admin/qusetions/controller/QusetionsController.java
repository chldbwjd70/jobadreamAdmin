package edu.kh.admin.qusetions.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.kh.admin.qusetions.model.service.QusetionsService;
import edu.kh.admin.qusetions.model.vo.Pagination;
import edu.kh.admin.qusetions.model.vo.Qusetions;

@Controller
@SessionAttributes({"loginMember"})
public class QusetionsController {
	@Autowired
	private QusetionsService service;
	
	
	
	// 1:1문의 목록조회
	@RequestMapping(value = "/qusetions/qusetionsList", method=RequestMethod.GET)
	public String QusetionsList(Model model, Pagination pg,
			@RequestParam(value="cp", required =false, defaultValue = "1") int cp) {
		
		pg.setCurrentPage(cp);
		Pagination pagination = service.getPagination(pg);
		
		// pagination 현재 목록페이지 조회
		List<Qusetions> qusetionsList = service.selectQusetionsList(pagination);
		
		model.addAttribute("qusetionsList", qusetionsList);
		model.addAttribute("pagination", pagination);
	
		
		return "qusetions/qusetionsList";
	}
	
	//  1:1문의  상세조회
		@RequestMapping("qusetions/qusetionView/{qusetionsNo}")
		public String QusetionsView(Model model,RedirectAttributes ra,
				@PathVariable("qusetionsNo") int qusetionsNo) {
				
			Qusetions qusetions = service.selectQusetions(qusetionsNo);
			model.addAttribute("qusetions", qusetions);
				
			return "qusetions/qusetionsView";
			}
	

	
	
}
