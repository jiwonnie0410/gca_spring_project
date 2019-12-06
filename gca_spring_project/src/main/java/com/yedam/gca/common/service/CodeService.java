package com.yedam.gca.common.service;

import java.util.List;

import com.yedam.gca.common.vo.CodeVO;

public interface CodeService {

	//그룹별 코드 목록 조회
	List<CodeVO> getCodeList(CodeVO vo);
	
}
