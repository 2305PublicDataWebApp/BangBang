package kr.co.bangbang.review.store;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import kr.co.bangbang.review.domain.RPageInfo;
import kr.co.bangbang.review.domain.Review;
import kr.co.bangbang.user.domain.UPageInfo;

public interface ReviewStore {



	/**
	 * 마이페이지 - 게시글 전체 갯수 조회
	 * @param sqlSession
	 * @param userId 
	 * @return
	 */
	int selectBoardCount(SqlSession sqlSession, String sessionId);

	/**
	 * 마이페이지 - 게시글 목록 조회
	 * @param sqlSession
	 * @param pInfo
	 * @param userId 
	 * @return List<Review>
	 */
	List<Review> selectReviewList(SqlSession sqlSession, UPageInfo pInfo, String sessionId);

	/**
	 * 메인페이지 - 후기 목록 조회
	 * @param sqlSession
	 * @return
	 */
	List<Review> selectReviewList(SqlSession sqlSession);

	/**
	 * 게시글 번호에 맞는 게시글 상세 조회
	 * @param sqlSession
	 * @param reviewNo
	 * @return
	 */
	Review selectReviewByNo(SqlSession sqlSession, Integer reviewNo);

	/**
	 * 전체 게시글 갯수
	 * @param sqlSession
	 * @return
	 */
	int selectListCount(SqlSession sqlSession);

	/**
	 * 게시글 리스트 조회(페이징 처리)
	 */
	List<Review> selectReviewByList(SqlSession sqlSession, RPageInfo rInfo);

	/**
	 * 게시글 작성
	 * @param sqlSession
	 * @param review
	 * @return
	 */
	int insertReview(SqlSession sqlSession, Review review);

	/**
	 * 게시글 삭제
	 * @param sqlSession
	 * @param review
	 * @return
	 */
	int deleteReview(SqlSession sqlSession, Review review);

	/**
	 * 게시글 수정
	 * @param sqlSession
	 * @param review
	 * @return
	 */
	int modifyReview(SqlSession sqlSession, Review review);

	/**
	 * 키워드 검색
	 * @param sqlSession
	 * @param rInfo
	 * @param rparamMap
	 * @return
	 */
	List<Review> searchReviewByKeyword(SqlSession sqlSession, RPageInfo rInfo, Map<String, String> rparamMap);

	/**
	 * 검색 게시글 전체 갯수
	 * @param sqlSession
	 * @param rparamMap
	 * @return
	 */
	int selectListCount(SqlSession sqlSession, Map<String, String> rparamMap);


}
