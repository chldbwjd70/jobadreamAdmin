package edu.kh.admin.qusetions.model.service;

import java.util.List;

import edu.kh.admin.qusetions.model.vo.Pagination;
import edu.kh.admin.qusetions.model.vo.Qusetions;

public interface QusetionsService {

	
	//
	Pagination getPagination(Pagination pg);

	
	// 1:1문의 목록조회
	List<Qusetions> selectQusetionsList(Pagination pagination);

	// 1:1문의 상세조회
	Qusetions selectQusetions(int qusetionsNo);

}
