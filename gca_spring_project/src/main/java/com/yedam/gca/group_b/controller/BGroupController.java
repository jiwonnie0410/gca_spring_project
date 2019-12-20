package com.yedam.gca.group_b.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.gca.admin.vo.TroubleVO;
import com.yedam.gca.common.code.service.CodeService;
import com.yedam.gca.common.code.vo.CodeVO;
import com.yedam.gca.group_b.service.BGroupService;
import com.yedam.gca.group_b.vo.BGroupVO;
import com.yedam.gca.history.service.ActiveHistService;
import com.yedam.gca.history.vo.ActiveHistVO;
import com.yedam.gca.history.vo.ScoreHistVO;
import com.yedam.gca.member.vo.MembersVO;

@Controller
public class BGroupController {
	
	@Autowired	BGroupService bgroupService;
	@Autowired	CodeService codeService;
	@Autowired	ActiveHistService actService;
	
	
//*****************************************은영************************************

	//신고하기 insert
	@ResponseBody
	@RequestMapping(value="/bgroup/doReport", consumes="application/json")
	public int doReport(@RequestBody TroubleVO vo) {
//		model.addAttribute("report", service.getRoomInfo(vo));
		return bgroupService.doReport(vo);
//		System.out.println(model);
	}
	
//프로필 모달 띄울 때 해당 멤버 정보 가져오기
	@ResponseBody //얘가 있어야 페이지 리턴을 안한다.(이거 없으면 밑에 mapping된 jsp페이지로 자동으로 찾아감.)
	@RequestMapping(value="/bgroup/getOneProfile", consumes="application/json")
	public MembersVO getOneProfile(@RequestBody MembersVO vo) {
		vo = bgroupService.getOneMem(vo);
		return vo;
	}
	
//참가취소 시 활동이력에서 빠지고 카운트 -1
	@RequestMapping("/bgroup/cancelJoin")
	public String cancelJoin(@RequestParam(value="m_id") String id,
			@RequestParam(value="bg_num") int bg_num, ActiveHistVO vo) {
		vo.setM_id(id);
		vo.setBg_num(bg_num);
		bgroupService.cancelJoin(vo);
		//sgroupService.minusNowCnt(sgNum);
		return "redirect:getBgList";
	}
	
//강퇴 시 활동이력에서 빠지고 count-1
	@ResponseBody
	@RequestMapping(value="/bgroup/kickOut", consumes="application/json")
		public int kickOut(@RequestBody ActiveHistVO avo) {
			avo.setM_id(avo.getM_id());
			avo.setBg_num(avo.getBg_num());
			bgroupService.cancelJoin(avo);
			//sgroupService.minusNowCnt(sgNum);
			return 0;
		}
	
//프로필 모달 띄울 때 해당 멤버 정보 가져오기
	@ResponseBody //얘가 있어야 페이지 리턴을 안한다.(이거 없으면 밑에 mapping된 jsp페이지로 자동으로 찾아감.)
	@RequestMapping(value="/bgroup/getOnesAuthority", consumes="application/json")
	public ActiveHistVO getOnesAuthority(@RequestBody ActiveHistVO vo) {
		vo = bgroupService.getOnesAuthority(vo);
		return vo;
	}
	
//프로필 모달 띄울 때 해당 멤버의 레벨 가져오기(점수 조회 후 레벨변동해야하면 업데이트해서 가져오기)
		@ResponseBody
		@RequestMapping(value="/bgroup/getOnesLevel", consumes="application/json")
		public MembersVO getOnesLevel(@RequestBody MembersVO vo) {
		//1)점수 합계 가져오기
			ScoreHistVO svo = bgroupService.getMyTotalScore(vo);
			int score = 0;
			if(svo.getSch_score() != 0) {
				score = svo.getSch_score();
			}
		//2)if 점수가 몇점 이상이면 레벨 업데이트 -> 이거 불러오기만하고 자정마다 업데이트 하는게 좋을듯.....
			if(isBetween(score, 0, 29)) { //isBetween함수는 바로 밑에..
				vo.setM_level_cd("LEVEL1");
				}else if(isBetween(score, 30, 199)) {
					vo.setM_level_cd("LEVEL2");
				}else if(isBetween(score, 200, 499)) {
					vo.setM_level_cd("LEVEL3");
				}else if(isBetween(score, 500, 2999)) {
					vo.setM_level_cd("LEVEL4");
				}else if(isBetween(score, 3000, 9999)) {
					vo.setM_level_cd("LEVEL5");
				}else if(isBetween(score, 10000, 49999)) {
					vo.setM_level_cd("LEVEL6");
				}else {
					vo.setM_level_cd("LEVEL7");
				}
					
				return vo;
			}
		
