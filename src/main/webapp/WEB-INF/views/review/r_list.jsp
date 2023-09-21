<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>후기게시판 목록</title>
		<link rel="stylesheet" href="/resources/css/review/r_list.css">
		<link rel="stylesheet" href="/resources/css/user/header.css">
		<link rel="stylesheet" href="/resources/css/user/footer.css">
		<link rel="stylesheet" href="/resources/css/reset.css">
	</head>
	<body>
			<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
		
		<div class="container">
			<div class="center">
				<div class="noticetitle">
					<span>후기게시판</span>
				</div>
				<hr>
				<div>
					<form action="/review/r_search.do" method="get">
						<select name="searchCondition">
								<option value="all">전체</option>
								<option value="title">제목</option>
								<option value="content">내용</option>
								<option value="writer">작성자</option>
						</select>
						<input type="text" name="searchKeyword" placeholder="검색">
						<input type="submit" value="검색">
					</form>
				</div>
				<table class="reviewtable">
					<thead>
						<tr>
							<th>유형</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="review" items="${rList }" varStatus="i">
						<tr>
							<td>
								<c:if test="${notice.noticeType eq '여행지' }"><span>여행지</span></c:if>
								<c:if test="${notice.noticeType eq '축제' }"><span>축제</span></c:if>
							</td>
							<c:url var="detailUrl" value="/review/r_detail.do">
								<c:param name="reviewNo" value="${review.reviewNo }" />
							</c:url>
							<td><a href="${detailUrl }">${review.reviewTitle }</a></td>
							<td>${review.rUserId }</td>
							<td>
								<fmt:formatDate pattern="yyyy-MM-dd" value="${review.reviewDate }"/>
							</td>
						</tr>
					</c:forEach>
					</tbody>
				<div class="paging">
					<c:if test="${rInfo.rStartNavi != 1}">
						<c:url var="preUrl" value="/review/r_list.do">
							<c:param name="page" value="${rInfo.rStartNavi -1 }" />
						</c:url>
						<a href="${preUrl }">[이전]</a>
					</c:if>
					<c:forEach begin="${rInfo.rStartNavi }" end="${rInfo.rEndNavi }" var = "r">
						<c:url var="pageUrl" value="/review/r_list.do">
							<c:param name="page" value="${r }"></c:param>
						</c:url>
						<a href="${pageUrl }">${r }</a>&nbsp;
					</c:forEach>
					<c:if test="${rInfo.rEndNavi != rInfo.rNaviTotalCount }">
						<c:url var="nextUrl" value="/review/r_list.do">
							<c:param name="page" value="${rInfo.rEndNavi +1 }" />
						</c:url>
						<a href="${nextUrl }">[다음]</a>
					</c:if>
				</div>
				</table>
				<div class="bottom">
					<div>
						<button type="button" onclick="showRegisterRForm()">글쓰기</button>
					</div>
				</div>
			</div>
		</div>
		
			<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
					<script>
			function showRegisterRForm(){
				location.href="/review/r_insert.do"
			}
		</script>
	</body>
</html>