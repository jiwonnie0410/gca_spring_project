package com.yedam.gca.group_s.controller;

import java.sql.Timestamp;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.yedam.gca.admin.vo.TroubleVO;
import com.yedam.gca.chatting.controller.SpringSocketHandler;
import com.yedam.gca.chatting.service.ChatService;
import com.yedam.gca.chatting.vo.ChatHistVO;
import com.yedam.gca.chatting.vo.SocketVO;
import com.yedam.gca.common.code.service.CodeService;
import com.yedam.gca.common.code.vo.CodeVO;
import com.yedam.gca.group_s.service.SGroupService;
import com.yedam.gca.group_s.vo.SGroupVO;
import com.yedam.gca.history.service.ActiveHistService;
import com.yedam.gca.history.vo.ActiveHistVO;
import com.yedam.gca.history.vo.ScoreHistVO;
import com.yedam.gca.member.vo.MembersVO;

@Controller
public class SGroupController {
	
	@Autowired	SGroupService sgroupService;
	@Autowired	CodeService codeService;
	@Autowired	ActiveHistService actService;
	@Autowired	ChatService chatService;
	
	
//*****************************************은영************************************
	
	//신고하기 insert
		@ResponseBody
		@RequestMapping(value="/sgroup/doReport", consumes="application/json")
		public int doReport(@RequestBody TroubleVO vo) {
//			model.addAttribute("report", service.getRoomInfo(vo));
			return sgroupService.doReport(vo);
//			System.out.println(model);
		}
		
	//프로필 모달 띄울 때 해당 멤버 정보 가져오기
		@ResponseBody //얘가 있어야 페이지 리턴을 안한다.(이거 없으면 밑에 mapping된 jsp페이지로 자동으로 찾아감.)
		@RequestMapping(value="/sgroup/getOneProfile", consumes="application/json")
		public MembersVO getOneProfile(@RequestBody MembersVO vo) {
			vo = sgroupService.getOneMem(vo);
			return vo;
		}
		
	//프로필 모달 띄울 때 해당 멤버가 방장인지 아닌지 권한 가져오기
		@ResponseBody
		@RequestMapping(value="/sgroup/getOnesAuthority", consumes="application/json")
		public ActiveHistVO getOnesAuthority(@RequestBody ActiveHistVO vo) {
			vo = sgroupService.getOnesAuthority(vo);
			return vo;
		}
		
