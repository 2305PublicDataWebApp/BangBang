package kr.co.bangbang.review.service;

import java.util.List;
import java.util.Map;

import kr.co.bangbang.review.domain.RPageInfo;
import kr.co.bangbang.review.domain.Review;

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
	int getRListCount();

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
	
	

}
