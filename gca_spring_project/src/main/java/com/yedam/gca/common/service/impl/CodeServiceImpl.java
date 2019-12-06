package com.yedam.gca.common.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.gca.common.dao.CodeDAO;
import com.yedam.gca.common.service.CodeService;
import com.yedam.gca.common.vo.CodeVO;

@Service("codeService")
public class CodeServiceImpl implements CodeService {

	@Autowired
	CodeDAO codeDao;
	
	//그룹별 코드 목록 조회
	@Override
	public List<CodeVO> getCodeList(CodeVO vo) {
		return codeDao.getCodeList(vo);
	}

}
