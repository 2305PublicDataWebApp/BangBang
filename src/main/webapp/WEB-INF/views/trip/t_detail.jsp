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
	    <link rel="stylesheet" href="/resources/css/user/footer.css">
	    <link rel="stylesheet" href="/resources/css/user/header.css">
	    <link rel="stylesheet" href="/resources/css/reset.css">
	    <script src="https://unpkg.com/react@17.0.2/umd/react.production.min.js" crossorigin></script>
		<script src="https://unpkg.com/react-dom@17.0.2/umd/react-dom.production.min.js" crossorigin></script>
		<script src="https://unpkg.com/@babel/standalone/babel.min.js"></script>
	</head>
	<body>
		<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
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
	                <c:if test="${adminId ne null }">
		                <div>
		                <c:url var="tModifyUrl" value="/trip/t_modify.do">
							<c:param name="tripNo" value="${trip.tripNo }"></c:param>
							<c:param name="tAdminId" value="${trip.tAdminId }"></c:param>
						</c:url>
						<c:url var="tDelUrl" value="/trip/t_delete.do">
							<c:param name="tripNo" value="${trip.tripNo }"></c:param>
							<!-- 내가 쓴 게시글만 지울 수 있게 확인하기 위한 코드...? -->
							<c:param name="tAdminId" value="${trip.tAdminId }"></c:param>
						</c:url>
						<c:if test="${ adminId ne null}">
		                    <button id="btnbtn" onclick="showModify('${tModifyUrl}')">수정</button>
		                    <button id="btnbtn" onclick="deleteTrip('${tDelUrl }');">삭제</button>
		                </c:if>
		                </div>
					</c:if>
	                
	            </div>
	            <div id="semi-info">
	                <div style="display: inline-block; width: 49%;">
	                    <b>주소</b>
	                    <span>${trip.tripInfoAddr }</span>
	                </div>
	                <div style="display: inline-block; width: 49%;">
	                    <b>홈페이지</b>
	                    <a href="${trip.tripHomePage }">${trip.tripHomePage }</a>
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
	            	<img alt="첨부파일" src="${trip.tripFilepath }">
					<pre>${trip.tripContent }</pre>
	            </div>
	            <div id="button">
	                <button id="btnbtn" onclick="showTripList();">목록으로</button>
	            </div>
	            <div id="reply">
	                <p>댓글
	                    <span>${tReplyCount }</span>
	                </p>
	                <!-- 댓글 등록 -->
	                <form action="/tReply/add.do" method="post" style="background-color: rgb(251, 254, 208);">
	                    <div style="background-color: rgb(251, 254, 208); width: 90%; margin: 0 auto;">
	                        <input type="hidden" name="tTripNo" value="${trip.tripNo }">
	                        <textarea rows="4" cols="100" name="tReplyContent"></textarea>
	                        <div style="display: flex; justify-content: right;">
	                            <input type="submit" value="등록">
	                        </div>
	                    </div>
	                </form>
	                
	                <!-- 댓글 목록 -->
	                <div>
		            	<c:forEach var="tReply" items="${tRList }">
		                    <div id="reply-list" style="border-bottom: 1px solid black;">
<!-- 		                        <div style="display: inline-block; width: 30px; height: 30px;"> -->
<!-- 		                            <img src="" alt="a"> -->
<!-- 		                        </div> -->
		                        <span>${tReply.tRUserId }</span>
		                        <span>${tReply.tReplyDate }</span>
		                        <input type="hidden" name="tRAdminId" value="${tReply.tRAdminId }">
		                        <button  id="btnbtn">답글</button>
		                        <c:if test="${tReply.tRUserId eq userId }">
			                        <button  id="btnbtn" onclick="showModifyForm(this);">수정</button>
			                        <button id="btnbtn" onclick= "deleteTReply('${tDelUrl}');">삭제</button>
		                        </c:if>
		                        <c:if test="${adminId ne null }">
<!-- 			                        <button onclick="showModifyForm(this);">수정</button> -->
			                        <button id="btnbtn" onclick= "deleteTReply('${tDelUrl}');">삭제</button>
		                        </c:if>
		                        <p id="reply">${tReply.tReplyContent }</p>
		                    </div> 
		                    <div id="tReplyModifyForm" style="display:none;">
						<!-- 			<form action="/reply/update.kh" method="post"> -->
						<%-- 				<input type="hidden" name="replyNo" value="${reply.replyNo }"> --%>
						<%-- 				<input type="hidden" name="refBoardNo" value="${reply.refBoardNo }"> --%>
						<%-- 					<td colspan="3"><input type="text" size="50" name="replyContent" value="${reply.replyContent }"></td> --%>
						<!-- 				<td><input type="submit" value="완료"></td> -->
						<!-- 			</form> -->
								<input id="tReplyContent" type="text" size="50" name="tReplyContent" value="${tReply.tReplyContent }">
								<input type="button" onclick="tReplyModify(this,'${tReply.tReplyNo}', '${tReply.tTripNo }');" value="완료">
		                    </div>
		                </c:forEach>
	                </div>
	            </div>
	        </div>
	    </main>
	    <jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
	    <script>
			function showModify(tModifyUrl) {
				location.href = tModifyUrl
//  				const tripNo = "${trip.tripNo}";
//  				location.href="/trip/t_modify.do?tripNo=" + tripNo;
			}
			function deleteTrip(tDelUrl) {
				location.href = tDelUrl
			}
			function showTripList() {
				location.href="/trip/t_list.do";
			}
			function showModifyForm(obj, tReplyContent){
				// 1. HTML 태그, display:none 사용하는 방법
				obj.parentElement.nextElementSibling.style.display = "";
			}
			
			// this를 넘기고 obj로 받아서 버튼 옆에있는 데이터를 업데이트 치도록 함
			function tReplyModify(obj, tReplyNo, tTripNo) {  // obj를 이용해서 this 사용하기
				// DOM프로그래밍을 이용하는 방법
				const form = document.createElement("form");
				form.action ="/tReply/update.do";
				form.method ="post";
				
				const input = document.createElement("input");
				input.type ="hidden";
				input.value = tReplyNo;
				input.name = "tReplyNo";
				
				const input2 = document.createElement("input");
				input2.type ="hidden";
				input2.value = tTripNo;
				input2.name ="tTripNo";

				const input3 = document.createElement("input");
				input3.type ="text";
				// 여기를 this를 이용하여 수정하기
// 				input3.value = document.querySelector("#tReplyContent").value;
				// this를 이용해서 내가 원하는 노드 찾기(this를 이용한 노트 탐색)
				input3.value = obj.previousElementSibling.value; // children[0]도 사용 가능 .value는 붙여야 함.
				// obj.previousElementSibling => <input type="text">의 위치가 됨
				input3.name ="tReplyContent";

				form.appendChild(input);  // appendChild(input) form태그에 input붙이기
				form.appendChild(input2);
				form.appendChild(input3);
				
				document.body.appendChild(form);  // body에 form 붙이기
				form.submit();
			}
		</script>
	</body>
</html>
