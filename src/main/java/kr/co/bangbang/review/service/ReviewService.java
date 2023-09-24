package kr.co.bangbang.review.service;

import java.util.List;
import java.util.Map;

import kr.co.bangbang.review.domain.RPageInfo;
import kr.co.bangbang.review.domain.Review;
import kr.co.bangbang.user.domain.UPageInfo;

public interface ReviewService {


	/**
	 * 마이페이지 - 게시글 전체 갯수 조회
	 * @param userId 
	 * @return
	 */
	int getListCount(String sessionId);

	/**
	 * 마이페이지 - 게시글 목록 조회
	 * @param pInfo
	 * @param userId 
	 * @return List<Review>
	 */
	List<Review> selectReviewList(UPageInfo pInfo, String sessionId);

	/**
	 * 메인페이지 - 후기 목록 조회
	 * @return
	 */
	List<Review> selectReviewList();

	/**
	 * 게시글 번호에 맞는 게시글 상세 조회
	 * @param reviewNo
	 * @return
	 */
	Review selectReviewByNo(Integer reviewNo);

	/**
	 * 전체 게시글 갯수
	 * @return
	 */
	Integer getRListCount();

	/**
	 * 게시글 리스트 조회(페이징 처리)
	 * @param rInfo
	 * @return
	 */
	List<Review> selectReviewList(RPageInfo rInfo);

	/**
	 * 게시글 작성
	 * @param review
	 * @return
	 */
	int insertReview(Review review);

	/**
	 * 게시글 삭제
	 * @param review
	 * @return
	 */
	int deleteReview(Review review);

	/**
	 * 게시글 수정
	 * @param review
	 * @return
	 */
	int modifyReview(Review review);

	/**
	 * 키워드 검색
	 * @param rInfo
	 * @param rparamMap
	 * @return
	 */
	List<Review> searchReviewByKeyword(RPageInfo rInfo, Map<String, String> paramMap);

	/**
	 * 검색 게시글 전체 갯수
	 * @param rparamMap
	 * @return
	 */
	int getRListCount(Map<String, String> paramMap);


	

}
