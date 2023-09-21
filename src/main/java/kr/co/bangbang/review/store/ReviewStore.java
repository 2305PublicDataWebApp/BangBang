package kr.co.bangbang.review.store;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import kr.co.bangbang.review.domain.RPageInfo;
import kr.co.bangbang.review.domain.Review;
import kr.co.bangbang.user.domain.UPageInfo;

public interface ReviewStore {

	int insertReview(SqlSession sqlSession, Review review);

	int modifyReview(SqlSession sqlSession, Review review);

	int deleteReview(SqlSession sqlSession, Review review);

	int selectListCount(SqlSession sqlSession);

	Review selectReviewByNo(SqlSession sqlSession, Integer reviewNo);

	List<Review> selectReviewByList(SqlSession sqlSession, RPageInfo rInfo);

	List<Review> selectReviewByKeyword(SqlSession sqlSession, RPageInfo rInfo, Map<String, String> rParamMap);

	int selectListCount(SqlSession sqlSession, Map<String, String> rParamMap);

	/**
	 * 마이페이지 - 게시글 전체 갯수 조회
	 * @param sqlSession
	 * @param userId 
	 * @return
	 */
	int selectBoardCount(SqlSession sqlSession, String userId);

	/**
	 * 마이페이지 - 게시글 목록 조회
	 * @param sqlSession
	 * @param pInfo
	 * @param userId 
	 * @return List<Review>
	 */
	List<Review> selectReviewList(SqlSession sqlSession, UPageInfo pInfo, String userId);

	/**
	 * 메인페이지 - 후기 목록 조회
	 * @param sqlSession
	 * @return
	 */
	List<Review> selectReviewList(SqlSession sqlSession);

}
