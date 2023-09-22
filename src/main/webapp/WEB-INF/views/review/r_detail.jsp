<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>후기게시판상세</title>
		<link rel="stylesheet" href="/resources/css/review/r_detail.css">
		<link rel="stylesheet" href="/resources/css/user/header.css">
		<link rel="stylesheet" href="/resources/css/user/footer.css">
		<link rel="stylesheet" href="/resources/css/reset.css">
	</head>
	<body>
			<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
		
		<div class="container">
			<div class="center">
    			<div class="title">
    				<span>${review.reviewTitle }</span>
    			</div>
    			<div class="button-1">
    				<button class="modibu" type="button" onclick="showModifyPage('${modifyUrl }');">수정하기</button>
    				<button class="delbu" type="button" onclick="deleteReview('${deleteUrl}');">삭제하기</button>
    			</div>
    			<hr>
    			<div class="revicontent">
    				<span>${review.reviewContent }</span>
    			</div>
    			<div>
    				<button class="golist" type="button" onclick="showReviewList();">목록으로</button>
    			</div>
			<hr>
			
	                <!-- 댓글 등록 -->
<%-- 	                <form action="/rreply/rr_insert.do" method="post">
	                    <div>
	                        <input type="hidden" name="rReviewNo" value="${review.reviewNo }">
	                        <textarea rows="4" cols="100" name="rReplyContent"></textarea>
	                        <div style="display: flex; justify-content: right;">
	                            <input type="submit" value="등록">
	                        </div>
	                    </div>
	                </form> --%>
	                
	                <!-- 댓글 목록 -->
	                <div>
		            	<c:forEach var="rReply" items="${rrList }">
		                    <div id="reply-list" style="border-bottom: 1px solid black;">
		                        <div style="display: inline-block; width: 30px; height: 30px;">
		                            <img src="" alt="a">
		                        </div>
		                        <span>${rreply.rrUserId }</span>
		                        <span>${rreply.rReplyDate }</span>
		                        <button>답글</button>
		                        <button onclick="showModifyForm(this);">수정</button>
		                        <button onclick= "deleteRReply('${rDelUrl}');">삭제</button>
		                        <p>${rreply.rReplyContent }</p>
		                    </div> 
		                    <div id="rReplyModifyForm" style="display:none;">
						<!-- 			<form action="/reply/update.kh" method="post"> -->
						<%-- 				<input type="hidden" name="replyNo" value="${reply.replyNo }"> --%>
						<%-- 				<input type="hidden" name="refBoardNo" value="${reply.refBoardNo }"> --%>
						<%-- 					<td colspan="3"><input type="text" size="50" name="replyContent" value="${reply.replyContent }"></td> --%>
						<!-- 				<td><input type="submit" value="완료"></td> -->
						<!-- 			</form> -->
								<input id="replyContent" type="text" size="50" name="rReplyContent" value="${reply.rReplyContent }">
								<input type="button" onclick="rReplyModify(this,'${rreply.rReplyNo}', '${rreply.rReviewNo }');" value="완료">
		                    </div>
		                </c:forEach>
	                </div>
	                
	                
	                	                
		</div>
			</div>
			<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
	<script>
    	function showReviewList(){
    		location.href="/review/r_list.do";
    	}
    	function showModifyPage(modifyUrl){
    		const reviewNo = "${review.reviewNo}"
			location.href="/review/r_modify.do?reviewNo="+reviewNo;
		}
		function deleteReview(deleteUrl){
			const reviewNo = "${reivew.reviewNo}"
			location.href = "/review/r_delete.do?reviewNo="+reviewNo;
		}
		
		
    </script>
	</body>
</html>