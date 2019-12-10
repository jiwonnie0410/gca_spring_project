package com.yedam.gca.admin.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.gca.admin.service.AdminService;
import com.yedam.gca.challenge.vo.ChallengeVO;
import com.yedam.gca.member.controller.MembersController;
import com.yedam.gca.member.service.MemberService;
import com.yedam.gca.member.vo.MembersVO;

@Controller
public class AdminController {
// 1-1챌린지 관리 페이지		1-2챌린지 등록
// 2매출 페이지
// 3-1통계 페이지 	3-2반짝 운동별 통계 	3-3동호회 매치 운동별 통계 	 3-4연령대 및 운동(반짝)성별 통계 	3-5지역별 반짝 운동 통계

	@Autowired
	AdminService adminService;


	// 지원
	// 1-1. 챌린지 관리 페이지
	@RequestMapping("/admin/challenge")
	public String adminChallenge() {
		return "/admin/admin_challenge_list";
	}

	// 1-2. 챌린지 등록
	@ResponseBody
	@RequestMapping("/ajax/createChallenge")
	public String createChallenge(HttpServletRequest request, ChallengeVO vo) {
		request.getParameter(""); // 이런 식으로 vo에다 담기 -> 그러려면 jsp에 name 바꿔야 함
		return adminService.createChallenge(vo);
	}

	// 2. 매출 페이지
	@RequestMapping("/admin/sale")
	public String adminMoney() {
		return "/admin/admin_bank";
	}

	// 3-1. 통계 페이지
	@RequestMapping("/admin/chart")
	public String adminChart() {

		return "/admin/admin_chart";
	}

	// 3-2. 통계 -> 반짝 운동별 통계
	@ResponseBody
	@RequestMapping("/ajax/chart/sgroup")
	public List<Map<String, Object>> chartSgroup() {
		return adminService.chartSgroup();
	}

	// 3-3. 통계 -> 동호회 매치 운동별 통계
	@ResponseBody
	@RequestMapping("/ajax/chart/bgroup")
	public List<Map<String, Object>> chartBgroup() {
		return adminService.chartBgroup();
	}

	// 3-4. 통계 -> 연령대 및 운동(반짝)성별 통계
	@ResponseBody
	@RequestMapping("/ajax/chart/gender")
	public List<Map<String, Object>> chartGender() {
		return adminService.chartGender("G01", 20, 29);
	}

	// 3-5. 통계 -> 지역별 반짝 운동 통계
	@ResponseBody
	@RequestMapping("/ajax/chart/city")
	public List<Map<String, Object>> chartCity() {
//		Calendar calendar = new GregorianCalendar(Locale.KOREA);
//		String nowMonth = Integer.toString(calendar.get(Calendar.MONTH) + 1); 	// 현재 달
//		String oneMonth, twoMonth, threeMonth;									// 한달전, 두달전, 세달전
//		
//		// 만약 구하려는 달이 10월 전이라면 쿼리에는 09 08 07월로 들어가야 하기 때문에 문자열로 앞에 0을 붙여줌
//		// 현재 달
//		if((calendar.get(Calendar.MONTH)+1) < 10) {	nowMonth = "0".concat(Integer.toString(calendar.get(Calendar.MONTH) + 1)); }
//		else nowMonth = Integer.toString(calendar.get(Calendar.MONTH) + 1);
//		// 한달 전
//		if((calendar.get(Calendar.MONTH)) < 10) {	oneMonth = "0".concat(Integer.toString(calendar.get(Calendar.MONTH))); }
//		else oneMonth = Integer.toString(calendar.get(Calendar.MONTH));
//		// 두 달 전
//		if((calendar.get(Calendar.MONTH)-1) < 10) {	twoMonth = "0".concat(Integer.toString(calendar.get(Calendar.MONTH) - 1)); }
//		else twoMonth = Integer.toString(calendar.get(Calendar.MONTH) - 1);
//		// 세 달 전
//		if((calendar.get(Calendar.MONTH)-2) < 10) {	threeMonth = "0".concat(Integer.toString(calendar.get(Calendar.MONTH) - 2)); }
//		else threeMonth = Integer.toString(calendar.get(Calendar.MONTH) - 2);

//		for(int i=(Integer.parseInt(startMonth)); i<=Integer.parseInt(nowMonth); i++) {
//			adminService.chartCity(startMonth, "대구");
//		}

		return adminService.chartCity("12", "대구");
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// 진영
	 private static final Logger logger = LoggerFactory.getLogger(MembersController.class);
	 // **전체조회
		@RequestMapping("getUserList.do")
	public String getUserList1(Model model, MembersVO vo) {
		model.addAttribute("userList", adminService.getUserList(vo));
		return "/admin/userList";
	}

	//03 회원 상세정보 조회
    @RequestMapping("member/admin_member_view.do")
    public String memberView(@RequestParam String m_id, Model model){
        // 회원 정보를 model에 저장
        model.addAttribute("dto", adminService.viewMember(m_id));
       //System.out.println("클릭한 아이디 확인 : "+userId);
        logger.info("클릭한 아이디 : "+m_id);
       // member_view.jsp로 포워드
       return "/notiles/member/member_view";
    }

    
	// **전체조회
	@ResponseBody
	@RequestMapping(value = "/members", method = RequestMethod.GET)
	public List<MembersVO> getUserList(Model model, MembersVO vo) {
		return adminService.getUserList(vo);
	}

	

	//**관리자 유저 삭제
	@ResponseBody
	@RequestMapping(value = "/members/{m_id}", method = RequestMethod.DELETE)
	public String deleteUser(@PathVariable String m_id, MembersVO vo) {
		vo.setM_id(m_id);
		adminService.deleteUser(vo);
		return m_id;
	}


}
