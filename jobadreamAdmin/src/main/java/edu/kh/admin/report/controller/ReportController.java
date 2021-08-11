package edu.kh.admin.report.controller;

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

import edu.kh.admin.report.model.vo.Pagination;
import edu.kh.admin.report.model.vo.Report;
import edu.kh.admin.report.model.service.ReportService;

@Controller
@SessionAttributes({"loginMember"})
public class ReportController {

	@Autowired
	private ReportService service;
	
	//게시판 목록 조회
	@RequestMapping(value="/report/reportList", method=RequestMethod.GET)
	public String reportList(@RequestParam(value="cp",required=false,defaultValue= "1")int cp,
			@RequestParam(value="st",required=false,defaultValue= "")String st ,
			Model model, Pagination pg) {
		
		pg.setCurrentPage(cp); 
		Pagination pagination = null;
		List<Report> reportList = null;
		
		
		if(st.isEmpty()){
			
			pagination = service.getPagination(pg);
			
			reportList = service.reportList(pagination);
			
		} else {
			
			pagination = service.getPagination(st,pg);
			
			reportList = service.selectReportList(st,pagination);
		}
		
			model.addAttribute("reportList",reportList);
			model.addAttribute("pagination",pagination);
			model.addAttribute("status", st);
					
	
		return "report/reportList";	
	}
	
	//신고 상세 조회
	@RequestMapping("report/reportView/{reportNo}")
	public String reportView(@PathVariable("reportNo") int reportNo,
			Model model,RedirectAttributes ra) {
		
		
		Report report = service.selectReport(reportNo);
		model.addAttribute("report",report);
		
		return "report/reportView";	
	}
	
		//신고확인
	
	   @ResponseBody
	   @RequestMapping(value="report/checkReport", method=RequestMethod.POST)
	   public int checkReport(
	         @RequestParam(value="no",required=false)int no) {
	      int result = service.checkReport(no);
	      return result;
	   }
	
	
	
	
	
	
}
