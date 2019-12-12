package com.yedam.gca.board.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.yedam.gca.board.service.QnaBoardService;
import com.yedam.gca.board.vo.BoardSearchVO;
import com.yedam.gca.board.vo.QnaBoardVO;
import com.yedam.gca.common.Paging;

//ajax 요청 처리 컨트롤러
  
  @Controller //
/* @RequestMapping("qnaboard") */
  public class QnaBoardController {
	  private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	  
  /*ajax로 넘겨 주는것은 데이터만 주면됨 처음에만 view 연결*/
  @Autowired QnaBoardService boardService;
  
  // 목록
  @RequestMapping(value = "qnaboard") 
  public String getBoardList(Model model, BoardSearchVO svo, Paging paging)  { 
	  model.addAttribute("boardList",boardService.getBoardList(svo, paging)); 
	  model.addAttribute("paging", paging); 
	  return "/user/askBoard/qnaBoard"; 
	  }
  
  // 관리지목록
	  @RequestMapping(value = "/admin/admin_qnaboard")
	  public String getBoardList2(Model model, BoardSearchVO svo, Paging paging) {
		  model.addAttribute("board",boardService.getBoardList2(svo, paging));
		  model.addAttribute("paging",paging);
	  return "/admin/admin_qnaBoard"; 
	  }
	 

	// 03. 게시글 상세내용 조회, 게시글 조회수 증가 처리
		// @RequestParam : get/post방식으로 전달된 변수 1개
		// HttpSession 세션객체
	/*
	 * @RequestMapping(value="view", method=RequestMethod.GET) public ModelAndView
	 * view(@RequestParam int qb_num, @RequestParam int curPage, @RequestParam
	 * String searchOption,
	 * 
	 * @RequestParam String keyword, @AuthenticationPrincipal UserDetails user)
	 * throws Exception{ // 조회수 증가 처리 boardService.increaseViewcnt(qb_num, user); //
	 * 모델(데이터)+뷰(화면)를 함께 전달하는 객체 ModelAndView mav = new ModelAndView(); // 뷰의 이름
	 * mav.setViewName("/user/askBoard/view"); // 뷰에 전달할 데이터 mav.addObject("dto",
	 * boardService.read(qb_num)); mav.addObject("curPage", curPage);
	 * mav.addObject("searchOption", searchOption); mav.addObject("keyword",
	 * keyword); logger.info("mav:", mav); return mav; }
	 */
	  
	  
	  
	  
  
  /////////////////////////////////////////////////////////////////////////////
  /////////////////////////////////////////
  
  // 목록
  
  @ResponseBody
  @RequestMapping("/ajax/getBoardList.json")
  public List<QnaBoardVO>getBoardList(BoardSearchVO svo, Paging paging) {
	  return boardService.getBoardList(svo, paging); }
  
  
  // 관리자목록
  @ResponseBody
  @RequestMapping("/ajax/getBoardList2.json") 
  public List<QnaBoardVO>getBoardList2(BoardSearchVO svo, Paging paging) {
	  return boardService.getBoardList2(svo, paging); }
  
  // 작성
  //@ResponseBody를 사용해주면 view를 생성해주는것이 아니라, JSON 혹은 Object 형태로 데이터를 넘겨준다.
  @ResponseBody 
  @RequestMapping(value = "/ajax/insertBoard.json", consumes ="application/json")
  	public QnaBoardVO insertBoard(@RequestBody QnaBoardVO vo){
	  boardService.insertBoard(vo);
	  return vo; }
  
  // 삭제
  @ResponseBody
  @RequestMapping(value = "board/{qb_id}", method = RequestMethod.DELETE)
  public int deleteBoard(@PathVariable int qb_id, QnaBoardVO vo) {
	  vo.setQb_id(qb_id);
	  boardService.deleteBoard(vo); 
	  return qb_id; 
	  }
  
  // 단건조회
  
  @ResponseBody  
  @RequestMapping(value = "board/{qb_id}", method = RequestMethod.GET) public
  QnaBoardVO getBoard(@PathVariable int qb_id, QnaBoardVO vo) {
	  vo.setQb_id(qb_id); 
	  return boardService.getBoard(vo); }
  
  }