		//between a and b
		public static boolean isBetween(int x, int lower, int upper) {
			return lower <= x && x <= upper;
		}


//*****************************************미현************************************
	
	
	//전체 동호회매치 리스트 조회
	@RequestMapping(value="/bgroup/getBgList")
	public String search(Model model, BGroupVO vo, CodeVO cvo) {
		MembersVO memInfo = (MembersVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();//세션 정보 갖고 오기
		vo.setM_xy(memInfo.getM_xy());
		
		vo.setScroll_rec(15); //조회할 레코드 수(직접 입력)
		model.addAttribute("bgroup", vo);
		model.addAttribute("list", bgroupService.getBgList(vo));
		
		//sports2와 관련된 code정보 모두 보내기
		cvo.setCd_group("SPORTS2_CD");
		model.addAttribute("sports_list", codeService.getCodeList(cvo));
		
		if(vo.getEnd_dis() == null) {
			return "/user/group_b/b_search";			
		} else {
			return "/notiles/group_b/b_search_temp";
		}
	}
	
	//마감 동호회매치 리스트 조회
	@RequestMapping(value="/bgroup/getBgListEnd")
	public String searchEnd(BGroupVO vo, CodeVO cvo, Model model) {
		MembersVO memInfo = (MembersVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();//세션 정보 갖고 오기
		vo.setM_xy(memInfo.getM_xy());
		
		vo.setScroll_rec(3); //조회할 레코드 수(직접 입력)
		model.addAttribute("bgroup", vo);
		model.addAttribute("list", bgroupService.getBgEndList(vo));
		
		//sports2와 관련된 code정보 모두 보내기
		cvo.setCd_group("SPORTS2_CD");
		model.addAttribute("sports_list", codeService.getCodeList(cvo));
		
		if(vo.getEnd_dis() == null) {
			return "/user/group_b/b_end_room";
		} else {
			return "/notiles/group_b/b_end_temp";
		}
	}
	
	//동호회매치 방 참여 전에  참여 여부 확인 + 마감 인원 파악
	@ResponseBody
	@RequestMapping(value="/bgroup/bgValidIn/{bg_num}", method = RequestMethod.GET)
	public ActiveHistVO bgValidIn(@PathVariable int bg_num, ActiveHistVO vo, CodeVO cvo) {
		MembersVO memInfo = (MembersVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal(); //세션 정보 갖고 오기
		vo.setM_id(memInfo.getM_id());
		
		vo.setIn_type("bg"); //sg:반짝방, bg:매치방, six:용병방(직접 입력)
		vo.setPk_num(bg_num);
		actService.validIn(vo);
		return vo;
	}
	
	//선택한 방에 참여1) - 이미 참여되어 있는 방에 참여
	@RequestMapping("/bgroup/alreadyIn")
	public String alreadyIn(
			@RequestParam(value="bg_num", defaultValue="", required=true) int bg_num,
			Model model, BGroupVO vo, ActiveHistVO avo, CodeVO cvo) {
		vo.setBg_num(bg_num);
		model.addAttribute("bgroup", bgroupService.getRoomInfo(vo));
		
		//참여 인원 정보를 채팅방으로 넘김
		avo.setBg_num(bg_num);
		model.addAttribute("memlist", actService.getActMemList(avo));
		return "/user/group_b/b_wating_room";
	}
	
	//선택한 방에 참여2)- 참여되어 있지 않은 방에 참여
	@RequestMapping("/bgroup/roomIn")
	public String roomIn(
			@RequestParam(value="bg_num", defaultValue="", required=true) int bg_num,
			Model model, BGroupVO vo, ActiveHistVO avo, CodeVO cvo) {
		MembersVO memInfo = (MembersVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal(); //세션 정보 갖고 오기
		avo.setM_id(memInfo.getM_id());
		
		avo.setIn_type("bg"); //sg:반짝방, bg:매치방, six:용병방(직접 입력)
		avo.setPk_num(bg_num);
		actService.roomInsert(avo);
		
		return "redirect:alreadyIn?bg_num="+avo.getBg_num()
								+ "&first_in=first_in"; //새로 참여하는 경우임을 구분하기 위해 보내는 잉여값. 
									//alreadyIn에서 다른 처리작업을 할 필요 없이 값이 그대로 넘어감
	}

	
	//동호회매치 생성 폼으로 이동
	@RequestMapping("/bgroup/createRoomForm")
	public String createRoomForm(Model model, CodeVO vo) {
		vo.setCd_group("SPORTS2_CD");
		model.addAttribute("sports_list", codeService.getCodeList(vo));
		vo.setCd_group("SKILL_CD");
		model.addAttribute("skill_list", codeService.getCodeList(vo));
		vo.setCd_group("GENDER_CD");
		model.addAttribute("gender_list", codeService.getCodeList(vo));
		return "/user/group_b/b_room_cre";
	}
	
	//방 생성
	@RequestMapping(value="bgroup/creRoom", method=RequestMethod.POST)
	public String createRoom(BGroupVO vo) {
		MembersVO memInfo = (MembersVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal(); //세션 정보 갖고 오기
		vo.setM_id(memInfo.getM_id());
		
		bgroupService.insertBg(vo);
		return "redirect:alreadyIn?bg_num="+vo.getBg_num();
	}
	
	//전체 동호회매치+마감 동호회매치 리스트 조회(미사용중)
	@RequestMapping(value="/bgroup/getBgList/{whatroom}")
	public String search(@PathVariable String whatroom, Model model, BGroupVO vo, CodeVO cvo) {
		MembersVO memInfo = (MembersVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();//세션 정보 갖고 오기
		vo.setM_xy(memInfo.getM_xy());
		
		vo.setScroll_rec(3); //조회할 레코드 수(직접 입력)
		model.addAttribute("bgroup", vo);
		if(whatroom == "default") 	model.addAttribute("list", bgroupService.getBgList(vo));
		else if(whatroom == "end") 	model.addAttribute("list", bgroupService.getBgEndList(vo));
		
		//sports2와 관련된 code정보 모두 보내기
		cvo.setCd_group("SPORTS2_CD");
		model.addAttribute("sports_list", codeService.getCodeList(cvo));
		
		String viewsrc = null;
		if(whatroom == "default") {
			if(vo.getEnd_dis() == null) viewsrc = "/user/group_b/b_search";
			else viewsrc = "/notiles/group_b/b_search_temp";
		} else if(whatroom == "end") {
			if(vo.getEnd_dis() == null) viewsrc = "/user/group_b/b_end_room";
			else viewsrc = "/notiles/group_b/b_end_temp";
		}
		return viewsrc;
	}
	
}
