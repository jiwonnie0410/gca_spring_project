package com.yedam.gca.history.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.gca.admin.vo.MoneyVO;
import com.yedam.gca.challenge.vo.ChallengeVO;
import com.yedam.gca.common.Paging;
import com.yedam.gca.history.dao.ChallengeHistDAO;
import com.yedam.gca.history.service.ChallengeHistService;
import com.yedam.gca.history.vo.ChallengeHistVO;

@Service
public class ChallengeHistServiceImpl implements ChallengeHistService {

	@Autowired ChallengeHistDAO dao;
			
	//은영
	@Override
	public List<ChallengeVO> getMyChallenge(ChallengeHistVO vo){
		return dao.getMyChallenge(vo);
	}

	@Override
	public List<MoneyVO> getPaidMoney(MoneyVO vo) {
		return dao.getPaidMoney(vo);
	}



	
}
