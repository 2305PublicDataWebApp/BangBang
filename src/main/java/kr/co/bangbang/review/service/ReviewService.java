package kr.co.bangbang.review.service;

import java.util.List;
import java.util.Map;

import kr.co.bangbang.review.domain.RPageInfo;
import kr.co.bangbang.review.domain.Review;
import kr.co.bangbang.user.domain.UPageInfo;

public interface ReviewService {
	/**
	 * 후기 등록 Service
	 * @param review
	 * @return
	 */
	int insertReview(Review review);
	
	/**
	 * 후기 수정 Service
	 * @param review
	 * @return
	 */
	int modifyReview(Review review);

	/**
	 * 후기 삭제 Service
	 * @param review
	 * @return
	 */
	int deleteReview(Review review);

	/**
	 * 후기 전체 갯수 조회 Service
	 * @return
	 */
	Integer getRListCount();

	/**
	 * 후기 상세 조회 Service
	 * @param reviewNo
	 * @return
	 */
	Review selectReviewByNo(Integer reviewNo);

	/**
	 * 후기 목록 조회 Service
	 * @param rInfo
	 * @return
	 */
	List<Review> selectReviewList(RPageInfo rInfo);

	List<Review> searchReviewByKeyword(RPageInfo rInfo, Map<String, String> rParamMap);

	int getRListCount(Map<String, String> rParamMap);

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
	

}
