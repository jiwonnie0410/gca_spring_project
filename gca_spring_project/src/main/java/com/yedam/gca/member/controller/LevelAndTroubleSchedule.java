package com.yedam.gca.member.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
//이 스케줄러는 ADMIN에 있는 수림언니 스케줄러나 MEMBER컨트롤러로 합칠것임(근데 컨트롤러는 @Controller어노테이션인데 합칠수가 있나?)

import com.yedam.gca.admin.vo.TroubleVO;
import com.yedam.gca.group_s.service.SGroupService;
import com.yedam.gca.history.vo.ScoreHistVO;
import com.yedam.gca.member.vo.MembersVO;
@Component
public class LevelAndTroubleSchedule {
	
	@Autowired
	SGroupService sgroupService; //지금은 점수합계 조회와 레벨 업데이트 메서드가 sGroupDAO에 있지만 MEMBERSdao로 옮길것임
	
	@Scheduled(cron = "0 0 1 * * * ") //매일 새벽 1시에 레벨 업데이트
	public void levelUpdate() {
		ScoreHistVO scvo = new ScoreHistVO();
		MembersVO mvo = new MembersVO();
		
		String id = "";
		int score = 0;
		
		List<ScoreHistVO> scoreList = sgroupService.getAllTotalScore(scvo);
		System.out.println(scoreList.get(1).getM_id());
		System.out.println("scoreList의 size : "+scoreList.size());
		for(int i=0; i<scoreList.size(); i++){
			 id = scoreList.get(i).getM_id();
			 score = scoreList.get(i).getSch_score();
			 
			 mvo.setM_id(id);
			 
			 if(score>=0 && score <30) {
				 mvo.setM_level_cd("L01");
			 }else if((score>=30 && score <200)){
				 mvo.setM_level_cd("L02");
			 }else if((score>=200 && score <500)){
				 mvo.setM_level_cd("L03");
			 }else if((score>=500 && score <3000)){
				 mvo.setM_level_cd("L04");
			 }else if((score>=3000 && score <10000)){
				 mvo.setM_level_cd("L05");
			 }else if((score>=10000 && score <50000)){
				 mvo.setM_level_cd("L06");
			 }else {
				 mvo.setM_level_cd("L07");
			 }
			 
			sgroupService.updateLevel(mvo);
		}
	}
	
	@Scheduled(cron = "0 0/30 * * * * ") //매 30분마다 회원 활동상태 업데이트
	public void mStatusUpdate() {
		TroubleVO tvo = new TroubleVO();
		MembersVO mvo = new MembersVO();
		
		String id = "";
		int howManyTrouble = 0;
		
		List<TroubleVO> troubleList = sgroupService.getHowManyTrouble(tvo);
		System.out.println(troubleList.get(1).getM_id());
		System.out.println("troubleList의 size : "+troubleList.size());
		for(int i=0; i<troubleList.size(); i++){
			 id = troubleList.get(i).getTr_mid();
			 howManyTrouble = troubleList.get(i).getTr_how_many();
			 
			 mvo.setM_id(id);
			 
			 if(howManyTrouble>=3 && howManyTrouble <7) { //신고횟수 3~6
				 mvo.setM_status_cd("M02");
			 }else { //신고횟수 7이상
				 mvo.setM_status_cd("M03");
			 }
			 
			sgroupService.updateMStatus(mvo);
		}
	}
	

}
