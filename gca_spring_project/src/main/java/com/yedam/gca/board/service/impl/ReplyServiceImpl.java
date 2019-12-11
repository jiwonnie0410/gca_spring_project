package com.yedam.gca.board.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;

import com.yedam.gca.board.dao.ReplyDAO;
import com.yedam.gca.board.service.ReplyService;
import com.yedam.gca.board.vo.AdReplyVO;

@Service
public class ReplyServiceImpl implements ReplyService {
	
	@Inject
	ReplyDAO replyDao;

	// 1. 댓글 입력
	@Override
	public void create(AdReplyVO vo) {
		replyDao.create(vo);
	}
	// 2. 댓글 목록
	/*	@Override
	
	 * public List<AdReplyVO> list(Integer ad_num, int start, int
	 * end, @AuthenticationPrincipal UserDetails user) { List<AdReplyVO> items =
	 * replyDao.list(ad_num, start, end); // 세션에서 현재 사용자 id값 저장 String m_id =
	 * (String) user.getAttribute("m_id"); for(AdReplyVO vo : items){ // 댓글 목록중에 중에
	 * 비밀 댓글이 있을 경우 if(vo.getAdr_hidden().equals("y")){ if(m_id== null){ // 비로그인 상태면
	 * 비밀 댓글로 처리 vo.setAdr_content("비밀 댓글입니다."); } else { // 로그인 상태일 경우 String
	 * writer = vo.getM_id(); // 게시물 작성자 저장 String replyer = vo.getM_id(); // 댓글 작성자
	 * 저장 // 로그인한 사용자가 게시물의 작성자X 댓글 작성자도 X 비밀댓글로 처리 if(!m_id.equals(writer) &&
	 * !m_id.equals(replyer)) { vo.setAdr_content("비밀 댓글입니다."); } } } }
	 
		return items; 
	}*/
	// 3. 댓글 상세보기
	@Override
	public AdReplyVO detail(Integer adr_num) {
		return replyDao.detail(adr_num);
	}
	// 4. 댓글 수정
	@Override
	public void update(AdReplyVO vo) {
		replyDao.update(vo);
	}
	// 5. 댓글 삭제
	@Override
	public void delete(Integer adr_num) {
		replyDao.delete(adr_num);
	}
	// 6. 댓글 갯수
	@Override
	public int count(Integer ad_num) {
		return replyDao.count(ad_num);
	}
	@Override
	public List<AdReplyVO> list(Integer ad_num, int start, int end, UserDetails user) {
		// TODO Auto-generated method stub
		return null;
	}
}
