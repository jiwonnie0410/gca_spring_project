package com.yedam.gca.board.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;

import com.yedam.gca.board.vo.AdReplyVO;

public interface ReplyService {
	// 1. 댓글 입력
	public void create(AdReplyVO vo);
	// 2. 댓글 목록
	public List<AdReplyVO> list(int ad_num, int start, int end, UserDetails user);
	// 3. 댓글 상세보기
	public AdReplyVO detail(Integer adr_num);
	// 4. 댓글 수정
	public void update(AdReplyVO vo);
	// 5. 댓글 삭제
	public void delete(Integer adr_num);
	// 6. 댓글 갯수
	public int count(Integer ad_num);
}
