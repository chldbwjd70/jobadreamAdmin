package edu.kh.admin.member.model.service;

import java.util.List;

import edu.kh.admin.member.model.vo.Member;
import edu.kh.admin.member.model.vo.Pagination;

public interface MemberService {

	
	/**로그인
	 * @param inputMember
	 * @return
	 */
	Member login(Member inputMember);

	
	/** 페이징 처리
	 * @param pg
	 * @return
	 */
	Pagination getPagination(Pagination pg);

	
	/** 회원 조회
	 * @param pagination
	 * @return
	 */
	List<Member> memberList(Pagination pagination);


	
	//페이징처리(상태필터)
	Pagination getPagination(String st, Pagination pg);
	
	// memberList불러오기
	List<Member> selectMemberList(String st, Pagination pagination);

	// 상태변경하기
	int updateStatus(int no, String st);
	
	
	
	

}
