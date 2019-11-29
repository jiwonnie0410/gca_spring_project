package com.yedam.gca.challenge.service;

import java.util.List;

import com.yedam.gca.challenge.vo.ChallengeVO;

public interface ChallengeService {

	//챌린지 전체조회  (사용자별 챌린지 참가여부확인)
	List<ChallengeVO> getChallengeList();

}