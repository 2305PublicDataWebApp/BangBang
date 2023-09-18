package kr.co.bangbang.trip.service;

import java.util.List;

import kr.co.bangbang.trip.domain.TReply;

public interface TReplyService {

	List<TReply> selectTReplyList(int tTripNo);

}