	//프로필 모달 띄울 때 해당 멤버의 레벨 가져오기
		@ResponseBody
		@RequestMapping(value="/sgroup/getOnesLevel", consumes="application/json")
		public MembersVO getOnesLevel(@RequestBody MembersVO vo) {
		//1)점수 합계 가져오기
			ScoreHistVO svo = sgroupService.getMyTotalScore(vo);
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
		
		
	//참가취소 시 활동이력에서 빠지고 카운트 -1
		@RequestMapping("/sgroup/cancelJoin")
		public String cancelJoin(@RequestParam(value="m_id") String id,
				@RequestParam(value="sg_num") int sg_num, ActiveHistVO vo) {
			vo.setM_id(id);
			vo.setSg_num(sg_num);
			sgroupService.cancelJoin(vo);
			//sgroupService.minusNowCnt(sgNum);
			return "redirect:getSgList";
		}
		
	//강퇴 시 활동이력에서 빠지고 count-1
		@ResponseBody
		@RequestMapping(value="/sgroup/kickOut", consumes="application/json")
			public int kickOut(@RequestBody ActiveHistVO avo) {
				avo.setM_id(avo.getM_id());
				avo.setSg_num(avo.getSg_num());
				sgroupService.cancelJoin(avo);
				return 0;
			}
	
//*****************************************미현************************************
	
	//전체 반짝 리스트 조회
	@RequestMapping(value="/sgroup/getSgList")
	public String search(Model model, SGroupVO vo, CodeVO cvo) {
		MembersVO memInfo = (MembersVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();//세션 정보 갖고 오기
		vo.setM_xy(memInfo.getM_xy());
		
		vo.setScroll_rec(15); //조회할 레코드 수(직접 입력)
		model.addAttribute("sgroup", vo);
		model.addAttribute("list", sgroupService.getSgList(vo));
		
		//sports1과 관련된 code정보 모두 보내기
		cvo.setCd_group("SPORTS1_CD");
		model.addAttribute("sports_list", codeService.getCodeList(cvo));
		
		if(vo.getEnd_dis() == null) {
			return "/user/group_s/s_search";
		} else {
			return "/notiles/group_s/s_search_temp";
		}
	}
	
	//마감 반짝 리스트 조회
	@RequestMapping(value="/sgroup/getSgListEnd")
	public String searchEnd(SGroupVO vo, CodeVO cvo, Model model) {
		MembersVO memInfo = (MembersVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();//세션 정보 갖고 오기
		vo.setM_xy(memInfo.getM_xy());
		
		vo.setScroll_rec(15); //조회할 레코드 수(직접 입력)
		model.addAttribute("sgroup", vo);
		model.addAttribute("list", sgroupService.getSgEndList(vo));
		
		//sports1과 관련된 code정보 모두 보내기
		cvo.setCd_group("SPORTS1_CD");
		model.addAttribute("sports_list", codeService.getCodeList(cvo));
		
		if(vo.getEnd_dis() == null) {
			return "/user/group_s/s_end_room";
		} else {
			return "/notiles/group_s/s_end_temp";
		}
	}
	
	//반짝 방 참여 전에  참여 여부 확인 + 마감 인원 파악
	@ResponseBody
	@RequestMapping(value="/sgroup/sgValidIn/{sg_num}", method = RequestMethod.GET)
	public ActiveHistVO sgValidIn(@PathVariable int sg_num, ActiveHistVO vo, CodeVO cvo) {
		MembersVO memInfo = (MembersVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal(); //세션 정보 갖고 오기
		vo.setM_id(memInfo.getM_id());
		
		vo.setIn_type("sg"); //sg:반짝방, bg:매치방, six:용병방(직접 입력)
		vo.setPk_num(sg_num);
		actService.validIn(vo);
		return vo;
	}
	
	//선택한 방에 참여1) - 이미 참여되어 있는 방에 참여
	@RequestMapping("/sgroup/alreadyIn")
	public String alreadyIn(
			@RequestParam(value="sg_num", defaultValue="", required=true) int sg_num,
			Model model, SGroupVO vo, ActiveHistVO avo, CodeVO cvo, ChatHistVO chvo) throws JsonProcessingException {
		vo.setSg_num(sg_num);
		model.addAttribute("sgroup", sgroupService.getRoomInfo(vo));
		
		//은영 - 해당 방의 채팅내역 채팅방으로 넘김
		UserDetails user = (UserDetails)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		avo.setM_id(user.getUsername());
		avo.setSg_num(sg_num);
		chvo = chatService.getJoinTime(avo); //활동히스토리에서 반짝 참여시간 가져와서 chatVO에 담음.
		
		chvo.setSg_num(sg_num);	//본인의방번호 chatVO에담음.
		
		ObjectMapper mapper = new ObjectMapper(); //javascript에쓰기위해 jsonString?으로변환
		String jsonChatList = mapper.writeValueAsString(chatService.getChatHist(chvo));
		
		model.addAttribute("chatlist", jsonChatList);
		
		//참여 인원 정보를 채팅방으로 넘김
		avo.setSg_num(sg_num);
		model.addAttribute("memlist", actService.getActMemList(avo));
		
		return "/user/group_s/s_wating_room";
	}
	
	//선택한 방에 참여2)- 참여되어 있지 않은 방에 참여
	@ResponseBody
	@RequestMapping("/sgroup/roomIn")
	public String roomIn(
			@RequestParam(value="sg_num", defaultValue="", required=true) int sg_num,
			Model model, SGroupVO svo, ActiveHistVO avo, CodeVO cvo) {
		MembersVO memInfo = (MembersVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal(); //세션 정보 갖고 오기
		avo.setM_id(memInfo.getM_id());
		
		avo.setIn_type("sg"); //sg:반짝방, bg:매치방, six:용병방(직접 입력)
		avo.setPk_num(sg_num);
		actService.roomInsert(avo);
		
		return "true";
//		return "redirect:alreadyIn?sg_num="+avo.getSg_num();
	}

	
	//반짝 생성 폼으로 이동
	@RequestMapping("/sgroup/createRoomForm")
	public String createRoomForm(Model model, CodeVO vo) {
		vo.setCd_group("SPORTS1_CD");
		model.addAttribute("sports_list", codeService.getCodeList(vo));
		vo.setCd_group("SKILL_CD");
		model.addAttribute("skill_list", codeService.getCodeList(vo));
		vo.setCd_group("GENDER_CD");
		model.addAttribute("gender_list", codeService.getCodeList(vo));
		return "/user/group_s/s_room_cre";	
	}
	
	//방 생성
	@ResponseBody
	@RequestMapping(value="/sgroup/creRoom", method=RequestMethod.POST)
	public SGroupVO createRoom(SGroupVO vo) {
		MembersVO memInfo = (MembersVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal(); //세션 정보 갖고 오기
		vo.setM_id(memInfo.getM_id());
		
		sgroupService.insertSg(vo); //방 생성 맵퍼
		vo.setAlert_gnum(sgroupService.insertSgAlert(vo)); // alert테이블 인서트 맵퍼 : result값은 메시지 그룹 번호
		return vo;
//		return "redirect:alreadyIn?sg_num="+vo.getSg_num();
	}

	
	//참여 인증
	@ResponseBody
	@RequestMapping(value="/sgroup/sgCert", method = RequestMethod.POST)
	public SGroupVO part_cert(SGroupVO vo) { //"success"를 받아와야 함.
		MembersVO memInfo = (MembersVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();//세션 정보 갖고 오기
		vo.setM_id(memInfo.getM_id());
		sgroupService.getSgCert(vo);
		return vo;
	}
	
}
