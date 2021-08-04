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

	Pagination getPagination(Pagination pg);
	Pagination getPagination(String st, Pagination pg);
	
	List<Member> selectMemberList(Pagination pagination);
	List<Member> selectMemberList(String st, Pagination pg);

}
