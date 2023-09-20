package kr.co.bangbang.review.store;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import kr.co.bangbang.review.domain.RPageInfo;
import kr.co.bangbang.review.domain.Review;

public interface ReviewStore {

	int insertReview(SqlSession sqlSession, Review review);

	int modifyReview(SqlSession sqlSession, Review review);

	int deleteReview(SqlSession sqlSession, Review review);

	int selectListCount(SqlSession sqlSession);

	Review selectReviewByNo(SqlSession sqlSession, Integer reviewNo);

	List<Review> selectReviewByList(SqlSession sqlSession, RPageInfo rInfo);

	List<Review> selectReviewByKeyword(SqlSession sqlSession, RPageInfo rInfo, Map<String, String> rParamMap);

	int selectListCount(SqlSession sqlSession, Map<String, String> rParamMap);

}
