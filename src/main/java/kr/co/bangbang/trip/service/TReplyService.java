package kr.co.bangbang.trip.service;

import java.util.List;

import kr.co.bangbang.trip.domain.TReply;

public interface TReplyService {

	List<TReply> selectTReplyList(int tTripNo);

	/**
	 * 댓글 등록 Service
	 * @param tReply
	 * @return
	 */
	int insertTReply(TReply tReply);

	/**
	 * 댓글 수정 Service
	 * @param tReply
	 * @return
	 */
	int updateTReply(TReply tReply);

	/**
	 * 댓글 삭제 Store
	 * @param tReply
	 * @return
	 */
	int deleteTReply(TReply tReply);

	/**
	 * 댓글 전체 갯수 Service
	 * @param tripNo
	 * @return
	 */
	int selectTReplyTotalCount(int tTripNo);

}
