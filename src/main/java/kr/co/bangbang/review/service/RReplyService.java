package kr.co.bangbang.review.service;

import java.util.List;

import kr.co.bangbang.review.domain.RReply;

public interface RReplyService {

	List<RReply> selectReplyList(int rReviewNo);

	int insertRReply(RReply rreply);

	int modifyRReply(RReply rreply);

	int deleteRReply(RReply rreply);

	int selectRReplyTotalCount(int rReviewNo);


}
