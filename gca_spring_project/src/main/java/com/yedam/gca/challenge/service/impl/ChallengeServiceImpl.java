package com.yedam.gca.challenge.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.gca.challenge.dao.ChallengeDAO;
import com.yedam.gca.challenge.service.ChallengeService;
import com.yedam.gca.challenge.vo.ChallengeVO;

@Service
public class ChallengeServiceImpl implements ChallengeService{

	@Autowired ChallengeDAO dao;
	
	@Override
	public List<ChallengeVO> getChallengeList() {
		return dao.getChallengeList();
	}

}
