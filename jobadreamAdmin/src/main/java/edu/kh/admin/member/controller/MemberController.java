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
	@RequestMapping(value="memberList",method=RequestMethod.POST)
	public String login(Member inputMember,Model model,
						HttpServletRequest request,HttpServletResponse response,
						RedirectAttributes ra ) {
		
		Member loginMember = service.login(inputMember);
		
		System.out.println(loginMember);
		System.out.println(inputMember);
		
		String path = null;
		
		if(loginMember != null ) { 
			
			if(loginMember.getMemberGrade().equals("A")) {
				
				model.addAttribute("loginMember", loginMember); 
				
				path = "member/memberList";
				
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
	
	
	
	@RequestMapping(value="memberList", method=RequestMethod.GET)
	public String memberList(
			@RequestParam(value="cp",required=false,defaultValue= "1")int cp,
			@RequestParam(value="st",required=false,defaultValue= "")String st,
			Model model, Pagination pg) {
		
		pg.setCurrentPage(cp); 
		
		Pagination pagination = null;
		List<Member> memberList = null;
		
		System.out.println("Hello");
		if(st.isEmpty()) {
			pagination = service.getPagination(pg);
			memberList = service.selectMemberList(pagination);
			System.out.println(memberList);
			
		} else {
			
			pagination = service.getPagination(st,pg); 
			
			memberList = service.selectMemberList(st,pagination);
			System.out.println(memberList);
		}
		
		model.addAttribute("memberList",memberList);
		model.addAttribute("pagination",pagination);
		
		return "member/memberList";
	}
	
	
	
	
	
	
	
}
