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

	@Override
	public int insertReview(SqlSession sqlSession, Review review) {
		int result = sqlSession.insert("ReviewMapper.insertReview", review);
		return result;
	}

	@Override
	public int modifyReview(SqlSession sqlSession, Review review) {
		int result = sqlSession.update("ReviewMapper.modifyReview", review);
		return result;
	}

	@Override
	public int deleteReview(SqlSession sqlSession, Review review) {
		int result = sqlSession.update("ReviewMapper.deleteReview", review);
		return result;
	}

	@Override
	public int selectListCount(SqlSession sqlSession) {
		int result = sqlSession.selectOne("ReviewMapper.selectListCount");
		return result;
	}

	@Override
	public Review selectReviewByNo(SqlSession sqlSession, Integer reviewNo) {
		Review reviewOne = sqlSession.selectOne("ReviewMapper.selectReviewByNo", reviewNo);
		return reviewOne;
	}

	@Override
	public List<Review> selectReviewByList(SqlSession sqlSession, RPageInfo rInfo) {
		int limit = rInfo.getrRecordCountPerPage();
		int offset = (rInfo.getrCurrentPage()-1)*limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<Review> rList = sqlSession.selectList("ReviewMapper.selectReviewByList", null, rowBounds);
		return rList;
	}

	@Override
	public List<Review> selectReviewByKeyword(SqlSession sqlSession, RPageInfo rInfo, Map<String, String> rParamMap) {
		int limit = rInfo.getrRecordCountPerPage();
		int offset = (rInfo.getrCurrentPage()-1)*limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		List<Review> searchList = sqlSession.selectList("ReviewMapper.selectReviewByKeyword", rParamMap, rowBounds);
		return searchList;
	}

	@Override
	public int selectListCount(SqlSession sqlSession, Map<String, String> rParamMap) {
		int result = sqlSession.selectOne("ReviewMapper.selectReviewByKeywordCount", rParamMap);
		return result;
	}

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
		List<Review> rList = sqlSession.selectList("ReviewMapper.selectReviewList");
		return rList;
	}

}
