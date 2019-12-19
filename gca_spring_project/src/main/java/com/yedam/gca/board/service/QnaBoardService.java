package com.yedam.gca.board.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;

import com.yedam.gca.board.vo.AdBoardVO;
import com.yedam.gca.board.vo.BoardSearchVO;
import com.yedam.gca.board.vo.QnaBoardVO;
import com.yedam.gca.common.Paging;

public interface QnaBoardService {

	
	
	/*
	 * dao에서 refator에서 extac interface를 이용하여 service를 만들고 
	 */
	//게시글전체조회
	List<QnaBoardVO> getBoardList(BoardSearchVO svo, Paging p);
	
	//관리자 게시글전체조회
	List<QnaBoardVO> getBoardList2(BoardSearchVO svo, Paging paging); 
	
	
	List<Map<String,Object>>getBoardListMap();

	//게시글 삭제
	public int deleteBoard(QnaBoardVO vo);
	
	// 02. 게시글 상세보기
		public QnaBoardVO read(int qb_id) throws Exception;
	
	// 게시글 작성
	public int insertBoard(QnaBoardVO vo);

	//  게시글 수정
	int updateBoard(QnaBoardVO vo);

	


}