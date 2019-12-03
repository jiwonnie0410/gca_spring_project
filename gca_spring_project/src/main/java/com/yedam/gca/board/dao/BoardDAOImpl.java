package com.yedam.gca.board.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.yedam.gca.board.vo.AdBoardVO;

@Repository	// 현재 클래스를 dao bean으로 등록
public class BoardDAOImpl implements BoardDAO {
	@Inject
	SqlSession sqlSession;
	// 01_01. 게시글 작성
	@Override
	public void create(AdBoardVO vo) throws Exception {
		sqlSession.insert("board.insert", vo);
	}
	
	
	
	// 02. 게시글 상세보기
	@Override
	public AdBoardVO read(int ad_num) throws Exception {
		return sqlSession.selectOne("board.view", ad_num);
	}
	// 03. 게시글 수정
	@Override
	public void update(AdBoardVO vo) throws Exception {
		sqlSession.update("board.updateArticle", vo);

	}
	// 04. 게시글 삭제
	@Override
	public void delete(int ad_num) throws Exception {
		sqlSession.delete("board.deleteArticle",ad_num);

	}
	// 05. 게시글 전체 목록
	@Override
	public List<AdBoardVO> listAll(int start, int end, String searchOption, String keyword) throws Exception {
		// 검색옵션, 키워드 맵에 저장
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		// BETWEEN #{start}, #{end}에 입력될 값
		map.put("start", start);
		map.put("end", end);
		return sqlSession.selectList("board.listAll", map);
	}
	// 06. 게시글 조회수 증가
	@Override
	public void increaseViewcnt(int ad_num) throws Exception {
		sqlSession.update("board.increaseViewcnt", ad_num);
	}
	// 07. 게시글 레코드 갯수
	@Override
	public int countArticle(String searchOption, String keyword) throws Exception {
		// 검색옵션, 키워드 맵에 저장
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		return sqlSession.selectOne("board.countArticle", map);
	}

}