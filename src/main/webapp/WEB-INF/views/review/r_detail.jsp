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
    			<c:url var="deleteUrl" value="/review/r_delete.do">
    				<c:param name="reviewNo" value="${review.reviewNo }" />
    				<c:param name="rUserId" value="${review.rUserId }" />
    			</c:url>
    			<c:url var="modifyUrl" value="/review/r_modify.do">
    				<c:param name="reviewNo" value="${review.reviewNo }" />
    				<c:param name="rUserId" value="${review.rUserId }" />
    			</c:url>
    				<c:if test="${review.rUserId eq userId }">
    					<button class="modibu" type="button" onclick="showModifyPage('${modifyUrl }');">수정하기</button>
    					<button class="delbu" type="button" onclick="deleteReview('${deleteUrl}');">삭제하기</button>
    				</c:if>
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
	                <form action="/rreply/rr_insert.do" method="post">
	                        <input type="hidden" name="rReviewNo" value="${review.reviewNo }">
	                <table>
	                <tr>
	                	<td>
	                        <textarea rows="4" cols="100" name="rReplyContent" class="textre"></textarea>
	                	</td>
	                    <td>
	                         <input class="replymodi" type="submit" value="등록">
	                    </td>
	                </tr>
	                </table>
	                </form>
	                
	                <!-- 댓글 목록 -->
	                <div>
	                <table class="replyta">
		            	<c:forEach var="rreply" items="${rrList }">
		            	<tr>
		                        <td>${rreply.rrUserId }</td>
		                        <td>(${rreply.rReplyDate })</td>
		                        <td>${rreply.rReplyContent }</td>
		                        <input type="hidden" name="rrAdminId" value="${rreply.rrAdminId }">
		                        <td>
		                        <c:if test="${rreply.rrUserId eq userId}">
		                        <a class="mo" href="javascript:void(0);" onclick="showModifyForm(this, '${rreply.rReplyContent }');">수정하기</a>
						<c:url var="delUrl" value="/rreply/rr_delete.do">
							<c:param name="rReplyNo" value="${rreply.rReplyNo }" />
<!-- 						내것만 지우도록 하기 위해서 replyWriter를 추가함 -->
						<c:param name="rrUserId" value="${rreply.rrUserId }" />
<!-- 						성공하면 디테일로 가기 위해 필요한 boardNo셋팅 -->
						<c:param name="rReviewNo" value="${rreply.rReviewNo }" />
						</c:url>
					<a href="javascript:void(0);" onclick="deleteReply('${delUrl}');">삭제하기</a>
					</td>
		            	</tr>
		                        </c:if>
		                        <c:if test="${adminId ne null }">
						<c:url var="delUrl" value="/rreply/rr_delete.do">
							<c:param name="rReplyNo" value="${rreply.rReplyNo }" />
<!-- 						내것만 지우도록 하기 위해서 replyWriter를 추가함 -->
						<c:param name="rrUserId" value="${rreply.rrUserId }" />
<!-- 						성공하면 디테일로 가기 위해 필요한 boardNo셋팅 -->
						<c:param name="rReviewNo" value="${rreply.rReviewNo }" />
						</c:url>
					<a href="javascript:void(0);" onclick="deleteReply('${delUrl}');">삭제하기</a>
		                        </c:if>
		                    <tr id="rReplyModifyForm" style="display:none;">
								<td><input class = "modite" id="rReplyContent" type="text" size="50" name="rReplyContent" value="${rreply.rReplyContent }"></td>
								<td><input type="button" onclick="rReplyModify(this,'${rreply.rReplyNo}', '${rreply.rReviewNo }');" value="완료"></td>
		                    </tr>
		                    <br/>
		                </c:forEach>
	                </table>
		                    </div> 
	                </div>
		</div>
			<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
	<script>
	// ###### 게시글 ######
    	function showReviewList(){
    		location.href="/review/r_list.do";
    	}
    	function showModifyPage(modifyUrl){
    		location.href = modifyUrl;
		}
		function deleteReview(deleteUrl){
			location.href = deleteUrl;
		}
		// ###### 댓글 #######
				function rReplyModify(obj, rReplyNo, rReviewNo){
					// DOM 프로그래밍을 이용하는 방법
					const form = document.createElement("form");
					form.action = "/rreply/rr_modify.do";
					form.method ="post";
					const input = document.createElement("input");
					input.type = "hidden";
					input.value = rReplyNo;
					input.name = "rReplyNo";
					const input2 = document.createElement("input");
					input2.type = "hidden";
					input2.value = rReviewNo;
					input2.name = "rReviewNo";
					const input3 = document.createElement("input");
					input.type = "text";
					input3.value = obj.parentElement.previousElementSibling.childNodes[0].value;
					input3.name = "rReplyContent";
					form.appendChild(input);
					form.appendChild(input2);
					form.appendChild(input3);
					
					document.body.appendChild(form);
					form.submit();
				}
				function showModifyForm(obj, rReplyContent){
					obj.parentElement.parentElement.nextElementSibling.style.display="";
				}
		function deleteReply(url){
			location.href = url;
		}
    </script>
	</body>
</html>