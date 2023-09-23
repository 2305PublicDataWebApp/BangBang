package kr.co.bangbang.review.store.logic;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.bangbang.review.domain.RPageInfo;
import kr.co.bangbang.review.domain.Review;
import kr.co.bangbang.review.store.ReviewStore;
import kr.co.bangbang.user.domain.UPageInfo;

@Repository
public class ReviewStoreLogic implements ReviewStore{


	// 마이페이지 - 게시글 전체 갯수 조회
	@Override
	public int selectBoardCount(SqlSession sqlSession, String sessionId) {
		int result = sqlSession.selectOne("ReviewMapper.selectBoardCount", sessionId);
		return result;
	}

	// 마이페이지 - 게시글 목록 조회
	@Override
	public List<Review> selectReviewList(SqlSession sqlSession, UPageInfo pInfo, String userId) {
		int limit = pInfo.getRecordCountPerPage();
		int offset = (pInfo.getCurrentPage()-1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<Review> rList = sqlSession.selectList("ReviewMapper.selectReviewList", userId, rowBounds);
		return rList;
	}

	// 메인페이지 - 후기 목록 조회
	@Override
	public List<Review> selectReviewList(SqlSession sqlSession) {
		List<Review> rList = sqlSession.selectList("ReviewMapper.selectRList");
		return rList;
	}

	// 게시글 번호에 맞는 게시글 상세 조회
	@Override
	public Review selectReviewByNo(SqlSession sqlSession, Integer reviewNo) {
		Review review = sqlSession.selectOne("ReviewMapper.selectReviewByNo", reviewNo);
		return review;
	}

	// 전체 게시글 갯수
	@Override
	public int selectListCount(SqlSession sqlSession) {
		int result = sqlSession.selectOne("ReviewMapper.selectListCount");
		return result;
	}

	// 게시글 리스트 조회(페이징 처리)
	@Override
	public List<Review> selectReviewByList(SqlSession sqlSession, RPageInfo rInfo) {
		int limit = rInfo.getrRecordCountPerPage();
		int offset = (rInfo.getrCurrentPage()-1)*limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<Review> rList = sqlSession.selectList("ReviewMapper.selectReviewByList", null, rowBounds);
		return rList;
	}

	// 게시글 작성
	@Override
	public int insertReview(SqlSession sqlSession, Review review) {
		int result = sqlSession.insert("ReviewMapper.insertReview", review);
		return result;
	}

	// 게시글 삭제
	@Override
	public int deleteReview(SqlSession sqlSession, Review review) {
		int result = sqlSession.update("ReviewMapper.deleteReview", review);
		return result;
	}

	// 게시글 수정
	@Override
	public int modifyReview(SqlSession sqlSession, Review review) {
		int result = sqlSession.update("ReviewMapper.modifyReview", review);
		return result;
	}

	// 키워드 검색
	@Override
	public List<Review> searchReviewByKeyword(SqlSession sqlSession, RPageInfo rInfo, Map<String, String> rparamMap) {
		int limit = rInfo.getrRecordCountPerPage();
		int offset = (rInfo.getrCurrentPage()-1)*limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<Review> searchRList = sqlSession.selectList("ReviewMapper.searchReviewByKeyword", rparamMap, rowBounds);
		return searchRList;
	}

	// 검색 게시글 전체 갯수
	@Override
	public int selectListCount(SqlSession sqlSession, Map<String, String> rparamMap) {
		int result = sqlSession.selectOne("ReviewMapper.selectListByKeywordCount", rparamMap);
		return result;
	}

}
