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
				<div class="noticesubject">
    				<span>상세보기</span>
    			</div>
    			<div class="title">
    				<span>${review.reviewTitle }</span>
    			</div>
    			<div class="button-1">
    				<button type="button" onclick="showModifyPage('${modifyUrl }');">수정하기</button>
    				<button type="button" onclick="deleteReview('${reviewDelUrl }');">삭제하기</button>
    			</div>
    			<hr>
    			<div>
    				<span>${review.reviewContent }</span>
    			</div>
    			<div>
    				<button type="button" onclick="showReviewList();">목록으로</button>
    			</div>
    			<!-- ****댓글****  -->
    			<table width="550" border="1">
		<c:forEach var="reply" items="${rrList }">
		
			<tr>
				<td>${rreply.rrUserId }</td>
				<td>${rreply.rReplyContent }</td>
				<td>${rreply.rReplyDate }</td>
				<td>
					<a href="javascript:void(0);" onclick="showModifyForm(this, '${rreply.rReplyContent }');">수정하기</a>
					<c:url var="delUrl" value="/rreply/delete.do">
						<c:param name="rReplyNo" value="${rreply.rReplyNo }" />
<!-- 						내것만 지우도록 하기 위해서 replyWriter를 추가함 -->
						<c:param name="rrUserId" value="${rreply.rrUserId }" />
<!-- 						성공하면 디테일로 가기 위해 필요한 boardNo셋팅 -->
						<c:param name="rReviewNo" value="${rreply.rReviewNo }" />
					</c:url>
					<a href="javascript:void(0);" onclick="deleteReply('${delUrl}');">삭제하기</a>
				</td>
			</tr>
			<tr id="rreplyModifyForm" style="display:none">
<!-- 			<form action ="/reply/update.kh" method="post"> -->
<%-- 				<input type="hidden" name="replyNo" value="${reply.replyNo }"> --%>
<%-- 				<input type="hidden" name="refBoardNo" value="${reply.refBoardNo }"> --%>
<%-- 				<td colspan="3"><input type="text" size="50" name = "replyContent" value="${reply.replyContent }"></td> --%>
<!-- 				<td><input type="submit" value="완료"></td> -->
<!-- 			</form> -->
				<td colspan="3"><input id="rReplyContent" type="text" size="50" name = "rReplyContent" value="${rreply.rReplyContent }"></td>
<!-- 				 this로 눌리는거(완료) 옆에껄 가져옴 -->
				<td><input type="button" onclick="replyModify(this, '${rreply.rReplyNo }', '${rreply.rReviewNo }');" value="완료"></td>
			</tr>
		</c:forEach>
		</table>
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
		const deleteReview = (reviewUrl) => {
		 location.href = reviewUrl;
		}
		
		
		
		function replyModify(obj, rReplyNo, rReviewNo){
			// DOM 프로그래밍을 이용하는 방법
			const form = document.createElement("form");
			form.action = "/rreply/modify.do";
			form.method ="post";
			const input = document.createElement("input");
			input.type = "hidden";
			input.value = replyNo;
			input.name = "rReplyNo";
			const input2 = document.createElement("input");
			input2.type = "hidden";
			input2.value = refBoardNo;
			input2.name = "rReviewNo";
			const input3 = document.createElement("input");
			input.type = "text";
			// 여기를 this를 이용하여 수정해주세요!!
//				input3.value = document.querySelector("#replyContent").value;
			// this를 이용하여 내가 원하는 노드 찾기(this를 이용한 노드 탐색)
			input3.value = obj.parentElement.previousElementSibling.childNodes[0].value;
//				obj.parentElement.previousElementSibling.children[0].value;
			input3.name = "rReplyContent";
			form.appendChild(input);
			form.appendChild(input2);
			form.appendChild(input3);
			
			document.body.appendChild(form);
			form.submit();
		}
		function showModifyForm(obj, replyContent){
			// #1. HTML태그, display:none 사용하는 방법
			obj.parentElement.parentElement.nextElementSibling.style.display="";

		}
	function deleteReply(url){
		location.href = url; 
	}
    </script>
	</body>
</html>