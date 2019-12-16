package com.yedam.gca.group_s.controller;

import javax.servlet.http.HttpSession;

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
import com.yedam.gca.chatting.controller.SpringSocketHandler;
import com.yedam.gca.chatting.vo.SocketVO;
import com.yedam.gca.common.code.service.CodeService;
import com.yedam.gca.common.code.vo.CodeVO;
import com.yedam.gca.group_s.service.SGroupService;
import com.yedam.gca.group_s.vo.SGroupVO;
import com.yedam.gca.history.service.ActiveHistService;
import com.yedam.gca.history.vo.ActiveHistVO;
import com.yedam.gca.member.vo.MembersVO;

@Controller
public class SGroupController {
	
	@Autowired	SGroupService sgroupService;
	@Autowired	CodeService codeService;
	@Autowired	ActiveHistService actService;
	
	
//*****************************************은영************************************
	@RequestMapping("/sgroup/getRoomInfo")
	public String getRoomInfo(Model model, SGroupVO vo) {
		model.addAttribute("sgroup", sgroupService.getRoomInfo(vo));
		System.out.println(model);
		return "group_s/s_wating_room";
	}
	
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
	

//*****************************************미현************************************
	
	//전체 반짝 리스트 조회
	@RequestMapping(value="/sgroup/getSgList")
	public String search(Model model, SGroupVO vo, CodeVO cvo) {
		MembersVO memInfo = (MembersVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();//세션 정보 갖고 오기
		vo.setM_xy(memInfo.getM_xy());
		
		vo.setScroll_rec(3); //조회할 레코드 수(직접 입력)
		model.addAttribute("sgroup", vo);
		model.addAttribute("list", sgroupService.getSgList(vo));
		
		//sports1과 관련된 code정보 모두 보내기
		cvo.setCd_group("SPORTS1_CD");
		model.addAttribute("sports_list", codeService.getCodeList(cvo));
		
		if(vo.getEnd_dis() == null) {
			return "/notiles/group_s/s_search";	//추후 notiles를 user로 바꾸기	
		} else {
			return "/notiles/group_s/s_search_temp";
		}
	}
	
	//마감 반짝 리스트 조회
	@RequestMapping(value="/sgroup/getSgListEnd")
	public String searchEnd(SGroupVO vo, CodeVO cvo, Model model) {
		MembersVO memInfo = (MembersVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();//세션 정보 갖고 오기
		vo.setM_xy(memInfo.getM_xy());
		
		vo.setScroll_rec(3); //조회할 레코드 수(직접 입력)
		model.addAttribute("sgroup", vo);
		model.addAttribute("list", sgroupService.getSgEndList(vo));
		
		//sports1과 관련된 code정보 모두 보내기
		cvo.setCd_group("SPORTS1_CD");
		model.addAttribute("sports_list", codeService.getCodeList(cvo));
		
		if(vo.getEnd_dis() == null) {
			return "/notiles/group_s/s_end_room";	//추후 notiles를 user로 바꾸기	
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
			Model model, SGroupVO vo, ActiveHistVO avo, CodeVO cvo) {
		vo.setSg_num(sg_num);
		model.addAttribute("sgroup", sgroupService.getRoomInfo(vo));
		
		//참여 인원 정보를 채팅방으로 넘김
		avo.setSg_num(sg_num);
		model.addAttribute("memlist", actService.getActMemList(avo));
		return "/user/group_s/s_wating_room";
	}
	
	//선택한 방에 참여2)- 참여되어 있지 않은 방에 참여
	@RequestMapping("/sgroup/roomIn")
	public String roomIn(
			@RequestParam(value="sg_num", defaultValue="", required=true) int sg_num,
			Model model, SGroupVO svo, ActiveHistVO avo, CodeVO cvo) {
		MembersVO memInfo = (MembersVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal(); //세션 정보 갖고 오기
		avo.setM_id(memInfo.getM_id());
		
		avo.setIn_type("sg"); //sg:반짝방, bg:매치방, six:용병방(직접 입력)
		avo.setPk_num(sg_num);
		actService.roomInsert(avo);
		
		
		//은영 컨트롤러단에서 socket sendMessage
//		SocketVO socketVO = new SocketVO();
//		socketVO.setCmd("join");
//		socketVO.setId(memInfo.getM_id());
//		socketVO.setMsg("<"+memInfo.getM_id()+"님이 참가하셨습니다>");
//		socketVO.setCharacter(sgroupService.returnImage(memInfo));
//		socketVO.setNick(memInfo.getM_nick());
		
//		SpringSocketHandler socket = new SpringSocketHandler();
//		socket.sendMessage(socketVO);
		
		return "redirect:alreadyIn?sg_num="+avo.getSg_num()
								+ "&first_in=first_in"; //새로 참여하는 경우임을 구분하기 위해 보내는 잉여값. 
									//alreadyIn에서 다른 처리작업을 할 필요 없이 값이 그대로 넘어감
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
		return "/notiles/group_s/s_room_cre"; //추후 notiles를 user로 바꾸기	
	}
	
	//방 생성
	@RequestMapping(value="/sgroup/creRoom", method=RequestMethod.POST)
	public String createRoom(@ModelAttribute SGroupVO vo) {
		MembersVO memInfo = (MembersVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal(); //세션 정보 갖고 오기
		vo.setM_id(memInfo.getM_id());
		
		sgroupService.insertSg(vo);
		return "redirect:alreadyIn?sg_num="+vo.getSg_num();
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
	
	//전체 반짝+마감 반짝 리스트 조회(미사용중)
	@RequestMapping(value= {"/sgroup/getSgList","/sgroup/getSgListEnd"} )
		//모든 getSgList 호출 주소 변경 필요. default는 전체 반짝, end는 마감 반짝
		//s_search, s_end_room jsp, js getSg로 검색하여 getSgList/default(end) 로 변경
		//getSgList를 변경하지 않고 전체메서드와 마감메서드를 구분할 다른 방법은 없을까..
	public String search(@PathVariable String whatroom, Model model, SGroupVO vo, CodeVO cvo) {
		MembersVO memInfo = (MembersVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();//세션 정보 갖고 오기
		vo.setM_xy(memInfo.getM_xy());
		
		vo.setScroll_rec(3); //조회할 레코드 수(직접 입력)
		model.addAttribute("sgroup", vo);
		if(whatroom == "default") 	model.addAttribute("list", sgroupService.getSgList(vo));
		else if(whatroom == "end") 	model.addAttribute("list", sgroupService.getSgEndList(vo));
		
		//sports1과 관련된 code정보 모두 보내기
		cvo.setCd_group("SPORTS1_CD");
		model.addAttribute("sports_list", codeService.getCodeList(cvo));
		
		String viewsrc = null;
		if(whatroom == "default") {
			if(vo.getEnd_dis() == null) viewsrc = "/user/group_s/s_search";
			else viewsrc = "/notiles/group_s/s_search_temp";
		} else if(whatroom == "end") {
			if(vo.getEnd_dis() == null) viewsrc = "/user/group_s/s_end_room";
			else viewsrc = "/notiles/group_s/s_end_temp";
		}
		return viewsrc;
	}
	
}
