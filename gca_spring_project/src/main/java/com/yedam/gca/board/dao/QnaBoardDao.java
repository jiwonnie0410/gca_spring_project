package com.yedam.gca.board.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yedam.gca.board.vo.AdBoardVO;
import com.yedam.gca.board.vo.BoardSearchVO;
import com.yedam.gca.board.vo.QnaBoardVO;
@Repository  //빈등록
public class QnaBoardDao  {
	
	@Autowired 
	SqlSessionTemplate mybatis;
	
	//다건조회(map)
	public  List<Map<String,Object>> getBoardListMap() {
		return mybatis.selectList("BoardDAO.getBoardListMap");
	}
	
	//다건조회
	public  List<QnaBoardVO> getBoardList(BoardSearchVO svo) {
		return mybatis.selectList("BoardDAO.getBoardList",svo);
	}
	//관리자다건조회
		public  List<QnaBoardVO> getBoardList2(BoardSearchVO svo) {
			return mybatis.selectList("BoardDAO.getBoardList",svo);
		}
	
	//건수조회
	public int getBoardCount(BoardSearchVO svo) {
		return mybatis.selectOne("BoardDAO.getBoardCount", svo);
	}
	
	//삭제
	public int deleteBoard(QnaBoardVO vo) {
		return mybatis.delete("BoardDAO.deleteBoard", vo);
	}
	//등록
	public int insertBoard(QnaBoardVO vo) {
		return mybatis.insert("BoardDAO.insertBoard", vo);
	}	
	//수정
	public int updateBoard(QnaBoardVO vo) {
		return mybatis.update("BoardDAO.updateBoard", vo);
	}
	
	//단건조회
	public  QnaBoardVO read(int qb_id)throws Exception {
		return mybatis.selectOne("BoardDAO.view", qb_id);
	}

	// 02. 게시글 상세보기
	
}
