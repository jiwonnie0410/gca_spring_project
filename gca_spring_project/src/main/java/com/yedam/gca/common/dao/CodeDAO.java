package com.yedam.gca.common.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yedam.gca.common.vo.CodeVO;

@Repository("codeDAO")
public class CodeDAO {

	@Autowired
	SqlSessionTemplate mybatis;
	
	//그룹별 코드 목록 조회
	public List<CodeVO> getCodeList(CodeVO vo){
		return mybatis.selectList("CommonDAO.getCodeList", vo);
	}
	
}
