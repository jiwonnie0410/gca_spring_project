package com.yedam.gca.admin.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yedam.gca.admin.vo.AlertVO;
import com.yedam.gca.chatting.vo.SocketVO;
import com.yedam.gca.group_b.vo.BGroupVO;
import com.yedam.gca.group_s.vo.SGroupVO;
import com.yedam.gca.group_six.vo.SixmanVO;

@Repository("alertDAO")
public class AlertDAO {

	@Autowired
	SqlSessionTemplate mybatis;
	
	//읽지 않은 알림 건수 조회
	public int getAlertCnt(AlertVO vo) {
		return mybatis.selectOne("AlertDAO.getAlertCnt", vo);
	}
	
	//알림의 특정 그룹에 속한 아이디 조회
	public List<AlertVO> getAlertGroupId(SocketVO vo){
		return mybatis.selectOne("AlertDAO.getAlertGroupId", vo);
	}
	
	//모든 나의 알람 메시지 확인하기
	public List<AlertVO> getAlertList(AlertVO vo){
		return mybatis.selectList("AlertDAO.getAlertList", vo);
	}
	
	//시용자의 읽지 않은 알람 메시지 확인하기
	public List<AlertVO> getAlertNotRead(AlertVO vo){
		return mybatis.selectList("AlertDAO.getAlertNotRead", vo);
	}
	
	//사용자의 읽은 알람 메시지 확인하기T
	public List<AlertVO> getAlertRead(AlertVO vo){
		return mybatis.selectList("AlertDAO.getAlertRead", vo);
	}
	
	//메시지 확인 후 수신 여부 업데이트
 		//안 읽은 메시지를 한꺼번에 확인하기 때문에 안 읽은 메시지 전부를 읽은 메시지로 변경함
	public List<AlertVO> updateAlertRea(AlertVO vo){
		return mybatis.selectList("AlertDAO.updateAlertRead", vo);
	}
}
