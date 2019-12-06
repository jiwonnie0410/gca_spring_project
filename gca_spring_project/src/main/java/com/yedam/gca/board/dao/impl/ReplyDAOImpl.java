package com.yedam.gca.board.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.yedam.gca.board.dao.ReplyDAO;
import com.yedam.gca.board.vo.AdReplyVO;

@Repository
public class ReplyDAOImpl implements ReplyDAO {
	@Inject
	SqlSession sqlSession;
	
	// 1. 댓글 입력
		@Override
		public void create(AdReplyVO vo) {
			sqlSession.insert("reply.insertReply", vo);
		}
	// 2. 댓글 목록
	@Override
	public List<AdReplyVO> list(Integer ad_num,  int start, int end) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("ad_num", ad_num);
		map.put("start", start);
		map.put("end", end);
		return sqlSession.selectList("reply.listReply", map);
	}
	// 3. 댓글 상세보기
	@Override
	public AdReplyVO detail(Integer adr_num) {
		return sqlSession.selectOne("reply.detailReply", adr_num);
	}
	// 4. 댓글 수정
	@Override
	public void update(AdReplyVO vo) {
		sqlSession.update("reply.updateReply", vo);
	}
	// 5. 댓글 삭제
	@Override
	public void delete(Integer adr_num) {
		sqlSession.delete("reply.deleteReply", adr_num);
	}
	// 6. 댓글 갯수
	@Override
	public int count(Integer ad_num) {
		return sqlSession.selectOne("reply.countReply", ad_num);
	}

}
