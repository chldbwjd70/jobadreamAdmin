package edu.kh.admin.member.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import edu.kh.admin.member.model.dao.MemberDAO;
import edu.kh.admin.member.model.service.MemberService;
import edu.kh.admin.member.model.vo.Member;
import edu.kh.admin.member.model.vo.Pagination;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired // 등록된 bean 중에서 같은 타입의 bean 자동으로 연결해줌
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@Autowired
	private MemberDAO dao;
	
	@Override
	public Member login(Member inputMember) {
		
		String encPw = bCryptPasswordEncoder.encode(inputMember.getMemberPw());
		
		Member loginMember = dao.login(inputMember.getMemberId());
		
		System.out.println("sdfadf"+loginMember);
		System.out.println("adsfqewagqd" + inputMember);
		
		if(loginMember !=null) {
			
			// 2) 중요, 입력받은 id와 DB 저장 암호화 비밀번호를 비교하며 비교하여 일치하는 경우
			if(!bCryptPasswordEncoder.matches(inputMember.getMemberPw(),loginMember.getMemberPw())) {
							//      matches비교해줌 . 입력 받은 비밀번호 ,     db 저장된 암호화 비밀번호
	
				loginMember=null;
				//조회 해온 회원 정보를 없앰
			
			}else {
				//3) 비밀번호가 일치하면
				loginMember.setMemberPw(null);//비밀번호만 없앰
			}
		}
		return loginMember;
	}

	//페이징 
	@Override
	public Pagination getPagination(Pagination pg) {
		
		Pagination selectPg = dao.getListCount();
		
		System.out.println("selectPg :" + selectPg);
		
		return new Pagination(pg.getCurrentPage(), selectPg.getListCount());
	}

	// 회원 조회 
	@Override
	public List<Member> memberList(Pagination pagination) {
		return dao.memberList(pagination);
	}
	
	//
	//페이징처리(상태필터)
	   @Override
	   public Pagination getPagination(String st, Pagination pg) {
	      Pagination selectPg = dao.getSearchListCount(st);
	      return new Pagination(pg.getCurrentPage(),
	            selectPg.getListCount() );
	      
	   }
	// memberList불러오기
	   @Override
	   public List<Member> selectMemberList(String st, Pagination pagination) {
	      
	      return dao.selectSearchList(st,pagination);
	   }
	 // 상태변경하기
	@Override
	public int updateStatus(int no, String st) {
		
		Member member = new Member();
		member.setMemberStatus(st);
		member.setMemberNo(no);
		return dao.updateStatus(member);
	}

	
	
	
	
	
	
	
	
	
}
