package com.yedam.gca.board.service;

import java.util.List;
import java.util.Map;


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
	int deleteBoard(QnaBoardVO vo);

	// 게시글 작성
	int insertBoard(QnaBoardVO vo);

	//  게시글 수정
	int updateBoard(QnaBoardVO vo);

	// 게시글 상세보기
	QnaBoardVO getBoard(QnaBoardVO vo);

	
	//test
	/*
	 * List<QnaBoardVO> getContentList2(Map<String, Object> paramMap); int
	 * getContentCnt(Map<String, Object> paramMap);
	 */
	


}