package com.yedam.gca.board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.yedam.gca.board.service.BoardPager;
import com.yedam.gca.board.service.BoardService;
import com.yedam.gca.board.service.ReplyService;
import com.yedam.gca.board.vo.AdBoardVO;

@Controller	// 현재 클래스를 컨트롤러 빈(bean)으로 등록
@RequestMapping("/board/*")
public class BoardController {
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	// 의존관계 주입 => BoardServiceImpl 생성
	// IoC 의존관계 역전
	@Inject
	BoardService boardService;
	@Inject
	ReplyService replyService;
	
	// 01. 게시글 목록
	@RequestMapping("adlist")//url에서 실행할때 이름 호출
	public ModelAndView list(@RequestParam(defaultValue="ad_title") String searchOption,
							@RequestParam(defaultValue="") String keyword,
							@RequestParam(defaultValue="1") int curPage) throws Exception{
		// 레코드의 갯수 계산
				int count = boardService.countArticle(searchOption, keyword);
		// 페이지 나누기 관련 처리
		BoardPager boardPager = new BoardPager(count, curPage);
		int start = boardPager.getPageBegin();
		int end = boardPager.getPageEnd();
		
		List<AdBoardVO> list = boardService.listAll(start, end, searchOption, keyword);
		
		// 데이터를 맵에 저장
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list); // list
		map.put("count", count); // 레코드의 갯수
		map.put("searchOption", searchOption); // 검색옵션
		map.put("keyword", keyword); // 검색키워드
		map.put("boardPager", boardPager);
		// ModelAndView - 모델과 뷰
		ModelAndView mav = new ModelAndView();
		mav.addObject("map", map); // 맵에 저장된 데이터를 mav에 저장
		mav.setViewName("/user/askBoard/list"); // 뷰를 list.jsp로 설정
		return mav; // list.jsp로 List가 전달된다.
	}
	
	
	
	// 02_01. 게시글 작성화면
	// @RequestMapping("board/write.do")
	// value="", method="전송방식"
	@RequestMapping(value="write.do", method=RequestMethod.GET)
	public String write(){
		return "/user/askBoard/write"; // write.jsp로 이동
	}
	
	// 02_02. 게시글 작성처리
	@RequestMapping(value="insert.do", method=RequestMethod.POST)
	public String insert(@ModelAttribute AdBoardVO vo) throws Exception{
		UserDetails user = (UserDetails)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		vo.setM_id(user.getUsername()); 
		boardService.create(vo);
		return "redirect:adlist";
	}
	
	// 03. 게시글 상세내용 조회, 게시글 조회수 증가 처리
	// @RequestParam : get/post방식으로 전달된 변수 1개
	// HttpSession 세션객체
	@RequestMapping(value="view", method=RequestMethod.GET)
	public ModelAndView view(@RequestParam int ad_num, @RequestParam int curPage, @RequestParam String searchOption,
							@RequestParam String keyword, HttpSession session) throws Exception{
		// 조회수 증가 처리
		boardService.increaseViewcnt(ad_num, session);
		// 모델(데이터)+뷰(화면)를 함께 전달하는 객체
		ModelAndView mav = new ModelAndView();
		// 뷰의 이름
		mav.setViewName("/user/askBoard/view");
		// 뷰에 전달할 데이터
		// 댓글의 수 : 댓글이 존재하는 게시물의 삭제처리 방지하기 위해
		mav.addObject("count", replyService.count(ad_num)); 
		mav.addObject("dto", boardService.read(ad_num));
		mav.addObject("curPage", curPage);
		mav.addObject("searchOption", searchOption);
		mav.addObject("keyword", keyword);
		logger.info("mav:", mav);
		return mav;
	}
	
	// 04. 게시글 수정
	// 폼에서 입력한 내용들은 @ModelAttribute AdBoardVO vo로 전달됨
	@RequestMapping(value="update", method=RequestMethod.POST)
	public String update(@ModelAttribute AdBoardVO vo) throws Exception{
		boardService.update(vo);
		return "redirect:adlist";
	}
	
	// 05. 게시글 삭제
	@RequestMapping("delete.do")
	public String delete(@RequestParam int ad_num) throws Exception{
		boardService.delete(ad_num);
		return "redirect:adlist";
	}
	
	
	 
}
