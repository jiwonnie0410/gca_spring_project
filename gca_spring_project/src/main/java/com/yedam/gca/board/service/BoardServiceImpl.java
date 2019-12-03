package com.yedam.gca.board.service;



import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yedam.gca.board.dao.BoardDAO;
import com.yedam.gca.board.vo.AdBoardVO;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Inject
	BoardDAO boardDao;
	
	// 01. 게시글쓰기
	@Transactional // 트랜잭션 처리 메서드로 설정
	@Override
	public void create(AdBoardVO vo) throws Exception {
		String title = vo.getAd_title();
		String content = vo.getAd_content();
		String m_id = vo.getM_id();
		// *태그문자 처리 (< ==> &lt; > ==> &gt;)
		// replace(A, B) A를 B로 변경
		title = title.replace("<", "&lt;");
		title = title.replace("<", "&gt;");
		m_id = m_id.replace("<", "&lt;");
		m_id = m_id.replace("<", "&gt;");
		// *공백문자 처리  
		title = title.replace("  ",	"&nbsp;&nbsp;");
		m_id = m_id.replace("  ",	"&nbsp;&nbsp;");
		// *줄바꿈 문자처리
		content = content.replace("\n", "<br>");
		vo.setAd_title(title);
		vo.setAd_content(content);
		vo.setM_id(m_id);
		// 게시물 등록
		boardDao.create(vo);
	
		}
		
	
	// 02. 게시글 상세보기
	@Override
	public AdBoardVO read(int ad_num) throws Exception {
		return boardDao.read(ad_num);
	}
	// 03. 게시글 수정
	@Transactional
	@Override
	public void update(AdBoardVO vo) throws Exception {
		boardDao.update(vo);
	}
	// 04. 게시글 삭제
	@Override
	public void delete(int ad_num) throws Exception {
		boardDao.delete(ad_num);
	}
	// 05. 게시글 전체 목록
	@Override
	public List<AdBoardVO> listAll(int start, int end, String searchOption, String keyword) throws Exception {
		return boardDao.listAll(start, end, searchOption, keyword);
	}
	
	// 06. 게시글 조회수 증가
	@Override
	public void increaseViewcnt(int ad_num, HttpSession session) throws Exception {
		long update_time = 0;
		// 세션에 저장된 조회시간 검색
		// 최초로 조회할 경우 세션에 저장된 값이 없기 때문에 if문은 실행X
		/*
		 * if(session.getAttribute("update_time_"+ad_num) != null){ // 세션에서 읽어오기
		 * update_time = (long)session.getAttribute("update_time_"+ad_num); }
		 */
		// 시스템의 현재시간을 current_time에 저장
		long current_time = System.currentTimeMillis();
		// 일정시간이 경과 후 조회수 증가 처리 24*60*60*1000(24시간)
		 // 시스템현재시간 - 열람시간 > 일정시간(조회수 증가가 가능하도록 지정한 시간)
		if(current_time - update_time > 5*1000){
			boardDao.increaseViewcnt(ad_num);
			// 세션에 시간을 저장 : "update_time_"+ad_num는 다른변수와 중복되지 않게 명명한 것
			session.setAttribute("update_time_"+ad_num, current_time);
			
		}
	}
	// 07. 게시글 레코드 갯수
	@Override
	public int countArticle(String searchOption, String keyword) throws Exception {
		return boardDao.countArticle(searchOption, keyword);
	}

}
