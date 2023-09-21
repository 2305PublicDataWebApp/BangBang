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
		<form action="/rreply/rr_insert.do" method="post">
		<input type="hidden" name="rReviewNo" value="${review.reviewNo }">
			<table width="500">
				<tr>
					<td>
						<textarea rows="3" cols="55" name="rReplyContent"></textarea>
					</td>
					<td>
						<input type="submit" value="완료">
					</td>
				</tr>
			</table>
		</form>
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