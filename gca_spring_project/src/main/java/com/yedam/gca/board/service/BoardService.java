package com.yedam.gca.board.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.security.core.userdetails.UserDetails;

import com.yedam.gca.board.vo.AdBoardVO;

public interface BoardService {
	// 01. 게시글 작성
	public void create(AdBoardVO vo) throws Exception;
	// 02. 게시글 상세보기
	public AdBoardVO read(int ad_num) throws Exception;
	// 03. 게시글 수정
	public void update(AdBoardVO vo) throws Exception;
	// 04. 게시글 삭제
	public void delete(int ad_num) throws Exception;
	// 05. 게시글 전체 목록
	public List<AdBoardVO> listAll(int start, int end, String searchOption, String keyword) throws Exception;
	// 06. 게시글 조회
	public void increaseViewcnt(int ad_num, HttpSession session) throws Exception;
	// 07. 게시글 레코드 갯수
	public int countArticle(String searchOption, String keyword ) throws Exception;
	
}
