package edu.kh.admin.member.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.kh.admin.member.model.service.MemberService;
import edu.kh.admin.member.model.vo.Member;
import edu.kh.admin.member.model.vo.Pagination;

@Controller
@RequestMapping("/member/*")
@SessionAttributes({"loginMember"})
public class MemberController {

	@Autowired
	private MemberService service;

	// 로그인
	@RequestMapping(value="login",method=RequestMethod.POST)
	public String login(Member inputMember,Model model,
						HttpServletRequest request,HttpServletResponse response,
						RedirectAttributes ra ) {
		
		Member loginMember = service.login(inputMember);
		
		String path = null;
		
		if(loginMember != null ) { 
			
			if(loginMember.getMemberGrade().equals("A")) {
				
				model.addAttribute("loginMember", loginMember); 
				
				path = "redirect:/member/memberList";
				
			}else {
				ra.addFlashAttribute("icon", "error");
				ra.addFlashAttribute("title", "로그인 실패");
				ra.addFlashAttribute("text", "관리자만 사용 가능합니다.");
				
				path = "redirect:/";
			}
		}else { 
			ra.addFlashAttribute("icon", "error");
			ra.addFlashAttribute("title", "로그인 실패");
			ra.addFlashAttribute("text", "아이디 또는 비밀번호가 일치하지 않습니다.");
			
			path = "redirect:/";
		}
		
		return path;
	}
	// 로그인 끝 

	// 로그아웃
	@RequestMapping(value="logout", method=RequestMethod.GET)
	public String logout(SessionStatus status,
					@RequestHeader("referer") String referer,
					RedirectAttributes ra) {
		
		status.setComplete();
		
		ra.addFlashAttribute("title", "로그아웃");
		ra.addFlashAttribute("text", "로그아웃 되셨습니다.");
		
		return "redirect:/";
	}
	
	
	// memberList불러오기
	@RequestMapping(value="memberList", method=RequestMethod.GET)
	public String memberList(
			@RequestParam(value="cp",required=false,defaultValue= "1")int cp,
			@RequestParam(value="st",required=false,defaultValue= "")String st ,
			Model model, Pagination pg) {
		
		pg.setCurrentPage(cp); 
		Pagination pagination = null;
		List<Member> memberList = null;
		
		if(st.isEmpty()){
			
			pagination = service.getPagination(pg);
			
			memberList = service.memberList(pagination);
			
		} else {
			
			pagination = service.getPagination(st,pg);
			
			memberList = service.selectMemberList(st,pagination);
		}

		
		System.out.println("과연 될것인가 : " + memberList );
		
		model.addAttribute("memberList",memberList);
		model.addAttribute("pagination",pagination);
		model.addAttribute("status", st);
		
		
		return "member/memberList";
	}
	
	// 상태변경하기
	@ResponseBody
	@RequestMapping(value="updateStatus", method=RequestMethod.POST)
	public int updateStatus(
			@RequestParam(value="no",required=false)int no,
			@RequestParam(value="st",required=false,defaultValue= "")String st) {
		int result = service.updateStatus(no, st);
		return result;
	}
	
	
	
	
	
}
