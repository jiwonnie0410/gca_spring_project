package com.yedam.gca.history.service;

import java.util.List;

import com.yedam.gca.admin.vo.MoneyVO;
import com.yedam.gca.challenge.vo.ChallengeVO;
import com.yedam.gca.history.vo.ChallengeHistVO;

public interface ChallengeHistService {

	//은영
	List<ChallengeVO> getMyChallenge(ChallengeHistVO vo);
	List<MoneyVO> getPaidMoney(MoneyVO vo);
}