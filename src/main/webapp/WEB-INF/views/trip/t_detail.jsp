<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
	<head>
	    <meta charset="UTF-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <title>여행지 상세 페이지</title>
	    <link rel="stylesheet" href="/resources/css/trip/t_detail.css">
	</head>
	<body>
	    <header>
	
	    </header>
	    <main>
	        <div id="main-container">
	            <div id="title">
	                    <p style="font-size: 30px; font-weight: bold; margin-bottom: 15px;">${trip.tripTitle }</p>
	                    <p style="font-size: 15px; margin-bottom: 28px;">${trip.tripAddr }</p>
	                    <p style="font-size: 20px;">${trip.tripSummary }</p>
	            </div>
	            <div id="review-btn">
	                <p>조회수
	                    <span>5</span>
	                </p>
	                <div>
	                    <button>수정</button>
	                    <button>삭제</button>
	                </div>
	            </div>
	            <div id="semi-info">
	                <div style="display: inline-block; width: 49%;">
	                    <b style="margin-right: 20px;">주소</b>
	                    <span>${trip.tripInfoAddr }</span>
	                </div>
	                <div style="display: inline-block; width: 49%;">
	                    <b>홈페이지</b>
	                    <a href="https://${trip.tripHomePage }">${trip.tripHomePage }</a>
	                </div>
	                <div style="display: inline-block; width: 49%;">
	                    <b>이용시간</b>
	                    <span>${trip.tripTime }</span>
	                </div>
	                <div style="display: inline-block; width: 49%;">
	                    <b>이용금액</b>
	                    <span>${trip.tripPrice }</span>
	                </div>
	            </div>
	            <div id="summer-note">
	
	            </div>
	            <div id="button">
	                <button>목록으로</button>
	            </div>
	            <div id="reply">
	                <p>댓글
	                    <span>0</span>
	                </p>
	                <form action="/tReply/add.do" method="post" style="background-color: rgb(251, 254, 208);">
	                    <div style="background-color: rgb(251, 254, 208); width: 90%; margin: 0 auto;">
	                        <input type="hidden" name="tTripNo" value="${trip.tripNo }">
	                        <textarea rows="4" cols="100" name="replyContent"></textarea>
	                        <div style="display: flex; justify-content: right;">
	                            <button>등록</button>
	                        </div>
	                    </div>
	                </form>
	                <div>
		            	<c:forEach var="tReply" items="${tRList }">
		                    <div id="reply-list" style="border-bottom: 1px solid black;">
		                        <div style="display: inline-block; width: 30px; height: 30px;">
		                            <img src="" alt="a">
		                        </div>
		                        <span>${tReply.tRUserId }</span>
		                        <span>${tReply.tReplyDate }</span>
		                        <button>답글</button>
		                        <button>수정</button>
		                        <button>삭제</button>
		                        <p>${tReply.tReplyContent }</p>
		                    </div>
		                </c:forEach>
	                </div>
	            </div>
	        </div>
	    </main>
	    <footer>
	        
	    </footer>
	</body>
</html>