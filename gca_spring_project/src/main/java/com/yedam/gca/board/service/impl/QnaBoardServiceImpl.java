package com.yedam.gca.board.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yedam.gca.board.dao.QnaBoardDao;
import com.yedam.gca.board.service.QnaBoardService;
import com.yedam.gca.board.vo.AdBoardVO;
import com.yedam.gca.board.vo.BoardSearchVO;
import com.yedam.gca.board.vo.QnaBoardVO;
import com.yedam.gca.common.Paging;

@Service
public class QnaBoardServiceImpl implements QnaBoardService {

	// @Autowired @Qualifier("qnaboarddao")
	@Resource
	QnaBoardDao dao;

	@Override
	public List<Map<String, Object>> getBoardListMap() {
		return dao.getBoardListMap();
	}

	//조회
	@Override
	public List<QnaBoardVO> getBoardList(BoardSearchVO svo, Paging paging) {
		// 출력건수
		paging.setPageUnit(10);
		
		// 페이지번호가 없으면 1로 초기화
		if (paging.getPage() == null) {
			paging.setPage(1);
		}
		
		// 시작/마지막 레코드 번호
		svo.setStart(paging.getFirst());
		svo.setEnd(paging.getLast());
		
		// 전체 건수
		paging.setTotalRecord(dao.getBoardCount(svo));
		return dao.getBoardList(svo);
	}
	
	
	//관리자 조회
	@Override
	public List<QnaBoardVO> getBoardList2(BoardSearchVO svo, Paging paging) {
		// 출력건수
		paging.setPageUnit(3);
		// 페이지번호가 없으면 1로 초기화
		if (paging.getPage() == null) {
			paging.setPage(1);
		}
		// 시작/마지막 레코드 번호
		svo.setStart(paging.getFirst());
		svo.setEnd(paging.getLast());
		// 전체 건수
		paging.setTotalRecord(dao.getBoardCount(svo));

		return dao.getBoardList(svo);
	}
	  
	 
	
	
	

	@Override
	public int deleteBoard(QnaBoardVO vo) {
		return dao.deleteBoard(vo);
	}

	@Override
	public int insertBoard(QnaBoardVO vo) {
		return dao.insertBoard(vo);
	}

	@Override
	public int updateBoard(QnaBoardVO vo) {
		return dao.updateBoard(vo);
	}

	//단건조회
	@Override
	public QnaBoardVO read(int qb_id) throws Exception {
		return dao.read(qb_id);
	}

	
}
