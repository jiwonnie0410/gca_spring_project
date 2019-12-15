package com.yedam.gca.history.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.gca.common.Paging;
import com.yedam.gca.history.dao.ChallengeHistDAO;
import com.yedam.gca.history.service.ChallengeHistService;
import com.yedam.gca.history.vo.ChallengeHistVO;

@Service
public class ChallengeHistServiceImpl implements ChallengeHistService {

	@Autowired ChallengeHistDAO dao;
	
	
	//진영
	// 챌린지 히스로리 목록 출력
		@Override
		public List<ChallengeHistVO> getChallengehtList(ChallengeHistVO vo){
			return dao.getChallengehtList(vo);
		}









	
}
